import '../../../../core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessLoginDialog extends StatelessWidget {
  final Widget? child;
  final String? message;
  const SuccessLoginDialog({super.key, this.message, this.child});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        child: Column(
          spacing: 10.h,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.check, color: Colors.white, size: 40),
            ),
            child ??
                CustomText(
                  text: message ?? '',
                  size: 16,
                  type: Type.medium,
                  maxLines: 5,
                ),
          ],
        ),
      ),
    );
  }
}
