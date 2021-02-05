
import 'package:device_permissions/domain/manager/device_permissions_manager/device_permissions_manager.dart';
import 'device_permissions_interactor.dart';

class DevicePermissionsInteractorImpl extends DevicePermissionsInteractor {
  DevicePermissionsInteractorImpl(this._permissionsManager);

  final DevicePermissionsManager _permissionsManager;

  @override
  Future<DevicePermissionStatus> getPermissionStatus(DevicePermission permission) {
    return _permissionsManager.getPermissionStatus(permission);
  }

  @override
  Future<DevicePermissionStatus> requestPermission(DevicePermission permission) async {
    return await _permissionsManager.requestPermission(permission);
  }
}
