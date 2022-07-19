import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'local_proxy.dart';
import 'local_proxy_method_channel.dart';

abstract class LocalProxyPlatform extends PlatformInterface {
  /// Constructs a LocalProxyPlatform.
  LocalProxyPlatform() : super(token: _token);

  static final Object _token = Object();

  static LocalProxyPlatform _instance = MethodChannelLocalProxy();

  /// The default instance of [LocalProxyPlatform] to use.
  ///
  /// Defaults to [MethodChannelLocalProxy].
  static LocalProxyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LocalProxyPlatform] when
  /// they register themselves.
  static set instance(LocalProxyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<ProxySetting?> getProxySettings() {
    throw UnimplementedError('getSystemSettings() has not been implemented.');
  }
}
