import '../widgets/settings_top.dart';
import 'package:flutter/material.dart';
import '../widgets/settings_body.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../login/pages/views/login_view.dart';
import '../../../core/utils/navigator_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/features/auth/manager/auth_state.dart';
import '../../../core/features/auth/manager/auth_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogoutSuccess || state is DeleteAccountSuccess) {
          NavTo.pushReplacement(context: context, nextPage: LoginView());
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            SettingsTop(title: S.of(context).settings),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SettingsBody(),
            ),
          ],
        ),
      ),
    );
  }
}
