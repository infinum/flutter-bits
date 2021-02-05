import 'dart:async';

import 'package:device_permissions/domain/manager/device_permissions_manager/device_permissions_manager.dart';

class NavigateToPermissionData {
  NavigateToPermissionData(this.navigationCompleter, this.permission);

  final Completer<bool> navigationCompleter;
  final DevicePermission permission;
}