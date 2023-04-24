import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:store_redux_app/src/redux/posts/actions.dart';
import 'package:store_redux_app/src/redux/posts/reducers.dart';
import 'package:store_redux_app/src/redux/posts/state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetPostsStateAction) {
    final nextPostsState = postsReducer(state.postsState, action);

    return state.copyWith(postsState: nextPostsState);
  }

  return state;
}

@immutable
class AppState {
  final PostsState postsState;

  AppState({
    required this.postsState,
  });

  AppState copyWith({
    required PostsState postsState,
  }) {
    return AppState(
      postsState: postsState,
    );
  }
}

class Redux {
  static Store<AppState>? _store;

  static Store<AppState>? get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final postsStateInitial = PostsState.initial();

    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(postsState: postsStateInitial),
    );
  }
}