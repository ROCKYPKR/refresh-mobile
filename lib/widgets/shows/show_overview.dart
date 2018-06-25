import 'package:flutter/material.dart';
import 'package:fresh_air/helpers/website_api.dart';
import 'package:fresh_air/widgets/shows/podcast.dart';
import 'package:fresh_air/widgets/shows/show_details.dart';
import 'package:fresh_air/widgets/shows/podcast_list.dart';

class ShowOverview extends StatelessWidget {
  ShowOverview({Key key, this.data}) : super(key: key);

  final ShowData data;

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          bottom: new TabBar(
            tabs: [
              new Tab(text: "Details"),
              new Tab(text: "Podcasts"),
              new Tab(text: "Posts"),
            ],
          ),
          title: new Text('Show Overview'),
        ),
        body: new TabBarView(
          children: [
            new ShowDetails(data: data),
            new FutureBuilder<List<PodcastData>>(
              future: WebsiteAPI.getPodcastsByShow(data.slug),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (snapshot.hasData) {
                  var list = snapshot.data.map((item) {
                    return new Podcast(data: item);
                  }).toList();
                  return new PodcastList(data: list);
                } else {
                  return new Center(child: new CircularProgressIndicator());
                }
              },
            ),
            new Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
