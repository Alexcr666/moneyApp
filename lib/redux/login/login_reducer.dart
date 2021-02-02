



import 'package:ecloudatm/redux/login/login_actions.dart';
import 'package:ecloudatm/redux/login/login_state.dart';
import 'package:ecloudatm/redux/sign_up/sign_up_actions.dart';
import 'package:ecloudatm/redux/sign_up/sign_up_state.dart';


postsReducer(PostsStateLogin prevState, SetPostsStateActionLogin action) {
  final payload = action.postsState;
  return prevState.copyWith(
    isError: payload.isError,
    isLoading: payload.isLoading,
   // posts: payload.posts,
  );
}