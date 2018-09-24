import 'package:flutter/material.dart';
import 'dart:io' show Platform;

abstract class PlatformWidget<A extends Widget, I extends Widget>
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return createAndroidWidget(context);
    } else if (Platform.isIOS) {
      return createIosWidget(context);
    }
    return Container();
  }

  A createAndroidWidget(BuildContext context);

  I createIosWidget(BuildContext context);
}
