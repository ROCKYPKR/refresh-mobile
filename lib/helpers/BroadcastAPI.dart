import 'package:http/http.dart' as http;

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
