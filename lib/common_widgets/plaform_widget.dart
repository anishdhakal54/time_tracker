import 'dart:io';

import 'package:flutter/material.dart';

abstract class PlatformWidget extends StatelessWidget {
  Widget buildCupertinoApp(BuildContext context);
  Widget buildMaterialApp(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return buildCupertinoApp(context);
    }
    return buildMaterialApp(context);
  }
}
