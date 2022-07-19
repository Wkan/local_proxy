import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'local_proxy.dart';
import 'local_proxy_platform_interface.dart';

/// An implementation of [LocalProxyPlatform] that uses method channels.
class MethodChannelLocalProxy extends LocalProxyPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('local_proxy');

  @override
  Future<ProxySetting?> getProxySettings() async {
    if (Platform.isAndroid) {
      dynamic proxySettingRes = await methodChannel.invokeMethod('getProxySettings');
      if (proxySettingRes != null) {
        Map<String, dynamic> proxySetting = Map<String, dynamic>.from(proxySettingRes);
        return ProxySetting(
          host: proxySetting['host'].toString(),
          port: proxySetting['port'].toString(),
        );
      }
    } else if (Platform.isIOS) {
      // 有代理时
      // {FTPPassive: 1, HTTPEnable: 1, HTTPPort: 8899, HTTPSProxy: 127.0.0.1, HTTPSPort: 8899, __SCOPED__: {en0: {HTTPEnable: 1, HTTPPort: 8899, HTTPSProxy: 127.0.0.1, HTTPSPort: 8899, FTPPassive: 1, HTTPProxy: 127.0.0.1, SOCKSEnable: 0, HTTPSEnable: 1}}, HTTPProxy: 127.0.0.1, HTTPSEnable: 1, SOCKSEnable: 0}
      // 无代理时
      // {FTPPassive: 1, HTTPEnable: 0, __SCOPED__: {en0: {HTTPEnable: 0, FTPPassive: 1, SOCKSEnable: 0, HTTPSEnable: 0}}, HTTPSEnable: 0, SOCKSEnable: 0}
      dynamic proxySettingRes = await methodChannel.invokeMethod('getProxySettings');
      Map<String, dynamic> proxySetting = Map<String, dynamic>.from(proxySettingRes);
      if (proxySetting['HTTPEnable'] == 1) {
        return ProxySetting(
          host: proxySetting['HTTPProxy'].toString(),
          port: proxySetting['HTTPPort'].toString(),
        );
      }
    } else if (Platform.isMacOS) {
      dynamic proxySettingRes = await methodChannel.invokeMethod('getProxySettings');
      Map<String, dynamic> proxySetting = Map<String, dynamic>.from(proxySettingRes);
      if (proxySetting['HTTPEnable'] == 1) {
        return ProxySetting(
          host: proxySetting['HTTPProxy'].toString(),
          port: proxySetting['HTTPPort'].toString(),
        );
      }
    }
    return null;
  }
}
