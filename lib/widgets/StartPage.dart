import 'package:flutter/material.dart';
import 'package:fresh_air/widgets/StreamingNowPage.dart';
import 'package:fresh_air/widgets/ShowList.dart';
import 'package:fresh_air/widgets/EventList.dart';
import 'package:fresh_air/widgets/ContactPage.dart';
import 'package:fresh_air/helpers/WebsiteAPI.dart';
import 'package:fresh_air/widgets/Show.dart';
import 'package:fresh_air/widgets/ShowPreview.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => new _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Widget body;
  String header = "Streaming Now";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(header),
      ),
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(
              child: new Center(child: new Text("Fresh Air")),
              decoration: new BoxDecoration(
                color: Colors.green,
              ),
            ),
            new ListTile(
              title: new Text('Streaming Now'),
              onTap: () {
                setState(() {
                  if (header != "Streaming Now") {
                    header = "Streaming Now";
                  }
                  body = StreamingNowPage();
                });
                Navigator.pop(context);
              },
            ),
            new ListTile(
              title: new Text('Shows'),
              onTap: () {
                setState(() {
                  header = "Shows";
                  body = new FutureBuilder<List<ShowData>>(
                    future: WebsiteAPI.getAllShows(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      if (snapshot.hasData) {
                        var list = snapshot.data.map((item) {
                          return new ShowPreview(data: item);
                        }).toList();
                        return new ShowList(previews: list);
                      } else {
                        return new Center(
                            child: new CircularProgressIndicator());
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
                  header = "Events";
                  body = EventList();
                });
                Navigator.pop(context);
              },
            ),
            new ListTile(
              title: new Text('Contact'),
              onTap: () {
                setState(() {
                  header = "Contact";
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
