import '../data/models/user_model.dart';

abstract class AuthState {}

// Global States
class AuthInitialState extends AuthState {}

// Auto Sign-In States
class AutoSignSuccessState extends AuthState {
  final UserModel user;
  AutoSignSuccessState({required this.user});
}

class AutoSignFailureState extends AuthState {}

// Login & Register States

class ChangeAutoValidateState extends AuthState {}

class ChangePasswordVisibilityState extends AuthState {}

class AuthLoadingState extends AuthState {}

class LoginSuccess extends AuthState {
  final UserModel user;
  LoginSuccess({required this.user});
}

class RegisterSuccess extends AuthState {
  final String token;
  RegisterSuccess({required this.token});
}



class ImageUpdatedSuccess extends AuthState {}

class CompleteInfoSuccess extends AuthState {}

class SentResetPasswordEmailSuccess extends AuthState {}

class ResetPasswordSuccess extends AuthState {}

class LogoutSuccess extends AuthState {}

class DeleteAccountSuccess extends AuthState {}

class FailureState extends AuthState {
  final String message;
  FailureState(this.message);
}
