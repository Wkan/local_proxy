package xyz.wkan.local_proxy;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.ProxyInfo;
import android.os.Build;

import androidx.annotation.NonNull;

import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** LocalProxyPlugin */
public class LocalProxyPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  private ConnectivityManager manager;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "local_proxy");
    channel.setMethodCallHandler(this);
    manager = (ConnectivityManager)flutterPluginBinding.getApplicationContext().getSystemService(Context.CONNECTIVITY_SERVICE);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getProxySettings")) {
      Map<String, String> proxy = getProxySettings();
      result.success(proxy);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  private Map<String, String> getProxySettings() {
    if (android.os.Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
      ProxyInfo defaultProxy = manager.getDefaultProxy();

      if (defaultProxy != null) {
        Map<String, String> map = new HashMap<>();
        map.put("host", defaultProxy.getHost());
        map.put("port", Integer.toString(defaultProxy.getPort()));
        return map;
      }
    }
    return null;
  }
}
