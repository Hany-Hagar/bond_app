import 'package:flutter/material.dart';

class AppUserPref {
  final String lang;
  final ThemeMode theme;
  final bool isFirstTime;
  final bool notificationsEnabled;
  final bool vibrationEnabled;
  AppUserPref({
    required this.lang,
    required this.theme,
    required this.isFirstTime,
    required this.notificationsEnabled,
    required this.vibrationEnabled,
  });

  factory AppUserPref.standard() {
    return AppUserPref(
      lang: "en",
      theme: ThemeMode.light,
      isFirstTime: true,
      notificationsEnabled: true,
      vibrationEnabled: true,
    );
  }

  AppUserPref copyWith({
    String? lang,
    ThemeMode? theme,
    bool? isFirstTime,
    bool? notificationsEnabled,
    bool? vibrationEnabled,
  }) {
    return AppUserPref(
      lang: lang ?? this.lang,
      theme: theme ?? this.theme,
      isFirstTime: isFirstTime ?? this.isFirstTime,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      vibrationEnabled: vibrationEnabled ?? this.vibrationEnabled,
    );
  }

  factory AppUserPref.fromJson(Map<String, dynamic> json) {
    return AppUserPref(
      lang: json['lang'] as String,
      theme: ThemeMode.values[json['theme'] as int],
      isFirstTime: json['isFirstTime'] as bool,
      notificationsEnabled: json['notificationsEnabled'] as bool,
      vibrationEnabled: json['vibrationEnabled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lang': lang,
      'theme': theme.index,
      'isFirstTime': isFirstTime,
      'notificationsEnabled': notificationsEnabled,
      'vibrationEnabled': vibrationEnabled,
    };
  }
}
