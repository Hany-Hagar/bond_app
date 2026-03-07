// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/features/settings/models/app_user_pref.dart';
import '../../../../../core/features/settings/manager/settings_cubit.dart';

class AppSettingsBody extends StatelessWidget {
  const AppSettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: S.of(context).theme,
          size: 20.sp,
          type: Type.overMedium,
        ),
        SizedBox(height: 10.h),
        _ThemeItems(),
        SizedBox(height: 20.h),
        CustomText(
          text: S.of(context).language,
          size: 20.sp,
          type: Type.overMedium,
        ),
        SizedBox(height: 10.h),
        _LangItems(),
      ],
    );
  }
}

class _ThemeItems extends StatelessWidget {
  const _ThemeItems();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    Map<ThemeMode, String> languagesMap = {
      ThemeMode.light: s.light,
      ThemeMode.dark: s.dark,
      ThemeMode.system: s.system,
    };
    var theme = Theme.of(context);

    return BlocBuilder<SettingsCubit, AppUserPref>(
      builder: (context, state) {
        final ThemeMode current = state.theme;
        return Card(
          clipBehavior: Clip.antiAlias,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: languagesMap.entries.map((entry) {
              return RadioListTile<ThemeMode>(
                value: entry.key,
                groupValue: current,
                activeColor: theme.primaryColor,
                selectedTileColor: theme.primaryColor.withOpacity(0.1),
                title: CustomText(text: entry.value, size: 20.sp),
                selected: current == entry.key,
                contentPadding: EdgeInsets.zero,
                onChanged: (ThemeMode? value) {
                  if (value != null) {
                    context.read<SettingsCubit>().updateTheme(value);
                  }
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class _LangItems extends StatelessWidget {
  const _LangItems();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    Map<String, String> languagesMap = {
      'en': s.english,
      'ar': s.arabic,
      "fr": s.french,
      "de": s.german,
      "it": s.italian,
    };
    var theme = Theme.of(context);

    return BlocBuilder<SettingsCubit, AppUserPref>(
      builder: (context, state) {
        final String currentLang = state.lang;
        return Card(
          clipBehavior: Clip.antiAlias,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: languagesMap.entries.map((entry) {
              return RadioListTile<String>(
                value: entry.key,
                groupValue: currentLang,
                activeColor: theme.primaryColor,
                selectedTileColor: theme.primaryColor.withOpacity(0.1),
                title: CustomText(text: entry.value, size: 20.sp),
                selected: currentLang == entry.key,
                contentPadding: EdgeInsets.zero,
                onChanged: (String? value) {
                  if (value != null) {
                    context.read<SettingsCubit>().updateLanguage(value);
                  }
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
