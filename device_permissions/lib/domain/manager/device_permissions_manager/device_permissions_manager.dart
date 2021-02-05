library domain.manager.device_permissions_manager;

part 'model/device_permission.dart';

part 'model/device_permission_status.dart';

abstract class DevicePermissionsManager {
  Future<DevicePermissionStatus> getPermissionStatus(DevicePermission devicePermission);

  Future<DevicePermissionStatus> requestPermission(DevicePermission devicePermission);
}
