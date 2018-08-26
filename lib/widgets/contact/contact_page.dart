import 'package:flutter/material.dart';
import 'package:fresh_air/cross_platform_wrappers/platform_button.dart';
import 'package:fresh_air/helpers/broadcast_api.dart';

class ContactPage extends StatelessWidget {
  ContactPage({Key key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: 'Please enter your name.',
                ),
                controller: nameController,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Please enter your message to the studio.',
                ),
                controller: messageController,
                maxLines: 5,
              ),
            ],
          ),
        ),
        PlatformButton(
          child: Text("Submit"),
          onPressed: () {
            DateTime now = DateTime.now();
            String time = now.minute < 10
                ? "${now.hour.toString()}:0${now.minute
                .toString()}"
                : "${now.hour.toString()}:${now.minute.toString()}";
            String date = "${now.day}/${now.month}/${now.year}";
            BroadcastAPI.sendMessage(nameController.text,
                messageController.text, time, date);
          },
        ),
      ],
    );
  }
}
