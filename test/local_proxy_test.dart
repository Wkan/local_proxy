import 'package:flutter_test/flutter_test.dart';
import 'package:local_proxy/local_proxy.dart';
import 'package:local_proxy/local_proxy_method_channel.dart';
import 'package:local_proxy/local_proxy_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLocalProxyPlatform with MockPlatformInterfaceMixin implements LocalProxyPlatform {
  @override
  Future<ProxySetting?> getProxySettings() => Future.value(ProxySetting(host: '127.0.0.1', port: '8080'));
}

void main() {
  final LocalProxyPlatform initialPlatform = LocalProxyPlatform.instance;

  test('$MethodChannelLocalProxy is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLocalProxy>());
  });

  test('getPlatformVersion', () async {
    // LocalProxy localProxyPlugin = LocalProxy();
    // MockLocalProxyPlatform fakePlatform = MockLocalProxyPlatform();
    // LocalProxyPlatform.instance = fakePlatform;

    // expect(await localProxyPlugin.getPlatformVersion(), '42');
  });
}
