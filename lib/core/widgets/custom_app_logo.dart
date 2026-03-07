// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppLogo extends StatelessWidget {
  final Color? color;
  final double? height;
  const CustomAppLogo({super.key, this.color, this.height});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/images/logo.svg",
      height: (height ?? 30).h,
      color: color ?? Theme.of(context).primaryColor,
    );
  }
}
