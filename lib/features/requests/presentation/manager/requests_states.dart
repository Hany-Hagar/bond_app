sealed class RequestsStates {}

class RequestsInitialState extends RequestsStates {}

class RequestsLoadingState extends RequestsStates {}

class RequestsSuccessState extends RequestsStates {}

class RequestsFailureState extends RequestsStates {
  final String message;
  RequestsFailureState({required this.message});
}

class RequestsSearchState extends RequestsStates {}

<<<<<<< HEAD
// Accept Request States

class AcceptRequestLoadingState extends RequestsStates {
  final int requestId;
  AcceptRequestLoadingState({required this.requestId});
}

class AcceptRequestSuccessState extends RequestsStates {}

// Decline Request States

class DeclineRequestLoadingState extends RequestsStates {
  final int requestId;
  DeclineRequestLoadingState({required this.requestId});
}

class DeclineRequestSuccessState extends RequestsStates {}
=======
class AcceptRequestLoadingState extends RequestsStates {}

class AcceptRequestSuccessState extends RequestsStates {}
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
