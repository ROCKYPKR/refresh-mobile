import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_air/cross_platform_wrappers/platform_widget.dart';

class PlatformButton extends PlatformWidget<RaisedButton, CupertinoButton> {
  PlatformButton({this.child, this.onPressed});

  final Widget child;
  final Function onPressed;

  @override
  RaisedButton createAndroidWidget(BuildContext context) {
    return new RaisedButton(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  CupertinoButton createIosWidget(BuildContext context) {
    return new CupertinoButton(
      child: child,
      onPressed: onPressed,
    );
  }
}
