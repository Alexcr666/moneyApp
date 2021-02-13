import 'package:meta/meta.dart';

@immutable
class PostsStateLogin {
  final bool isError;
  final bool isLoading;

  // final List<modelFavorites> posts;

  PostsStateLogin({
    this.isError,
    this.isLoading,
    //this.posts,
  });

  factory PostsStateLogin.initial() => PostsStateLogin(
        isLoading: false,
        isError: false,
        // posts: const [],
      );

  PostsStateLogin copyWith({
    @required bool isError,
    @required bool isLoading,
    //  @required List<modelFavorites> posts,
  }) {
    return PostsStateLogin(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      //posts: posts ?? this.posts,
    );
  }
}
