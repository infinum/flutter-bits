import 'package:device_permissions/domain/manager/device_permissions_manager/device_permissions_manager.dart';
import 'package:device_permissions/ui/common/disposable_listener.dart';
import 'package:device_permissions/ui/permissions/provider/permission_screen_provider.dart';
import 'package:device_permissions/ui/permissions/provider/ui/ui_permission_screen_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen._();

  static Route<bool> route(DevicePermission permission) {
    return MaterialPageRoute<bool>(
        builder: (BuildContext context) => StateNotifierProvider<PermissionScreenProvider, UiPermissionScreenState>(
            create: (_) => PermissionScreenProvider(GetIt.instance.get())..init(permission),
            child: const PermissionScreen._()));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: DisposableListener(
        onListen: (CompositeSubscription compositeSubscription) {
          context.read<PermissionScreenProvider>().navigateBack.listen((result) {
            Navigator.of(context).pop(result);
          }).addTo(compositeSubscription);
        },
        child: Scaffold(
          backgroundColor: Color.alphaBlend(Theme.of(context).primaryColor.withOpacity(0.05), Colors.white),
          appBar: AppBar(
            brightness: Brightness.light,
            elevation: 0,
            backgroundColor: Color.alphaBlend(Theme.of(context).primaryColor.withOpacity(0.05), Colors.white),
          ),
          body: StateNotifierBuilder<UiPermissionScreenState>(
              stateNotifier: context.watch<PermissionScreenProvider>(),
              builder: (context, state, child) {
                switch (state) {
                  case UiPermissionScreenState.showPermanentlyDenied:
                    return _buildPermanentlyDeniedContent(context);
                  case UiPermissionScreenState.showGrantPermission:
                    return _buildGrantPermissionContent(context);
                }
                throw Error();
              }),
        ),
      ),
    );
  }

  Widget _buildGrantPermissionContent(BuildContext context) {
    return _Content(
        title: 'We need permission x to do y',
        subtitle: 'Grant the permission to continue',
        actionText: 'Grant permission',
        onPressed: () {
          context.read<PermissionScreenProvider>().onGrantPermissionClicked();
        });
  }

  Widget _buildPermanentlyDeniedContent(BuildContext context) {
    return _Content(
        title: 'We need permission x do y',
        subtitle: 'To enable permission, please go to Settings > Apps > Vecna and grant the permission.',
        actionText: 'Open settings',
        onPressed: () {
          context.read<PermissionScreenProvider>().onOpenSettingsClicked();
        });
  }
}

class _Content extends StatelessWidget {
  const _Content(
      {Key key, @required this.title, @required this.subtitle, @required this.actionText, @required this.onPressed})
      : super(key: key);

  final String title;
  final String subtitle;
  final String actionText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          Text(title),
          const SizedBox(height: 20),
          Text(subtitle),
          const SizedBox(height: 32),
          RaisedButton(onPressed: onPressed, child: Text(actionText)),
        ],
      ),
    );
  }
}
