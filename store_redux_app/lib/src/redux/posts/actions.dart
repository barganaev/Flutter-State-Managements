import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:store_redux_app/src/i_post.dart';
import 'package:store_redux_app/src/redux/posts/state.dart';
import 'package:store_redux_app/src/redux/store.dart';

@immutable
class SetPostsStateAction {
  final PostsState postsState;

  SetPostsStateAction(this.postsState);
}

Future<void> fetchPostsAction(Store<AppState> store) async {
  store.dispatch(SetPostsStateAction(PostsState(isLoading: true, isError: false, posts: [])));

  try {
    // final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products/'));
    assert(response.statusCode == 200);
    final jsonData = json.decode(response.body);
    store.dispatch(
      SetPostsStateAction(
        PostsState(
          isLoading: false,
          posts: ProductModel.listFromJsonn(jsonData), isError: false,
        ),
      ),
    );
  } catch (error) {
    store.dispatch(SetPostsStateAction(PostsState(isLoading: false, isError: false, posts: [])));
  }
}