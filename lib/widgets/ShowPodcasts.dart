import 'package:flutter/material.dart';
import 'package:fresh_air/widgets/Podcast.dart';

class ShowPodcasts extends StatelessWidget {
  ShowPodcasts({Key key, this.podcasts}) : super(key: key);

  final List<Podcast> podcasts;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: podcasts,
      ),
    );
  }
}