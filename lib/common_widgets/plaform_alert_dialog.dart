import 'package:flutter/cupertino.dart';
import 'package:time_tracker/common_widgets/plaform_widget.dart';
import 'package:flutter/material.dart';

class PlatformAlertDialog extends PlatformWidget {
  final String title;
  final String content;
  final String defaultActionText;
  PlatformAlertDialog(
      {@required this.title,
      @required this.content,
      @required this.defaultActionText})
      : assert(title != null),
        assert(content != null),
        assert(defaultActionText != null);

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
    return [
      PlatfromAlertDialogAction(
        onPressed: () => Navigator.of(context).pop(),
        child: Text('OK'),
      ),
    ];
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
