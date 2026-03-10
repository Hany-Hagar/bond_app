// ignore_for_file: deprecated_member_use

import '../widgets/settings_top.dart';
import '../widgets/app_settings_body.dart';
import 'package:flutter/material.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/custom_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSettingsView extends StatelessWidget {
  const AppSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return BackGround(
      top: SettingsTop(title: s.appSettings),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            AppSettingsBody(),
          ],
        ),
      ),
    );
  }
}
