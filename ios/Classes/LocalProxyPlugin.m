#import "LocalProxyPlugin.h"
#if __has_include(<local_proxy/local_proxy-Swift.h>)
#import <local_proxy/local_proxy-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "local_proxy-Swift.h"
#endif

@implementation LocalProxyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLocalProxyPlugin registerWithRegistrar:registrar];
}
@end
