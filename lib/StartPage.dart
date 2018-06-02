import 'package:flutter/material.dart';
import 'StreamingNowPage.dart';
import 'ShowList.dart';
import 'EventList.dart';
import 'ContactPage.dart';
import 'WebsiteAPI.dart';
import 'Show.dart';
import 'ShowPreview.dart';

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
    WebsiteAPI.getAllShows();
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
                  body = StreamingNowPage();
                });
                Navigator.pop(context);
              },
            ),
            new ListTile(
              title: new Text('Shows'),
              onTap: () {
                setState(() {
                  body = new FutureBuilder<List<ShowData>>(
                    future: WebsiteAPI.getAllShows(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      if (snapshot.hasData) {
                        var list = snapshot.data.map((item) {
                          return new ShowPreview(data: item);
                        });
                        return new ShowList(previews: list.toList());
                      }
                      else {
                        return new Center(child: new CircularProgressIndicator());
                      }
                    },
                  );
                });
                Navigator.pop(context);
              },
            ),
            new ListTile(
              title: new Text('Events'),
              onTap: () {
                setState(() {
                  body = EventList();
                });
                Navigator.pop(context);
              },
            ),
            new ListTile(
              title: new Text('Contact'),
              onTap: () {
                setState(() {
                  body = ContactPage();
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
