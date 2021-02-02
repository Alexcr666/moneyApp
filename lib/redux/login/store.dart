import 'package:ecloudatm/redux/login/login_actions.dart';
import 'package:ecloudatm/redux/login/login_reducer.dart';
import 'package:ecloudatm/redux/login/login_state.dart';

import 'package:ecloudatm/redux/sign_up/sign_up_state.dart';
import 'package:meta/meta.dart';

import 'package:redux/redux.dart';

AppStateLogin appReducerLogin(AppStateLogin state, dynamic action) {
  if (action is SetPostsStateActionLogin) {
    final nextPostsState = postsReducer(state.postsState, action);

    return state.copyWith(postsState: nextPostsState);
  }

  return state;
}

@immutable
class AppStateLogin {
  final PostsStateLogin postsState;

  AppStateLogin({
    @required this.postsState,
  });

  AppStateLogin copyWith({
    PostsStateLogin postsState,
  }) {
    return AppStateLogin(
      postsState: postsState ?? this.postsState,
    );
  }
}

class ReduxLogin {
  static Store<AppStateLogin> _store;

  static Store<AppStateLogin> get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final postsStateInitial = PostsStateLogin.initial();

    _store = Store<AppStateLogin>(
      appReducerLogin,
      middleware: [],
      initialState: AppStateLogin(postsState: postsStateInitial),
    );
  }
}
