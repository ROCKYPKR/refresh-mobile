import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fresh_air/cross_platform_wrappers/platform_circular_indicator.dart';
import 'package:fresh_air/widgets/events/event_filter_button.dart';
import 'package:fresh_air/widgets/events/event_preview.dart';
import 'package:fresh_air/widgets/shows/show_filter_button.dart';
import 'package:fresh_air/widgets/streaming_now/streaming_now_page.dart';
import 'package:fresh_air/widgets/shows/show_list.dart';
import 'package:fresh_air/widgets/events/event_list.dart';
import 'package:fresh_air/widgets/contact/contact_page.dart';
import 'package:fresh_air/helpers/website_api.dart';
import 'package:fresh_air/widgets/shows/show_preview.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Widget body = StreamingNowPage();
  List<Widget> appBarActions;
  String header = "Streaming Now";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(header),
        actions: appBarActions,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child: Column(
                children: <Widget>[
                  const Image(
                    image: const AssetImage('assets/freshair_icon.png'),
                  ),
                  const Text("Fresh Air")
                ],
              )),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Streaming Now'),
              onTap: () {
                setState(() {
                  header = "Streaming Now";
                  body = StreamingNowPage();
                  appBarActions = [];
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Shows'),
              onTap: () {
                setState(() {
                  header = "Shows";
                  body = FutureBuilder<List<ShowData>>(
                    future: WebsiteAPI.getAllShows(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      if (snapshot.hasData) {
                        var list = snapshot.data.map((item) {
                          return ShowPreview(data: item);
                        }).toList();
                        return ShowList(previews: list);
                      } else {
                        return Center(
                            child: PlatformCircularIndicator());
                      }
                    },
                  );
                  appBarActions = <Widget>[
                    ShowFilterButton(),
                  ];
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Events'),
              onTap: () {
                setState(
                  () {
                    header = "Events";
                    body = FutureBuilder<List<EventData>>(
                      future: WebsiteAPI.getAllEvents(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);
                        if (snapshot.hasData) {
                          var list = snapshot.data.map((item) {
                            return EventPreview(data: item);
                          }).toList();
                          return EventList(previews: list);
                        } else {
                          return Center(
                              child: PlatformCircularIndicator());
                        }
                      },
                    );
                    appBarActions = <Widget>[EventFilterButton()];
                  },
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Contact'),
              onTap: () {
                setState(() {
                  header = "Contact";
                  body = ContactPage();
                  appBarActions = [];
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
