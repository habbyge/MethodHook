#include "util/log.h"

/**
 * Created by habbyge on 2020/11/24.
 */
static const char* kClassMethodHookChar = "me/pqpo/methodhook/MethodHook";

static struct {
    jmethodID m1;
    jmethodID m2;
    size_t methodSize;
} methodHookClassInfo;


static jlong methodHook(JNIEnv* env, jclass type,
                        jobject srcMethodObj,
                        jobject destMethodObj) {

    void* srcMethod = reinterpret_cast<void*>(env->FromReflectedMethod(srcMethodObj));
    void* destMethod = reinterpret_cast<void*>(env->FromReflectedMethod(destMethodObj));

    LOGV("methodHook: start !!!");

    int* backupMethod = new int[methodHookClassInfo.methodSize];
    // 备份原方法
    memcpy(backupMethod, srcMethod, methodHookClassInfo.methodSize);
    // 替换成新方法
    memcpy(srcMethod, destMethod, methodHookClassInfo.methodSize);
    // 返回原方法地址
    return reinterpret_cast<long>(backupMethod);
}

static jobject methodRestore(JNIEnv* env, jclass type,
                             jobject srcMethod, jlong methodPtr) {

    LOGV("methodRestore: start !!!");

    void* backupMethod = reinterpret_cast<void*>(methodPtr);
    void* artMethodSrc = reinterpret_cast<void*>(env->FromReflectedMethod(srcMethod));
    memcpy(artMethodSrc, backupMethod, methodHookClassInfo.methodSize);
    delete[] reinterpret_cast<int*>(backupMethod);

    LOGV("methodRestore: Success !!!");

    return srcMethod;
}

static JNINativeMethod gMethods[] = {
    {
        "hook_native",
        "(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)J",
        (void*) methodHook
    },
    {
        "restore_native",
        "(Ljava/lang/reflect/Method;J)Ljava/lang/reflect/Method;",
        (void*) methodRestore
    }
};

extern "C" JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void* reserved) {
    JNIEnv* env = nullptr;
    if (vm->GetEnv((void**) &env, JNI_VERSION_1_4) != JNI_OK) {
        return JNI_FALSE;
    }
    jclass classEvaluateUtil = env->FindClass(kClassMethodHookChar);
    if (env->RegisterNatives(classEvaluateUtil, gMethods,
                             sizeof(gMethods) / sizeof(gMethods[0])) < 0) {
        return JNI_FALSE;
    }
    methodHookClassInfo.m1 = env->GetStaticMethodID(classEvaluateUtil, "m1", "()V");
    methodHookClassInfo.m2 = env->GetStaticMethodID(classEvaluateUtil, "m2", "()V");

    methodHookClassInfo.methodSize = 
            reinterpret_cast<size_t>(methodHookClassInfo.m2) - 
            reinterpret_cast<size_t>(methodHookClassInfo.m1);

    return JNI_VERSION_1_4;
}
