sealed class ExploresStates {}

class ExploreInitialState extends ExploresStates {}

class ExploreLoadingState extends ExploresStates {}

class ExploreSuccessState extends ExploresStates {}

class ExploreFailureState extends ExploresStates {
  final String message;
  ExploreFailureState({required this.message});
}

class FriendsSearchState extends ExploresStates {}


// Send Friend Request States

class SendFriendRequestLoadingState extends ExploresStates {
  final int userId;
  SendFriendRequestLoadingState({required this.userId});
}

class SendFriendRequestSuccessState extends ExploresStates {}


// Cancel Friend Request States

class CancelFriendRequestLoadingState extends ExploresStates {
  final int userId;
  CancelFriendRequestLoadingState({required this.userId});
}

class CancelFriendRequestSuccessState extends ExploresStates {}

// Accept Friend Request States

class AcceptFriendRequestLoadingState extends ExploresStates {
  final int userId;
  AcceptFriendRequestLoadingState({required this.userId});
}

class AcceptFriendRequestSuccessState extends ExploresStates {}