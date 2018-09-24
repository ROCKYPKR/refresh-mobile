import 'package:flutter/material.dart';
import 'package:fresh_air/widgets/events/event_filter_values.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  AppState({this.eventValues, this.showSearch = ""});

  final EventFilterValues eventValues;
  final String showSearch;

  AppState copyWith({EventFilterValues eventValues, String showSearch}) {
    return AppState(eventValues: eventValues ?? this.eventValues, showSearch: showSearch ?? this.showSearch);
  }

  AppState reset(){
    return AppState(eventValues: EventFilterValues(), showSearch: "");
  }
}
