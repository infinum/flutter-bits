
import 'package:device_permissions/domain/manager/device_permissions_manager/device_permissions_manager.dart';

import 'get_contacts_interactor.dart';

class GetContactsInteractorImpl implements GetContactsInteractor {
  GetContactsInteractorImpl(this._permissionsManager);

  final DevicePermissionsManager _permissionsManager;

  @override
  Future<dynamic> getContacts({Function() onPermissionDenied}) async {

    // Handle permission
    final permissionResult = await _permissionsManager.requestPermission(DevicePermission.access_contacts);
    if (permissionResult != DevicePermissionStatus.granted) {
      onPermissionDenied?.call();
      return null;
    }

    // Return contacts list
    return [];
  }

}