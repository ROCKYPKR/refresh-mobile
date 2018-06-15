import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fresh_air/widgets/shows/ShowDetails.dart';
import 'package:fresh_air/widgets/shows/Podcast.dart';

class WebsiteAPI {
  static var _url = "https://freshair.org.uk/api/";

  static Future<List<ShowData>> getAllShows() async {
    var list = await http.read(_url + "shows/all").then((shows) {
      List<ShowData> list = new List();
      List showsMap = json.decode(shows);
      showsMap.forEach((item) {
        ShowData show = new ShowData.fromJson(item);
        list.add(show);
      });
      return list;
    });
    return list;
  }

  static Future<List<PodcastData>> getPodcastsByShow(String slug) async {
    var list = await http.read(_url + "podcasts/" + slug).then((podcasts) {
      List<PodcastData> list = new List();
      List podcastsMap = json.decode(podcasts);
      podcastsMap.forEach((item) {
        PodcastData podcast = new PodcastData.fromJson(item);
        list.add(podcast);
      });
      return list;
    });
    return list;
  }
}
