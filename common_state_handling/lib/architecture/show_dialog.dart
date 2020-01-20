

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Util class that shows dialog
/// 
/// todo: handle close/cancel callback (depending on the project)
/// todo: show branded or different Cupertino/Material dialog (depending on the project)

Future<T> showInfoDialog<T>(BuildContext context, String title, Widget content, {bool dismissible = true}) {
  return showDialog<T>(
    barrierDismissible: dismissible,
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: content
        );
      });
}