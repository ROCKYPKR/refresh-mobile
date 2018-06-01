import 'package:flutter/material.dart';
import 'StreamingNowWidget.dart';
import 'ShowsWidget.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _StartPageState createState() => new _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Widget body;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      drawer: Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(
              child: new Text('Fresh Air'),
              decoration: new BoxDecoration(
                color: Colors.green,
              ),
            ),
            new ListTile(
              title: new Text('Streaming Now'),
              onTap: () {
                setState(() {
                  body = StreamingNowWidget();
                });
                Navigator.pop(context);
              },
            ),
            new ListTile(
              title: new Text('Shows'),
              onTap: () {
                setState(() {
                  body = ShowsWidget();
                });
                Navigator.pop(context);
              },
            ),
            new ListTile(
              title: new Text('Events'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            new ListTile(
              title: new Text('Contact'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body : body,
    );
  }
}
