import 'package:meta/meta.dart';
import 'package:store_redux_app/src/i_post.dart';

@immutable
class PostsState {
  final bool isError;
  final bool isLoading;
  final List<ProductModel> posts;

  PostsState({
    required this.isError,
    required this.isLoading,
    required this.posts,
  });

  factory PostsState.initial() => PostsState(
        isLoading: false,
        isError: false,
        posts: const [],
      );

  PostsState copyWith({
    required bool isError,
    required bool isLoading,
    required List<ProductModel> posts,
  }) {
    return PostsState(
      isError: isError,
      isLoading: isLoading,
      posts: posts,
    );
  }
}