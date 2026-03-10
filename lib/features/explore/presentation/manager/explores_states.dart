sealed class ExploresStates {}

class ExploreInitialState extends ExploresStates {}

class ExploreLoadingState extends ExploresStates {}

class ExploreSuccessState extends ExploresStates {}

class ExploreFailureState extends ExploresStates {
  final String message;
  ExploreFailureState({required this.message});
}

class FriendsSearchState extends ExploresStates {}

<<<<<<< HEAD

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
=======
class SendFriendRequestLoadingState extends ExploresStates {}

class SendFriendRequestSuccessState extends ExploresStates {}
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
