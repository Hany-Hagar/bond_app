// ignore_for_file: strict_top_level_inference
import 'dart:io';
import 'dart:developer';
import 'auth_state.dart';
import '../data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import '../data/models/user_model.dart';
import '../../../di/server_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/secure_storage_service.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  final SecureStorageService secure;
  AuthCubit({required this.authRepo, required this.secure})
    : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  late UserModel user = UserModel.empty();

  // Auto Sign-In

  void autoSignIn() async {
    final token = await getIt<SecureStorageService>().getToken();
    if (token == null) {
      emit(AutoSignFailureState());
      return;
    } else {
      var result = await authRepo.autoSignIn(token: token);
      result.fold((l) => emit(AutoSignFailureState()), (r) {
        user = r;
        emit(AutoSignSuccessState(user: r));
      });
    }
  }

  // Login Variables and Methods

  bool loginPasswordVisible = false;
  var loginKey = GlobalKey<FormState>();
  var loginEmail = TextEditingController();
  var loginPassword = TextEditingController();
  var loginAutoValidateMode = AutovalidateMode.disabled;

  void changeLoginPasswordVisibility() {
    loginPasswordVisible = !loginPasswordVisible;
    emit(ChangePasswordVisibilityState());
  }

  void login() async {
    if (!loginKey.currentState!.validate()) {
      loginAutoValidateMode = AutovalidateMode.onUserInteraction;
      emit(ChangeAutoValidateState());
      return;
    }
    emit(AuthLoadingState());
    var result = await authRepo.login(
      email: loginEmail.text.toLowerCase(),
      password: loginPassword.text,
    );
    result.fold((l) => emit(FailureState(l.message)), (r) {
      getIt.get<SecureStorageService>().saveToken(r.token);
      user = r.user;
      log("user data: ${user.toJson()}");
      emit(LoginSuccess(user: r.user));
    });
  }

  void clearLoginControllers() {
    loginEmail.clear();
    loginPassword.clear();
    loginAutoValidateMode = AutovalidateMode.disabled;
  }

  // Register Variables and Methods
  bool registerPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  var registerKey = GlobalKey<FormState>();
  var registerEmail = TextEditingController();
  var registerPassword = TextEditingController();
  var registerLastName = TextEditingController();
  var registerFirstName = TextEditingController();
  var registerConfirmPassword = TextEditingController();
  var registerAutoValidateMode = AutovalidateMode.disabled;

  void changeRegisterPasswordVisibility() {
    registerPasswordVisible = !registerPasswordVisible;
    emit(ChangePasswordVisibilityState());
  }

  void changeRegisterConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(ChangePasswordVisibilityState());
  }

  Future<void> register() async {
    if (!registerKey.currentState!.validate()) {
      registerAutoValidateMode = AutovalidateMode.onUserInteraction;
      emit(ChangeAutoValidateState());
      return;
    }
    emit(AuthLoadingState());
    var userData = {
      "email": registerEmail.text.toLowerCase(),
      "password": registerPassword.text,
      "firstName": registerFirstName.text,
      "lastName": registerLastName.text,
      "username": "${registerFirstName.text} ${registerLastName.text}",
    };
    var result = await authRepo.register(userData: userData);
    result.fold(
      (l) {
        emit(FailureState(l.message));
      },
      (r) {
        getIt.get<SecureStorageService>().saveToken(r.token);
        user = r.user;
        emit(RegisterSuccess(token: r.token));
      },
    );
  }

  void clearRegisterControllers() {
    registerEmail.clear();
    registerPassword.clear();
    registerFirstName.clear();
    registerLastName.clear();
    registerConfirmPassword.clear();
    registerAutoValidateMode = AutovalidateMode.disabled;
  }

  // Complete Info
  var nickname = TextEditingController();
  var bio = TextEditingController();
  var completeInfoKey = GlobalKey<FormState>();
  Future<void> uploadProfileImage({
    required File image,
    required String path,
  }) async {
    var token = getIt<SecureStorageService>().cachedToken;
    var result = await authRepo.uploadProfileImage(token: token!, image: image);
    result.fold((l) => emit(FailureState(l.message)), (r) {
      user = user.copyWith(profileImagePath: path, profileImageUrl: r);
      emit(ImageUpdatedSuccess());
    });
  }

  Future<void> completeInfoButton() async {
    if (!completeInfoKey.currentState!.validate()) return;
    emit(AuthLoadingState());
    var map = {"username": nickname.text, "bio": bio.text};
    var token = getIt<SecureStorageService>().cachedToken;
    var data = await authRepo.completeInfo(token: token!, data: map);
    data.fold((l) => emit(FailureState(l.message)), (r) {
      user = r;
      emit(CompleteInfoSuccess());
    });
  }

  void sendResetPasswordEmail() {}

  void logout() {
    getIt.get<SecureStorageService>().deleteToken();
    user = UserModel.empty();
    emit(LogoutSuccess());
  }

  void deleteAccount() async {
    var result = await authRepo.deleteUser(
      token: getIt.get<SecureStorageService>().cachedToken!,
    );
    result.fold((l) => emit(FailureState(l.message)), (r) {
      getIt.get<SecureStorageService>().deleteToken();
      user = UserModel.empty();
      emit(DeleteAccountSuccess());
    });
  }
}
