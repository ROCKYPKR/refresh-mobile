import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'Show.dart';


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
}