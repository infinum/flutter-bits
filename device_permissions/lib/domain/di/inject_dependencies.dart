import 'package:device_permissions/domain/interactor/get_contacts_interactor/get_contacts_interactor.dart';
import 'package:device_permissions/domain/interactor/get_contacts_interactor/get_contacts_interactor_impl.dart';
import 'package:device_permissions/domain/interactor/permissions_interactor/device_permissions_interactor.dart';
import 'package:device_permissions/domain/interactor/permissions_interactor/device_permissions_interactor_impl.dart';
import 'package:get_it/get_it.dart';

void injectDependencies(GetIt getIt) {

  getIt.registerFactory<GetContactsInteractor>(
    () => GetContactsInteractorImpl(
      getIt.get(),
    ),
  );

  getIt.registerFactory<DevicePermissionsInteractor>(
        () => DevicePermissionsInteractorImpl(
      getIt.get(),
    ),
  );
}
