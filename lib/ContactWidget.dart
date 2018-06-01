import 'package:flutter/material.dart';

class ContactWidget extends StatefulWidget {
  ContactWidget({Key key}) : super(key : key);

  @override
  _ContactState createState() => new _ContactState();
}

class _ContactState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Text("Contact"),
    );
  }
}