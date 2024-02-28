//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flutter_dropdown_plus/flutter_dropdown_plus_plugin_c_api.h>
#include <flutter_widget_function/flutter_widget_function_plugin_c_api.h>
#include <navigator_plus/navigator_plus_plugin_c_api.h>
#include <permission_handler_windows/permission_handler_windows_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FlutterDropdownPlusPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterDropdownPlusPluginCApi"));
  FlutterWidgetFunctionPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterWidgetFunctionPluginCApi"));
  NavigatorPlusPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("NavigatorPlusPluginCApi"));
  PermissionHandlerWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PermissionHandlerWindowsPlugin"));
}
