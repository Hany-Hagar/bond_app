import 'dart:developer';

import 'splash_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/features/settings/manager/settings_cubit.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()) {
    _checkFirstOpen();
  }

  Future<void> _checkFirstOpen() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      var isFirstTime = getIt<SettingsCubit>().state.isFirstTime;
      if (isFirstTime) {
        emit(FirstOpen());
      } else {
        emit(SplashLoaded());
      }
    } catch (e) {
      log('Error checking first open: $e');
    }
  }

  void authenticated() {
    emit(Authenticated());
  }
}
