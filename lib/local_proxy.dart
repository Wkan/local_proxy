import 'local_proxy_platform_interface.dart';

class LocalProxy {
  static Future<ProxySetting?> getProxySettings() {
    return LocalProxyPlatform.instance.getProxySettings();
  }
}

class ProxySetting {
  final String host;
  final String port;

  ProxySetting({required this.host, required this.port});

  @override
  String toString() {
    return "$host:$port";
  }
}
