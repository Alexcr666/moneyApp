import 'package:meta/meta.dart';

@immutable
class PostsStateSignUp {
  final bool isError;
  final bool isLoading;

  // final List<modelFavorites> posts;

  PostsStateSignUp({
    this.isError,
    this.isLoading,
    //this.posts,
  });

  factory PostsStateSignUp.initial() => PostsStateSignUp(
        isLoading: false,
        isError: false,
        // posts: const [],
      );

  PostsStateSignUp copyWith({
    @required bool isError,
    @required bool isLoading,
    //  @required List<modelFavorites> posts,
  }) {
    return PostsStateSignUp(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      //posts: posts ?? this.posts,
    );
  }
}
