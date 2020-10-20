import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:time_tracker/common_widgets/plaform_widget.dart';
import 'package:flutter/material.dart';

class PlatformAlertDialog extends PlatformWidget {
  final String title;
  final String content;
  final String defaultActionText;
  final String defaultCancelText;

  PlatformAlertDialog(
      {@required this.title,
      @required this.content,
      @required this.defaultActionText,
      this.defaultCancelText})
      : assert(title != null),
        assert(content != null),
        assert(defaultActionText != null);

  Future<bool> show(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog<bool>(
            context: context,
            builder: (context) => this,
          )
        : await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (context) => this,
          );
  }

  @override
  Widget buildCupertinoApp(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildAction(context),
    );
  }

  @override
  Widget buildMaterialApp(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildAction(context),
    );
  }

  List<Widget> _buildAction(BuildContext context) {
    final actions = <Widget>[];
    if (defaultCancelText != null) {
      actions.add(
        PlatfromAlertDialogAction(
          child: Text(defaultCancelText),
          onPressed: () => Navigator.pop(context, false),
        ),
      );
    }
    actions.add(
      PlatfromAlertDialogAction(
        onPressed: () => Navigator.of(context).pop(true),
        child: Text('OK'),
      ),
    );
    return actions;
  }
}

class PlatfromAlertDialogAction extends PlatformWidget {
  PlatfromAlertDialogAction({this.child, this.onPressed});
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget buildCupertinoApp(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  Widget buildMaterialApp(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
