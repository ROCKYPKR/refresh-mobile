import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fresh_air/redux/app_state.dart';
import 'package:fresh_air/widgets/events/event_filter_values.dart';
import 'package:fresh_air/widgets/events/event_preview.dart';

class EventList extends StatefulWidget {
  EventList({Key key, this.previews}) : super(key: key);

  final List<EventPreview> previews;

  @override
  _EventListState createState() => new _EventListState(previews);
}

class _EventListState extends State<EventList> {
  _EventListState(this.previews);

  List<EventPreview> previews;

  @override
  void initState() {
    super.initState();
    previews = widget.previews;
  }

  List<EventPreview> filterList(
      List<EventPreview> list, EventFilterValues values) {
    list = list.where((preview) {
      return preview.name.toLowerCase().contains(values.name.toLowerCase()) &&
          preview.location
              .toLowerCase()
              .contains(values.location.toLowerCase());
    }).toList();
    if (values.start != null) {
      if (values.startToggle == "Before") {
        list = list.where((preview) {
          print(preview.start.isBefore(values.start));
          return preview.start.isBefore(values.start);
        }).toList();
      } else if (values.startToggle == "After") {
        list = list.where((preview) {
          print(preview.start.isAfter(values.start));
          return preview.start.isAfter(values.start);
        }).toList();
      }
    }
    if (values.end != null) {
      if (values.endToggle == "Before") {
        list = list.where((preview) {
          return preview.end.isBefore(values.end);
        }).toList();
      } else if (values.endToggle == "After") {
        list = list.where((preview) {
          return preview.end.isAfter(values.end);
        }).toList();
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, List<EventPreview>>(
      converter: (store) {
        EventFilterValues values = store.state.eventValues;
        return filterList(previews, values);
      },
      builder: (context, list) {
        return new ListView(
          children: list,
        );
      },
    );
  }
}
