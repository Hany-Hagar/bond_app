import '../widgets/splash_body.dart';
import 'package:flutter/material.dart';
import '../../manager/splash_cubit.dart';
import '../../manager/splash_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../layout/pages/layout_view.dart';
import '../../../../login/pages/views/login_view.dart';
import '../../../../../../core/utils/navigator_methods.dart';
import '../../../../../../core/features/auth/manager/auth_state.dart';
import '../../../../../../core/features/auth/manager/auth_cubit.dart';
import '../../../../../core/features/friends/manager/friends_cubit.dart';
import '../../../../onBoarding/presentation/pages/views/on_boarding_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<SplashCubit, SplashState>(
            listener: (context, state) {
              if (state is FirstOpen) {
                NavTo.pushReplacement(
                  context: context,
                  nextPage: OnBoardingView(),
                );
              } else if (state is SplashLoaded) {
                AuthCubit.get(context).autoSignIn();
              }
            },
          ),
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AutoSignSuccessState) {
                FriendsCubit.get(context).fetchFriends();
                NavTo.pushReplacement(context: context, nextPage: LayoutView());
              } else if (state is AutoSignFailureState) {
                NavTo.pushReplacement(context: context, nextPage: LoginView());
              }
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Center(child: SplashBody()),
        ),
      ),
    );
  }
}
