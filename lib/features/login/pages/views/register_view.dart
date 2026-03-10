// ignore_for_file: use_build_context_synchronously

import 'complete_info_view.dart';
import 'package:flutter/material.dart';
import '../widgets/register_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/navigator_methods.dart';
import '../../../../core/features/auth/manager/auth_cubit.dart';
import '../../../../core/features/auth/manager/auth_state.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          var cubit = AuthCubit.get(context);
          cubit.nickname.text =
              "${cubit.user.firstName} ${cubit.user.lastName}";

          NavTo.pushReplacement(context: context, nextPage: CompleteInfoView());
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(child: RegisterBody()),
        ),
      ),
    );
  }
}
