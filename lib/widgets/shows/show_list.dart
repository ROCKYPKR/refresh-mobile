import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fresh_air/redux/app_state.dart';
import 'package:fresh_air/widgets/shows/show_preview.dart';

class ShowList extends StatelessWidget {
  ShowList({Key key, this.previews}) : super(key: key);
  final List<ShowPreview> previews;

  List<ShowPreview> filterList(List<ShowPreview> list, String search){
    list = list.where((preview){
      return preview.title.contains(search);
    }).toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, List<ShowPreview>>(
      converter: (store) {
        return filterList(previews, store.state.showSearch);
      },
      builder: (context, list) {
        return new GridView.builder(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.8),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return list[index];
            });
      },
    );
  }
}
