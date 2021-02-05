library app.inject_dependencies;

import 'package:get_it/get_it.dart';
import 'package:device_permissions/device/di/inject_dependencies.dart' as device;
import 'package:device_permissions/domain/di/inject_dependencies.dart' as domain;

void injectDependencies() {
  final getIt = GetIt.instance;

  device.injectDependencies(getIt);
  domain.injectDependencies(getIt);
}
