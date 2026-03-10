import 'custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Empty extends StatelessWidget {
  final bool isSearching;
  final String imagePath;
  final String message;
  final String searchMessage;

  const Empty({
    super.key,
    required this.isSearching,
    required this.imagePath,
    required this.message,
    required this.searchMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 2),
        SizedBox(width: double.infinity),
        Image.asset(
          isSearching ? 'assets/images/empty_search.png' : imagePath,
          width: MediaQuery.of(context).size.width * 0.6,
          fit: BoxFit.contain,
        ),
        CustomText(
          text: isSearching ? searchMessage : message,
          size: 20.sp,
          type: Type.overMedium,
        ),
        Spacer(flex: 3),
      ],
    );
  }
}
