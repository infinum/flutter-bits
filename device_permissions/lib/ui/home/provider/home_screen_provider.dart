import 'dart:async';

import 'package:device_permissions/domain/interactor/get_contacts_interactor/get_contacts_interactor.dart';
import 'package:device_permissions/domain/manager/device_permissions_manager/device_permissions_manager.dart';
import 'package:device_permissions/ui/permissions/navigate_to_permission_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';


class HomeScreenProvider extends ChangeNotifier {
  HomeScreenProvider(this._interactor);

  final GetContactsInteractor _interactor;

  final PublishSubject<NavigateToPermissionData> _navigateToPermissionSubject = PublishSubject();

  Stream<NavigateToPermissionData> get navigateToPermission => _navigateToPermissionSubject;
  dynamic contacts;

  void onGetContacts() {
    _handleGetContacts();
  }

  Future<void> _handleGetContacts() async {
    contacts = await _interactor.getContacts(onPermissionDenied: _onPermissionDenied);
    notifyListeners();
  }

  Future<void> _onPermissionDenied() async {
    final completer = Completer<bool>();
    _navigateToPermissionSubject.add(NavigateToPermissionData(completer, DevicePermission.access_contacts));

    final result = await completer.future;
    if (result == true) {
      _handleGetContacts();
    }
  }
}
