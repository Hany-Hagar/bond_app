sealed class RequestsStates {}

class RequestsInitialState extends RequestsStates {}

class RequestsLoadingState extends RequestsStates {}

class RequestsSuccessState extends RequestsStates {}

class RequestsFailureState extends RequestsStates {
  final String message;
  RequestsFailureState({required this.message});
}

class RequestsSearchState extends RequestsStates {}

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