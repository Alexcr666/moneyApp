import 'package:ecloudatm/data/models/location/locationCountry.dart';
import 'package:ecloudatm/data/models/location/locationCountryState.dart';
import 'package:meta/meta.dart';

@immutable
class PostsStateSignUp {
  final bool isError;
  final bool isLoading;
  final String codeCountry;
  final String initialCountry;

  final List<modelLocationCountry> listCountry;
  final List<modelLocationCountryState> listCountryState;

  PostsStateSignUp({
    this.isError,
    this.isLoading,
    this.codeCountry,
    this.initialCountry,
    this.listCountry,
    this.listCountryState,
    //this.posts,
  });

  factory PostsStateSignUp.initial() => PostsStateSignUp(
        isLoading: false,
        isError: false,
        codeCountry: "+57",
        initialCountry: "CO",
        listCountry: const [],
        listCountryState: const [],
      );

  PostsStateSignUp copyWith({
    @required bool isError,
    @required bool isLoading,
    @required String codeCountry,
    @required String initialCountry,
    @required List<modelLocationCountry> listCountry,
    @required List<modelLocationCountryState> listCountryState,
  }) {
    return PostsStateSignUp(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      codeCountry: codeCountry ?? this.codeCountry,
      initialCountry: initialCountry ?? this.initialCountry,
      listCountry: listCountry ?? this.listCountry,
      listCountryState: listCountryState ?? this.listCountryState,
    );
  }
}
