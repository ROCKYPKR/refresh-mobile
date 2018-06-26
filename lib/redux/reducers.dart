import 'package:fresh_air/redux/actions.dart';
import 'package:fresh_air/redux/app_state.dart';

AppState appReducers(AppState state, dynamic action){
  if(action is EventFilterChangeAction){
    return eventFilterChange(state, action);
  }
  if(action is ShowSearchChangeAction){
    return showSearchChange(state, action);
  }
  return state;
}

AppState eventFilterChange(AppState state, EventFilterChangeAction action){
  return state.copyWith(eventValues: action.values);
}

AppState showSearchChange(AppState state, ShowSearchChangeAction action){
  return state.copyWith(showSearch: action.search);
}