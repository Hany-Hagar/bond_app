import '../models/app_user_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SettingsCubit extends HydratedCubit<AppUserPref> {
  SettingsCubit() : super(AppUserPref.standard());

  // ignore: strict_top_level_inference
  static SettingsCubit get(context) => BlocProvider.of<SettingsCubit>(context);

  // --- Functional Updates ---

  void updateLanguage(String lang) => emit(state.copyWith(lang: lang));

  void updateTheme(ThemeMode theme) => emit(state.copyWith(theme: theme));

  void setFirstTime() => emit(state.copyWith(isFirstTime: !state.isFirstTime));

  void toggleNotifications() =>
      emit(state.copyWith(notificationsEnabled: !state.notificationsEnabled));

  void toggleVibration() =>
      emit(state.copyWith(vibrationEnabled: !state.vibrationEnabled));


  @override
  AppUserPref? fromJson(Map<String, dynamic> json) {
    try {
      return AppUserPref.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AppUserPref state) {
    try {
      return state.toJson();
    } catch (e) {
      return null;
    }
  }
}
