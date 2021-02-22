import 'package:ecloudatm/redux/sign_up/sign_up_actions.dart';
import 'package:ecloudatm/redux/sign_up/sign_up_state.dart';

postsReducer(PostsStateSignUp prevState, SetPostsStateActionSignUp action) {
  final payload = action.postsState;
  return prevState.copyWith(
    isError: payload.isError,
    isLoading: payload.isLoading,
    initialCountry: payload.initialCountry,
    codeCountry: payload.codeCountry,
    listCountryState: payload.listCountryState,
    listCountry: payload.listCountry,
    // posts: payload.posts,
  );
}
