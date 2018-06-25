import 'package:fresh_air/redux/actions.dart';
import 'package:fresh_air/redux/app_state.dart';

AppState appReducers(AppState state, dynamic action){
  if(action is EventFilterChangeAction){
    return eventFilterChange(state, action);
  }
  return state;
}

AppState eventFilterChange(AppState state, EventFilterChangeAction action){
  return state.copyWith(eventValues: action.values);
}