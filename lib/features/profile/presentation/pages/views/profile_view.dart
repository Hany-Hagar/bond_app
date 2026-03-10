import '../widgets/profile_body.dart';
import 'package:flutter/material.dart';
import '../../manager/profile_cubit.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/server_locator.dart';
<<<<<<< HEAD
import '../../../../settings/presentation/widgets/settings_top.dart';
=======
import '../../../../settings/widgets/settings_top.dart';
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
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

