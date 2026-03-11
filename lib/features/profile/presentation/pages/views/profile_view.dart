import '../widgets/profile_body.dart';
import 'package:flutter/material.dart';
import '../../manager/profile_cubit.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../settings/presentation/widgets/settings_top.dart';
import '../../../../../core/widgets/custom_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..setControllers(),
      child: BackGround(
        top: SettingsTop(title: S.of(context).profile),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ProfileBody(),
          ),
        ),
      ),
    );
  }
}
