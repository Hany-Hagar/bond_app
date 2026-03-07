sealed class ChatsState {}

class ChatsInitialState extends ChatsState {}

class FriendsLoadingState extends ChatsState {}
class FriendsLoadedState extends ChatsState {}
class FriendsErrorState extends ChatsState {
  final String message;

  FriendsErrorState(this.message);
}

class ChatsLoadingState extends ChatsState {}

class ChatsLoadedState extends ChatsState {}

class ChatsErrorState extends ChatsState {
  final String message;

  ChatsErrorState(this.message);
}
