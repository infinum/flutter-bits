import 'package:device_permissions/domain/manager/device_permissions_manager/device_permissions_manager.dart';

abstract class DevicePermissionsInteractor {
  Future<DevicePermissionStatus> getPermissionStatus(DevicePermission permission);

  Future<DevicePermissionStatus> requestPermission(DevicePermission permission);
}
