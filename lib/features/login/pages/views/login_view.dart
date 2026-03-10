import '../widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/pages/layout_view.dart';
import '../../../../core/utils/navigator_methods.dart';
import '../../../../core/features/auth/manager/auth_state.dart';
import '../../../../core/features/auth/manager/auth_cubit.dart';
import '../../../../core/features/friends/manager/friends_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          AuthCubit.get(context).clearLoginControllers();
          FriendsCubit.get(context).fetchFriends();
          NavTo.pushReplacement(context: context, nextPage: LayoutView());
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(child: LoginBody()),
        ),
      ),
    );
  }
}
