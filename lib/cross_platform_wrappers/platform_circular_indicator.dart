import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fresh_air/cross_platform_wrappers/platform_widget.dart';

class PlatformCircularIndicator extends PlatformWidget<CircularProgressIndicator, CupertinoActivityIndicator>{

  PlatformCircularIndicator();

  @override
  CircularProgressIndicator createAndroidWidget(BuildContext context) {
    return new CircularProgressIndicator();
  }

  @override
  CupertinoActivityIndicator createIosWidget(BuildContext context) {
    return new CupertinoActivityIndicator();
  }
}