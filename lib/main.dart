import 'package:flutter/material.dart';
import 'package:fresh_air/redux/app_state.dart';
import 'package:fresh_air/widgets/events/event_filter_values.dart';
import 'package:fresh_air/widgets/start_page.dart';
import 'package:fresh_air/redux/reducers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<AppState>(appReducers,
      initialState: AppState(eventValues: EventFilterValues()));
  runApp(FreshAir(store));
}

class FreshAir extends StatelessWidget {
  FreshAir(this.store);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'FreshAir',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: StartPage(),
      ),
    );
  }
}
