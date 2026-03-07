sealed class RequestsStates {}

class RequestsInitialState extends RequestsStates {}

class RequestsLoadingState extends RequestsStates {}

class RequestsSuccessState extends RequestsStates {}

class RequestsFailureState extends RequestsStates {
  final String message;
  RequestsFailureState({required this.message});
}

class RequestsSearchState extends RequestsStates {}

class AcceptRequestLoadingState extends RequestsStates {}

class AcceptRequestSuccessState extends RequestsStates {}
