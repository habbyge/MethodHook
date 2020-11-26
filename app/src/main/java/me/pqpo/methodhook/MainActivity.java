package me.pqpo.methodhook;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import java.lang.reflect.Method;

public class MainActivity extends Activity {
    private static final String TAG = "iWatch.MainActivity";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button btnClick = (Button) findViewById(R.id.click);
        Button btnHook = (Button) findViewById(R.id.hook);
        Button btnRestore = (Button) findViewById(R.id.restore);

        btnClick.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
//                showToast("Hello!");
                printf("I love My family: Wifi Daught, Son !");
            }
        });

        btnHook.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    Method srcMethod = MainActivity.class.getDeclaredMethod(
                            "printf", String.class);
                    Method destMethod = MainActivity.class.getDeclaredMethod(
                            "printf_Hook", String.class);
                    HookManager.get().hookMethod(srcMethod, destMethod);
                } catch (NoSuchMethodException e) {
                    e.printStackTrace();
                }
            }
        });

        btnRestore.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
            }
        });
    }

    public void printf(String text) {
        Log.i(TAG, "printf: " + text);
    }

    public void printf_Hook(String iStr) {
        Log.i(TAG, "printf-Hook: " + iStr);
        Log.i(TAG, "printf-Hook: 0");
        Log.i(TAG, "printf-Hook: 1");
        Log.i(TAG, "printf-Hook: 2");
        Log.i(TAG, "printf-Hook: 3");
        Log.i(TAG, "printf-Hook: 4");
        Log.i(TAG, "printf-Hook: 5");
        Log.i(TAG, "printf-Hook: 6");
        Log.i(TAG, "printf-Hook: 7");
        Log.i(TAG, "printf-Hook: 8");
        Log.i(TAG, "printf-Hook: 9");

        int ix = 10000;
        Log.i(TAG, "printf-Hook: " + ix + 0);
        Log.i(TAG, "printf-Hook: " + ix + 1);
        Log.i(TAG, "printf-Hook: " + ix + 2);
        Log.i(TAG, "printf-Hook: " + ix + 3);
        Log.i(TAG, "printf-Hook: " + ix + 4);
        Log.i(TAG, "printf-Hook: " + ix + 5);
        Log.i(TAG, "printf-Hook: " + ix + 6);
        Log.i(TAG, "printf-Hook: " + ix + 7);
        Log.i(TAG, "printf-Hook: " + ix + 8);
        Log.i(TAG, "printf-Hook: " + ix + 9);

        HookManager.get().callOrigin(this, "I love Mali");
    }

    public void showToast(String msg) {
        Log.i(TAG, "showToast: " + msg);
        Toast toast = Toast.makeText(this, msg, Toast.LENGTH_SHORT);
        toast.show();
    }

    public void showHookToast(String msg) {
        Log.i(TAG, "showHookToast: " + msg);
        HookManager.get().callOrigin(this, msg + "(Hook)");
    }

    public void Toast_show() {
        Log.d("MainActivity", "Toast_show");
        HookManager.get().callOrigin(this);
    }
}
