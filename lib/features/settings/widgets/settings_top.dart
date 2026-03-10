import 'package:flutter/material.dart';
import '../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsTop extends StatelessWidget {
  final String title;
  const SettingsTop({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var top = MediaQuery.of(context).padding.top;
    return  Padding(
        padding: EdgeInsetsDirectional.only(top: top + 16.h , start: 16.w,),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 24.sp,
                color: Theme.of(context).hintColor,
              ),
            ),
            Spacer(flex: 4),
            CustomText(text: title, size: 24.sp),
            Spacer(flex: 4),
            SizedBox(width: 40.w),
          ],
        ),
    );
  }
}
