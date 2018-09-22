import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fresh_air/redux/actions.dart';
import 'package:fresh_air/redux/app_state.dart';

class ShowFilterButton extends StatelessWidget {
  ShowFilterButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (_) => Container(
                  height: 500.0,
                  padding: const EdgeInsets.all(20.0),
                  child: StoreConnector<AppState, Function(String)>(
                    converter: (store) {
                      return (search) =>
                          store.dispatch(ShowSearchChangeAction(search));
                    },
                    builder: (context, callback) {
                      return TextField(
                        decoration:
                            InputDecoration(labelText: "Search by name"),
                        onChanged: (text) {
                          callback(text);
                        },
                      );
                    },
                  ),
                ));
      },
    );
  }
}
