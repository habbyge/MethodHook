package me.pqpo.methodhook;

import android.util.Log;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * Created by habbyge on 2020/11/25.
 */
public class MethodHook {
    private static final String TAG = "iWatch.MethodHook";

    public static void m1() {
    }
    public static void m2() {
    }

    private final Method srcMethod;
    private final Method hookMethod;

    private long backupMethodPtr; // 原方法地址

    public MethodHook(Method src, Method dest) {
        srcMethod = src;
        srcMethod.setAccessible(true);

        hookMethod = dest;
        hookMethod.setAccessible(true);
    }

    public void hook() {
        if (backupMethodPtr == 0) {
            backupMethodPtr = hook_native(srcMethod, hookMethod);
        }
    }

    public void restore() {
        if (backupMethodPtr != 0) {
            Log.i(TAG, "restore  begin");
            restore_native(srcMethod, backupMethodPtr);
            Log.i(TAG, "restore  success");
            backupMethodPtr = 0L;
        }
    }

    public void callOrigin(Object receiver, Object... args) throws
            InvocationTargetException, IllegalAccessException {

        if (backupMethodPtr != 0) {
            restore();
            srcMethod.invoke(receiver, args);
            hook();
        } else {
            srcMethod.invoke(receiver, args);
        }
    }

    private static native long hook_native(Method src, Method dest);
    private static native Method restore_native(Method src, long methodPtr);

    static {
        System.loadLibrary("method-hook-lib");
    }

}
