

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Util class that shows dialog
/// 
/// todo: handle close/cancel callback (depending on the project)
/// todo: show branded or different Cupertino/Material dialog (depending on the project)

void showInfoDialog(BuildContext context, String title, Widget content, {bool dismissible = true}) {
  showDialog(
    barrierDismissible: dismissible,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: content
        );
      });
}