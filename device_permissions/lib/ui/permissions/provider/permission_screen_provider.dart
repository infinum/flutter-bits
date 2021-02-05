import 'package:device_permissions/domain/interactor/permissions_interactor/device_permissions_interactor.dart';
import 'package:device_permissions/domain/manager/device_permissions_manager/device_permissions_manager.dart';
import 'package:device_permissions/ui/permissions/provider/ui/ui_permission_screen_state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:state_notifier/state_notifier.dart';

class PermissionScreenProvider extends StateNotifier<UiPermissionScreenState> {
  PermissionScreenProvider(this._permissionsInteractor)
      : super(UiPermissionScreenState.showGrantPermission);

  final DevicePermissionsInteractor _permissionsInteractor;
  dynamic _deviceInteractor;
  DevicePermission _permission;

  final PublishSubject<bool> _navigateBackSubject = PublishSubject();
  Stream<bool> get navigateBack => _navigateBackSubject;

  void init(DevicePermission permission) {
    _permission = permission;
    _showPermissionState();
  }

  void onGrantPermissionClicked() {
    _askForPermission();
  }

  void onOpenSettingsClicked() {
    print('Should open app settings!');
    // _deviceInteractor.openAppSetting();
  }

  Future<void> _showPermissionState() async {
    final result = await _permissionsInteractor.getPermissionStatus(_permission);

    switch(result) {
      case DevicePermissionStatus.granted:
        _navigateBackSubject.add(true);
        break;
      case DevicePermissionStatus.denied:
        state = UiPermissionScreenState.showGrantPermission;
        break;
      case DevicePermissionStatus.permanently_denied:
        state = UiPermissionScreenState.showPermanentlyDenied;
        break;
      default:
        throw StateError('Permission result in unexpected state');
    }
  }

  Future<void> _askForPermission() async {
    await _permissionsInteractor.requestPermission(_permission);
    _showPermissionState();
  }

  @override
  void dispose() {
    super.dispose();
    _navigateBackSubject.close();
  }
}
