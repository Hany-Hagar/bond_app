// ignore_for_file: strict_top_level_inference

import 'profile_state.dart';
import 'package:flutter/material.dart';
import '../../data/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/server_locator.dart';
import '../../../../core/services/secure_storage_service.dart';
import '../../../../core/features/auth/manager/auth_cubit.dart';
import '../../../../core/features/auth/data/models/user_model.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  final SecureStorageService secure;
  ProfileCubit({required this.profileRepo, required this.secure})
    : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  UserModel get user => getIt<AuthCubit>().user;

  var formKey = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var nicknameController = TextEditingController();
  var bioController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  var autoValidate = AutovalidateMode.disabled;
  var autoValidate2 = AutovalidateMode.disabled;
  
  void setControllers() {
    var user = getIt<AuthCubit>().user;
    autoValidate = AutovalidateMode.disabled;
    autoValidate2 = AutovalidateMode.disabled;
    firstNameController.text = user.firstName;
    lastNameController.text = user.lastName;
    bioController.text = user.bio ?? '';
    nicknameController.text = user.username ?? '';
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibilityState());
  }

  void submit() {
    if (!formKey.currentState!.validate()) return;
    if (passwordController.text.isNotEmpty) {
      if (!formKey2.currentState!.validate()) return;
    }
    try {
      var token = secure.cachedToken;
      if (token == null) {
        emit(ProfileFailure(error: 'User not authenticated'));
        return;
      }
      emit(ProfileLoading());
      profileRepo
          .updateProfile(
            token: token,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            username: nicknameController.text,
            bio: bioController.text,
            password: passwordController.text.isEmpty
                ? null
                : passwordController.text,
          )
          .then((result) {
            result.fold((l) => emit(ProfileFailure(error: l.message)), (r) {
              getIt<AuthCubit>().user = r;
              emit(ProfileSuccess());
            });
          });
    } catch (e) {
      emit(ProfileFailure(error: e.toString()));
    }
  }

}
