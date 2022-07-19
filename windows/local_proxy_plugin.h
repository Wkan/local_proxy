#ifndef FLUTTER_PLUGIN_LOCAL_PROXY_PLUGIN_H_
#define FLUTTER_PLUGIN_LOCAL_PROXY_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace local_proxy {

class LocalProxyPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  LocalProxyPlugin();

  virtual ~LocalProxyPlugin();

  // Disallow copy and assign.
  LocalProxyPlugin(const LocalProxyPlugin&) = delete;
  LocalProxyPlugin& operator=(const LocalProxyPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace local_proxy

#endif  // FLUTTER_PLUGIN_LOCAL_PROXY_PLUGIN_H_
