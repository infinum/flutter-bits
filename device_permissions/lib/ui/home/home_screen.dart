import 'package:device_permissions/ui/common/disposable_listener.dart';
import 'package:device_permissions/ui/home/provider/home_screen_provider.dart';
import 'package:device_permissions/ui/permissions/permission_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeScreenProvider(GetIt.instance.get()),
      child: Builder(
        builder: (context) {
          return DisposableListener(
            onListen: (CompositeSubscription compositeSubscription) {
              context.read<HomeScreenProvider>().navigateToPermission.listen((navigationData) async {
                // open permission screen that can handle any permission
                final result = Navigator.of(context).push<bool>(PermissionScreen.route(navigationData.permission));
                // send result back to provider
                navigationData.navigationCompleter.complete(result);
              }).addTo(compositeSubscription);
            },
            child: Scaffold(
              appBar: AppBar(title: Text('Contacts'),),
              body: Column(children: [
                SizedBox(height: 36),
                RaisedButton(child: Text('Get contacts'), onPressed: (){
                  context.read<HomeScreenProvider>().onGetContacts();
                })
              ],),
            ),
          );
        }
      ),
    );
  }
}
