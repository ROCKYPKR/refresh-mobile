import 'package:fresh_air/cross_platform_wrappers/platform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlatformScaffold extends PlatformWidget<Scaffold, CupertinoPageScaffold> {
  PlatformScaffold();

  @override
  Scaffold createAndroidWidget(BuildContext context) {
    return Scaffold();
  }

  @override
  CupertinoPageScaffold createIosWidget(BuildContext context) {
    return CupertinoPageScaffold(
      child: null,
    );
  }
}
