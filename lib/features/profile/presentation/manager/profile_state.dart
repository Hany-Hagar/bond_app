sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class ChangePasswordVisibilityState extends ProfileState {}

class PasswordChangedState extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {}

class ProfileFailure extends ProfileState {
  final String error;
  ProfileFailure({required this.error});
}
