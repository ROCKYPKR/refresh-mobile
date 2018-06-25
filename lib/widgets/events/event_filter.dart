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
                            decoration:
                                InputDecoration(labelText: "Filter by name"),
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
                          Row(
                            children: <Widget>[
                              DropdownButton<String>(
                                value: values.startToggle,
                                onChanged: (value) {
                                  values.startToggle = value;
                                  callback(values);
                                },
                                items: <DropdownMenuItem<String>>[
                                  DropdownMenuItem<String>(
                                    child: new Text("Before"),
                                    value: "Before",
                                  ),
                                  DropdownMenuItem<String>(
                                    child: new Text("After"),
                                    value: "After",
                                  ),
                                ],
                              ),
                              RaisedButton(
                                child: new Text(values.start == null
                                    ? "Choose a Date and Time"
                                    : values.start.toString()),
                                onPressed: () async {
                                  DateTime date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now().subtract(
                                          const Duration(days: 365 * 5),
                                        ),
                                    lastDate: DateTime.now().add(
                                          const Duration(days: 365 * 5),
                                        ),
                                  );
                                  if (date != null) {
                                    TimeOfDay time = await showTimePicker(
                                        context: context,
                                        initialTime: new TimeOfDay.now());
                                    if (time != null) {
                                      DateTime result = DateTime(
                                          date.year,
                                          date.month,
                                          date.day,
                                          time.hour,
                                          time.minute);
                                      values.start = result;
                                      callback(values);
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              DropdownButton<String>(
                                value: values.endToggle,
                                onChanged: (value) {
                                  values.endToggle = value;
                                  callback(values);
                                },
                                items: <DropdownMenuItem<String>>[
                                  DropdownMenuItem<String>(
                                    child: new Text("Before"),
                                    value: "Before",
                                  ),
                                  DropdownMenuItem<String>(
                                    child: new Text("After"),
                                    value: "After",
                                  ),
                                ],
                              ),
                              RaisedButton(
                                child: new Text(values.end == null
                                                    ? "Choose a Date and Time"
                                                    : values.end.toString()),
                                onPressed: () async {
                                  DateTime date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now().subtract(
                                      const Duration(days: 365 * 5),
                                      ),
                                    lastDate: DateTime.now().add(
                                      const Duration(days: 365 * 5),
                                      ),
                                    );
                                  if (date != null) {
                                    TimeOfDay time = await showTimePicker(
                                        context: context,
                                        initialTime: new TimeOfDay.now());
                                    if (time != null) {
                                      DateTime result = DateTime(
                                          date.year,
                                          date.month,
                                          date.day,
                                          time.hour,
                                          time.minute);
                                      values.end = result;
                                      callback(values);
                                    }
                                  }
                                },
                                ),
                            ],
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
