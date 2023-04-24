import 'package:store_redux_app/src/redux/posts/actions.dart';
import 'package:store_redux_app/src/redux/posts/state.dart';

postsReducer(PostsState prevState, SetPostsStateAction action) {
  final payload = action.postsState;
  return prevState.copyWith(
    isError: payload.isError,
    isLoading: payload.isLoading,
    posts: payload.posts,
  );
}