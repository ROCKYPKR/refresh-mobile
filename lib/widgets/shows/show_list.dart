import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fresh_air/helpers/website_api.dart';
import 'package:fresh_air/redux/app_state.dart';
import 'package:fresh_air/widgets/shows/show_preview.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class ShowList extends StatelessWidget {
  ShowList({Key key, this.previews}) : super(key: key);
  final List<ShowPreview> previews;

  Future<List<ShowPreview>> refreshList(BuildContext context) async {
    var list = await WebsiteAPI.getAllShows().then((shows){
      return shows.map((data){
        return ShowPreview(data: data);
      });
    });
    var state = StoreProvider.of<AppState>(context).state;
    return filterList(list.toList(), state.showSearch);
  }

  List<ShowPreview> filterList(List<ShowPreview> list, String search) {
    list = list.where((preview) {
      return preview.title.toLowerCase().contains(search.toLowerCase());
    }).toList();
    return list;
  }

  @override
  Widget build(BuildContext buildContext) {
    return StoreConnector<AppState, List<ShowPreview>>(
      converter: (store) {
        return filterList(previews, store.state.showSearch);
      },
      builder: (_, list) {
        return LiquidPullToRefresh(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.8),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return list[index];
            },
          ),
          onRefresh: (){
            return refreshList(buildContext);
          },
          showChildOpacityTransition: false,
        );
      },
    );
  }
}
