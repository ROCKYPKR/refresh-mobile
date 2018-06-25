import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fresh_air/cross_platform_wrappers/platform_circular_indicator.dart';
import 'package:fresh_air/widgets/events/event_filter.dart';
import 'package:fresh_air/widgets/events/event_preview.dart';
import 'package:fresh_air/widgets/streaming_now/streaming_now_page.dart';
import 'package:fresh_air/widgets/shows/show_list.dart';
import 'package:fresh_air/widgets/events/event_list.dart';
import 'package:fresh_air/widgets/contact/contact_page.dart';
import 'package:fresh_air/helpers/website_api.dart';
import 'package:fresh_air/widgets/shows/show_details.dart';
import 'package:fresh_air/widgets/shows/show_preview.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => new _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Widget body;
  List<Widget> appBarActions;
  String header = "Streaming Now";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(header),
        actions: appBarActions,
      ),
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(
              child: new Center(
                child: new Text("Fresh Air"),
              ),
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
                  body = new StreamingNowPage();
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
                            child: new PlatformCircularIndicator());
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
                setState(
                  () {
                    header = "Events";
                    body = new FutureBuilder<List<EventData>>(
                      future: WebsiteAPI.getAllEvents(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);
                        if (snapshot.hasData) {
                          var list = snapshot.data.map((item) {
                            return new EventPreview(data: item);
                          }).toList();
                          return new EventList(previews: list);
                        } else {
                          return new Center(
                              child: new PlatformCircularIndicator());
                        }
                      },
                    );
                    appBarActions = <Widget>[EventFilter()];
                  },
                );
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
