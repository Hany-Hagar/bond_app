import 'generated/l10n.dart';
import 'core/utils/theme.dart';
import 'core/di/server_locator.dart';
import 'core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'core/utils/my_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'core/features/auth/manager/auth_state.dart';
import 'core/features/auth/manager/auth_cubit.dart';
import 'core/features/friends/manager/friends_cubit.dart';
import 'core/features/settings/models/app_user_pref.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/features/settings/manager/settings_cubit.dart';
import 'features/profile/presentation/manager/profile_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/features/chats/presentation/manager/chats_cubit.dart';
import 'features/explore/presentation/manager/explores_cubit.dart';
import 'features/splash/presentation/pages/views/splash_view.dart';
import 'features/requests/presentation/manager/requests_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupLocator();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldMessengerState> snackbarKey =
        GlobalKey<ScaffoldMessengerState>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<SettingsCubit>()),
        BlocProvider(create: (_) => getIt<AuthCubit>()),
        BlocProvider(create: (_) => getIt<FriendsCubit>()),
        BlocProvider(create: (_) => getIt<ChatsCubit>()),
        BlocProvider(create: (_) => getIt<ExploresCubit>()),
        BlocProvider(create: (_) => getIt<RequestsCubit>()),
        BlocProvider(create: (_) => getIt<ProfileCubit>()),
      ],
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is FailureState) {
            snackbarKey.currentState?.showSnackBar(
              SnackBar(
                content: CustomText(
                  text: state.message,
                  size: 20.sp,
                  maxLines: 5,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        },
        child: BlocBuilder<SettingsCubit, AppUserPref>(
          builder: (context, state) {
            return ScreenUtilInit(
              designSize: const Size(440, 965),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_, child) {
                return MaterialApp(
                  title: 'Ibond',
                  themeMode: state.theme,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  scaffoldMessengerKey: snackbarKey,
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: [
                    S.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  locale: Locale(state.lang),
                  home: const SplashView(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
