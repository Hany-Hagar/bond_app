import '../pages/help_view.dart';
import '../pages/policy_view.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/styles.dart';
import '../pages/app_settings_view.dart';
import '../../../../../../generated/l10n.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../core/widgets/m_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/services/dialog_services.dart';
import '../../../../../../core/utils/navigator_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/features/auth/manager/auth_cubit.dart';
import '../../../profile/presentation/pages/views/profile_view.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      spacing: 20.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: s.generalSettings,
          size: 18.sp,
          type: Type.overMedium,
          opacity: FontOpacity.overMedium,
        ),
        _Item(
          icon: Icons.person_outline,
          title: s.personalInfo,
          nextPage: ProfileView(),
        ),
        _Item(
          icon: Icons.settings_outlined,
          title: s.appSettings,
          nextPage: AppSettingsView(),
        ),
        SizedBox(height: 5),
        CustomText(
          text: s.otherSettings,
          size: 18.sp,
          type: Type.overMedium,
          opacity: FontOpacity.overMedium,
        ),
        _Item(
          icon: Icons.privacy_tip_outlined,
          title: s.helpAndSupport,
          nextPage: HelpView(),
        ),
        _Item(
          icon: Icons.privacy_tip_outlined,
          title: s.termsAndPolicies,
          nextPage: PolicyView(),
        ),
        _Item(
          icon: Icons.share_outlined,
          title: s.inviteFriends,
          onTap: () async {
            await SharePlus.instance.share(
              ShareParams(
                text: "https://ibond.ai/",
                subject: "Download this app",
              ),
            );
          },
        ),
        SizedBox(height: 5.h),
        _Buttons(),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onTap;
  final Widget? nextPage;
  const _Item({
    required this.icon,
    required this.title,
    this.onTap,
    this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () =>
          onTap?.call() ?? NavTo.push(context: context, nextPage: nextPage!),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).dividerColor, width: 0.5),
        borderRadius: BorderRadius.circular(10.r),
      ),
      leading: Icon(icon, color: Theme.of(context).hintColor),
      title: CustomText(
        text: title,
        size: 17.sp,
        type: Type.overMedium,
        //opacity: FontOpacity.middle,
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var authCubit = AuthCubit.get(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15.h,
        children: [
          MButton(
            icon: Icons.logout,
            text: s.logout,
            color: Styles.red,
            enableBorderColor: true,
            onPressed: () {
              DialogServices.showLogoutDialog(
                context: context,
                isLoading: false,
                onConfirm: () => authCubit.logout(),
              );
            },
          ),
          MButton(
            icon: Icons.delete_outline,
            text: s.deleteAccount,
            color: Styles.red,
            enableBorderColor: true,
            onPressed: () {
              DialogServices.showDeleteDialog(
                context: context,
                isLoading: false,
                onConfirm: () => authCubit.deleteAccount(),
              );
            },
          ),
        ],
      ),
    );
  }
}
