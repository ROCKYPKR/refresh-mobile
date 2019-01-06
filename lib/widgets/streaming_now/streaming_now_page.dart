import 'package:flutter/material.dart';
import 'package:audio_stream_player/audio_stream_player.dart';
import 'package:fresh_air/cross_platform_wrappers/platform_circular_indicator.dart';
import 'package:fresh_air/helpers/website_api.dart';
import 'package:fresh_air/widgets/shows/show_preview.dart';

class StreamingNowPage extends StatefulWidget {
  StreamingNowPage({Key key}) : super(key: key);

  @override
  _StreamingNowPageState createState() => _StreamingNowPageState();
}

class _StreamingNowPageState extends State<StreamingNowPage> {
  AudioStreamPlayer player = AudioStreamPlayer();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              child: FutureBuilder<List<ShowData>>(
                future: WebsiteAPI.getAllShows(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  if (snapshot.hasData) {
                    var list = snapshot.data.map((item) {
                      return ShowPreview(data: item);
                    }).toList();
                    return list[0];
                  } else {
                    return Center(child: PlatformCircularIndicator());
                  }
                },
              ),
            ),
            flex: 2,
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.fiber_manual_record),
                  onPressed: () {
                    player.stop();
                    play();
                  },
                  color: Colors.red,
                  iconSize: 60.0,
                ),
                IconButton(
                  icon: Icon(isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled),
                  onPressed: () {
                    isPlaying ? pause() : play();
                  },
                  iconSize: 100.0,
                ),
                IconButton(
                  icon: Icon(Icons.stop),
                  onPressed: () {
                    player.stop();
                  },
                  iconSize: 60.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void play() {
    player.play("http://radio.freshair.org.uk/radio");
    setState(() {
      isPlaying = true;
    });
  }

  void pause() {
    player.pause();
    setState(() {
      isPlaying = false;
    });
  }

  void stop() {
    player.stop();
    setState(() {
      isPlaying = false;
    });
  }

  void reset() {
    stop();
    play();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }
}
