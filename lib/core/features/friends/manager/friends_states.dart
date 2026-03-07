sealed class FriendsStates {}

class FriendsInitialState extends FriendsStates {}

class FriendsLoadingState extends FriendsStates {}

class FriendsSuccessState extends FriendsStates {}

class FriendsErrorState extends FriendsStates {
  final String errorMessage;

  FriendsErrorState(this.errorMessage);
}

class FriendsSearchState extends FriendsStates {}
