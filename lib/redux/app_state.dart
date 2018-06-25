import 'package:flutter/material.dart';
import 'package:fresh_air/widgets/events/event_filter_values.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  AppState({this.eventValues});

  final EventFilterValues eventValues;

  AppState copyWith({EventFilterValues eventValues}) {
    return new AppState(eventValues: eventValues ?? this.eventValues);
  }
}
