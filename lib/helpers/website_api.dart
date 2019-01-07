import 'package:fresh_air/widgets/events/event_preview.dart';
import 'package:fresh_air/widgets/shows/show_preview.dart';
import 'package:fresh_air/widgets/streaming_now/broadcast_info.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fresh_air/widgets/shows/podcast.dart';

class WebsiteAPI {
  static var _url = "https://freshair.org.uk/api";

  static Future<List<ShowData>> getAllShows() async {
    var list = await http.read("$_url/shows/all").then((shows) {
      List<ShowData> list = List();
      List showsMap = json.decode(shows);
      showsMap.forEach((item) {
        ShowData show = ShowData.fromJson(item);
        list.add(show);
      });
      return list;
    });
    return list;
  }

  static Future<ShowData> getShowBySlug(String slug) async {
    if(slug == ""){
      return Future((){
        return ShowData.defaultShow();
      });
    }
    var show = await http.read("$_url/shows/$slug").then((show) {
      return ShowData.fromJson(json.decode(show));
    });
    return show;
  }

  static Future<List<PodcastData>> getPodcastsByShow(String slug) async {
    var list = await http.read("$_url/podcasts/$slug").then((podcasts) {
      List<PodcastData> list = List();
      List podcastsMap = json.decode(podcasts);
      podcastsMap.forEach((item) {
        PodcastData podcast = PodcastData.fromJson(item);
        list.add(podcast);
      });
      return list;
    });
    return list;
  }

  static Future<List<EventData>> getAllEvents() async {
    Future<List<EventData>> future = Future(() {
      return [
        EventData(
            "Event Name", "Sunday 25 January 20:00", "Monday 01 June 10:00",
            "Liquid Rooms",
            "This is an event"),
      ];
    });
    return future;
    /*
    var list = await http.read(_url + "/all").then((events) {
      List<EventData> list = List();
      List eventsMap = json.decode(events);
      eventsMap.forEach((item) {
        EventData event = EventData.fromJson(item);
        list.add(event);
      });
      return list;
    });
    return list;*/
  }

  static Future<BroadcastInfo> getBroadcastInfo() async {
    var data = await http.read("$_url/broadcast_info").then((res) {
      return BroadcastInfo.fromJson(json.decode(res));
    });
    return data;
  }
}
