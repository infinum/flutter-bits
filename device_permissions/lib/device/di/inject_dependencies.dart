library device.administration.inject_dependencies;

import 'dart:io';

import 'package:device_permissions/device/impl/device_permissions_manager/device_permissions_manager.dart';
import 'package:device_permissions/domain/manager/device_permissions_manager/device_permissions_manager.dart';
import 'package:get_it/get_it.dart';

void injectDependencies(GetIt getIt) {

  //  DevicePermissionsManager
  getIt.registerLazySingleton<DevicePermissionsManager>(
    () {
      if (Platform.isAndroid) {
        return AndroidPermissionsManager();
      } else if (Platform.isIOS) {
        return IOSPermissionsManager();
      } else {
        throw Error();
      }

    },
  );
}
