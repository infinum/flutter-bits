part of device.impl.device_permissions_manager;

class AndroidPermissionsManager implements DevicePermissionsManager {
  @override
  Future<DevicePermissionStatus> getPermissionStatus(DevicePermission devicePermission) async {
    if (_isDevicePermissionAutomaticallyGranted(devicePermission)) {
      return DevicePermissionStatus.granted;
    }

    final permission = _mapToPermission(devicePermission);
    PermissionStatus permissionStatus = await permission.status;
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await permission.request();
      return _mapToDevicePermissionStatus(permissionStatus);
    } else {
      return _mapToDevicePermissionStatus(permissionStatus);
    }
  }

  @override
  Future<DevicePermissionStatus> requestPermission(DevicePermission devicePermission) async {
    if (_isDevicePermissionAutomaticallyGranted(devicePermission)) {
      return DevicePermissionStatus.granted;
    }

    final permission = _mapToPermission(devicePermission);
    final permissionStatus = await permission.request();
    return _mapToDevicePermissionStatus(permissionStatus);
  }

  bool _isDevicePermissionAutomaticallyGranted(DevicePermission devicePermission) {
    switch (devicePermission) {
      case DevicePermission.get_images_from_camera:
        return true;
      default:
        return false;
    }
  }

  Permission _mapToPermission(DevicePermission devicePermission) {
    switch (devicePermission) {
      case DevicePermission.access_calendar:
        return Permission.calendar;
      case DevicePermission.access_contacts:
        return Permission.contacts;
      case DevicePermission.get_images_from_camera:
        throw Error(); // There is no such permission on Android
      case DevicePermission.get_images_from_gallery:
        return Permission.storage;
      case DevicePermission.show_notifications:
        return Permission.notification;
    }
    throw Error();
  }

  DevicePermissionStatus _mapToDevicePermissionStatus(PermissionStatus permissionStatus) {
    switch (permissionStatus) {
      case PermissionStatus.limited:
        throw Error(); // Only applicable on iOS
      case PermissionStatus.granted:
        return DevicePermissionStatus.granted;
      case PermissionStatus.denied:
        return DevicePermissionStatus.denied;
      case PermissionStatus.restricted:
        throw Error(); // Only applicable on iOS
      case PermissionStatus.permanentlyDenied:
        return DevicePermissionStatus.permanently_denied;
    }
    throw Error();
  }
}
