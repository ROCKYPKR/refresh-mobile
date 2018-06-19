import 'package:flutter/material.dart';
import 'package:fresh_air/widgets/events/EventPreview.dart';

class EventList extends StatelessWidget {
  EventList({Key key, this.previews}) : super(key: key);
  final List<EventPreview> previews;

  @override
  Widget build(BuildContext context) {
    return new GridView.builder(
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8),
        itemCount: previews.length,
        itemBuilder: (context, index) {
          return previews[index];
        });
  }
}