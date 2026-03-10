import '../widgets/m_button.dart';
import '../../generated/l10n.dart';
import '../widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogServices {
  static Future<void> showCustomDialog({
    required BuildContext context,
    required Widget dialog,
  }) async {
    await showDialog(context: context, builder: (context) => dialog);
    // Implement your dialog logic here
  }

  static Future<void> showLogoutDialog({
    required BuildContext context,
    required bool isLoading,
    required Function() onConfirm,
  }) async {
    await showDialog(
      context: context,
      builder: (context) => _DialogBody(
        isLoading: false,
        icon: Icons.warning,
        title: S.current.logoutDialogTitle,
        description: S.current.logoutDialogContent,
        confirmText: S.current.logout,
        onConfirm: onConfirm,
      ),
    );
  }

  static Future<void> showDeleteDialog({
    required BuildContext context,
    required bool isLoading,
    required Function() onConfirm,
  }) async {
    await showDialog(
      context: context,
      builder: (context) => _DialogBody(
        isLoading: false,
        icon: Icons.warning,
        title: S.current.deleteAccountDialogTitle,
        description: S.current.deleteAccountDialogContent,
        confirmText: S.current.deleteDialogConfirm,
        onConfirm: onConfirm,
      ),
    );
  }
}

class _DialogBody extends StatelessWidget {
  final bool isLoading;
  final IconData icon;
  final String title;
  final String description;
  final String confirmText;
  final Function() onConfirm;
  const _DialogBody({
    required this.isLoading,
    required this.icon,
    required this.title,
    required this.description,
    required this.confirmText,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    var color = Colors.redAccent;
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 28,
              child: Icon(
                Icons.warning,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            SizedBox(height: 20.h),
            CustomText(text: title, size: 24.sp, type: Type.overMedium),
            SizedBox(height: 8.h),
            CustomText(
              text: description,
              size: 18.sp,
              maxLines: 5,
              type: Type.medium,
              textAlign: TextAlign.center,
              opacity: FontOpacity.overMedium,
            ),
            SizedBox(height: 30.h),
            Row(
              spacing: 15.w,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (isLoading)
                  CircularProgressIndicator(color: color)
                else
                  Expanded(
                    child: MButton(
                      onPressed: onConfirm,
                      text: confirmText,
                      color: color,
                    ),
                  ),
                Expanded(
                  child: MButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: S.current.cancel,
                    color: color,
                    enableBorderColor: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
