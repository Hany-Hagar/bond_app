import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../widgets/complete_info_body.dart';
import '../../../layout/pages/layout_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/utils/navigator_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/features/auth/manager/auth_cubit.dart';
import '../../../../core/features/auth/manager/auth_state.dart';

class CompleteInfoView extends StatelessWidget {
  const CompleteInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ImageUpdatedSuccess) {
          SnackBar(
            content: CustomText(
              text: S.of(context).imageUploadSuccess,
              size: 20.sp,
              maxLines: 5,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            backgroundColor: Colors.green,
          );
        }
        if (state is CompleteInfoSuccess) {
          AuthCubit.get(context).changeRegisterPasswordVisibility();
          NavTo.pushReplacement(context: context, nextPage: LayoutView());
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CompleteInfoBody(),
        ),
      ),
    );
  }
}
