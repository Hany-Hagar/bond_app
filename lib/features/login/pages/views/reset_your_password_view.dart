import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../widgets/success_login_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/reset_your_password_body.dart';
import '../../../../core/features/auth/manager/auth_state.dart';
import '../../../../core/features/auth/manager/auth_cubit.dart';

class ResetYourPasswordView extends StatelessWidget {
  const ResetYourPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          showDialog(
            context: context,
            builder: (context) =>
                SuccessLoginDialog(message: S.of(context).resetPasswordSuccess),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const SingleChildScrollView(child: ResetYourPasswordBody()),
        ),
      ),
    );
  }
}
