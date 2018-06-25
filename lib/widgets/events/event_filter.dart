import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fresh_air/redux/actions.dart';
import 'package:fresh_air/redux/app_state.dart';
import 'package:fresh_air/widgets/events/event_filter_values.dart';

class EventFilter extends StatelessWidget {
  EventFilter({Key key}) : super(key: key);
  final EventFilterValues values = new EventFilterValues();

  @override
  Widget build(BuildContext context) {
    return new IconButton(
      icon: const Icon(Icons.filter_list),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => new Container(
                height: 500.0,
                padding: const EdgeInsets.all(20.0),
                child: new Container(
                  child: StoreConnector<AppState, Function(EventFilterValues)>(
                    converter: (store) {
                      return (values) =>
                          store.dispatch(EventFilterChangeAction(values));
                    },
                    builder: (context, callback) {
                      return new Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                                labelText: "Filter by name"),
                            onChanged: (text) {
                              values.name = text;
                              callback(values);
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: "Filter by location"),
                            onChanged: (text) {
                              values.location = text;
                              callback(values);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
        );
      },
    );
  }
}
