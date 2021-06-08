part of device.impl.device_permissions_manager;

class IOSPermissionsManager implements DevicePermissionsManager {
  @override
  Future<DevicePermissionStatus> getPermissionStatus(DevicePermission devicePermission) async {
    final permission = _mapToPermission(devicePermission);
    final permissionStatus = await permission.status;
    return _mapToDevicePermissionStatus(permissionStatus);
  }

  @override
  Future<DevicePermissionStatus> requestPermission(DevicePermission devicePermission) async {
    final permission = _mapToPermission(devicePermission);
    final permissionStatus = await permission.request();
    return _mapToDevicePermissionStatus(permissionStatus);
  }

  Permission _mapToPermission(DevicePermission devicePermission) {
    switch (devicePermission) {
      case DevicePermission.access_calendar:
        return Permission.calendar;
      case DevicePermission.access_contacts:
        return Permission.contacts;
      case DevicePermission.get_images_from_camera:
        return Permission.camera;
      case DevicePermission.get_images_from_gallery:
        return Permission.photos;
      case DevicePermission.show_notifications:
        return Permission.notification;
    }
    throw Error();
  }

  DevicePermissionStatus _mapToDevicePermissionStatus(PermissionStatus permissionStatus) {
    switch (permissionStatus) {
      case PermissionStatus.limited:
        return DevicePermissionStatus.limited;
      case PermissionStatus.granted:
        return DevicePermissionStatus.granted;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
        return DevicePermissionStatus.permanently_denied;
      case PermissionStatus.permanentlyDenied:
        return DevicePermissionStatus.permanently_denied;
    }
    throw Error();
  }
}
