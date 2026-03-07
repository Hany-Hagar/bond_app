import 'reset_your_password_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../widgets/forget_password_body.dart';
import '../widgets/success_login_dialog.dart';
import '../../../../core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/utils/navigator_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/features/auth/manager/auth_cubit.dart';
import '../../../../core/features/auth/manager/auth_state.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SentResetPasswordEmailSuccess) {
          showDialog(
            context: context,
            builder: (context) => SuccessLoginDialog(child: _DialogBody()),
          );
          NavTo.push(context: context, nextPage: ResetYourPasswordView());
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const SingleChildScrollView(child: ForgetPasswordBody()),
        ),
      ),
    );
  }
}

class _DialogBody extends StatelessWidget {
  const _DialogBody();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: s.mailSent, type: Type.header, size: 18.w),
            SizedBox(width: 5.w),
            CustomText(
              text: s.successfully,
              type: Type.header,
              size: 18.w,
              color: Colors.green,
            ),
          ],
        ),
        SizedBox(height: 3.h),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: s.mailSentSubTitle,
                style: Styles.textStyle600.copyWith(
                  fontSize: 15.w,
                  color: theme.hintColor,
                ),
              ),
              TextSpan(
                text: s.inbox,
                style: Styles.textStyle800.copyWith(
                  fontSize: 16.w,
                  color: theme.highlightColor,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    //await getIt<UrlService>().openGmail();
                  },
              ),
              TextSpan(
                text: s.mailSentSubTitle,
                style: Styles.textStyle600.copyWith(
                  fontSize: 15.w,
                  color: theme.hintColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
