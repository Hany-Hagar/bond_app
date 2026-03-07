sealed class ExploresStates {}

class ExploreInitialState extends ExploresStates {}

class ExploreLoadingState extends ExploresStates {}

class ExploreSuccessState extends ExploresStates {}

class ExploreFailureState extends ExploresStates {
  final String message;
  ExploreFailureState({required this.message});
}

class FriendsSearchState extends ExploresStates {}

class SendFriendRequestLoadingState extends ExploresStates {}

class SendFriendRequestSuccessState extends ExploresStates {}
