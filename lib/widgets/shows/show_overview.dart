import 'package:flutter/material.dart';
import 'package:fresh_air/cross_platform_wrappers/platform_circular_indicator.dart';
import 'package:fresh_air/helpers/website_api.dart';
import 'package:fresh_air/widgets/shows/podcast.dart';
import 'package:fresh_air/widgets/shows/show_details.dart';
import 'package:fresh_air/widgets/shows/podcast_list.dart';
import 'package:fresh_air/widgets/shows/show_preview.dart';

class ShowOverview extends StatelessWidget {
  ShowOverview({Key key, this.data}) : super(key: key);

  final ShowData data;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "Details"),
              Tab(text: "Podcasts"),
              Tab(text: "Posts"),
            ],
          ),
          title: Text('Show Overview'),
        ),
        body: TabBarView(
          children: [
            ShowDetails(data: data),
            FutureBuilder<List<PodcastData>>(
              future: WebsiteAPI.getPodcastsByShow(data.slug),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (snapshot.hasData) {
                  var list = snapshot.data.map((item) {
                    return Podcast(data: item);
                  }).toList();
                  return PodcastList(data: list);
                } else {
                  return Center(
                    child: PlatformCircularIndicator(),
                  );
                }
              },
            ),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
