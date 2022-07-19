import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_proxy/local_proxy_method_channel.dart';

void main() {
  MethodChannelLocalProxy platform = MethodChannelLocalProxy();
  const MethodChannel channel = MethodChannel('local_proxy');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    // expect(await platform.getPlatformVersion(), '42');
  });
}
