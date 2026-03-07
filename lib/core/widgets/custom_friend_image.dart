import 'image_viewer.dart';
import 'package:flutter/material.dart';
import '../utils/navigator_methods.dart';
import '../../const_data/api_const_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomFriendImage extends StatelessWidget {
  final double? radius;
  final Function()? onTap;
  final String profileImage;
  const CustomFriendImage({
    super.key,
    required this.profileImage,
    this.radius,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavTo.push(
          context: context,
          nextPage: ImageViewer(isUserImage: false, imageUrl: profileImage),
        );
      },
      child: CircleAvatar(
        radius: radius ?? 32.r,
        backgroundColor: Colors.grey[300],
        backgroundImage: profileImage.isNotEmpty
            ? CachedNetworkImageProvider("$profileImageBaseUrl$profileImage")
            : AssetImage('assets/images/default_user_image.png'),
      ),
    );
  }
}
