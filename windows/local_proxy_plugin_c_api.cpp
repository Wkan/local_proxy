#include "include/local_proxy/local_proxy_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "local_proxy_plugin.h"

void LocalProxyPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  local_proxy::LocalProxyPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
