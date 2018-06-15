import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fresh_air/widgets/ShowDetails.dart';
import 'package:fresh_air/widgets/Podcast.dart';

class BroadcastAPI {
  static var _url = "https://studio.freshair.org.uk/api/";

  static void sendMessage(
      String author, String content, String time, String date) async {
    await http.post(
      _url,
      body: {'author': author, 'content': content, 'time': time, 'date': date},
    );
  }
}
