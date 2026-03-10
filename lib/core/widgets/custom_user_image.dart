import 'dart:io';
import 'image_viewer.dart';
import 'package:flutter/material.dart';
import '../utils/navigator_methods.dart';
import '../../const_data/api_const_data.dart';
import '../features/auth/manager/auth_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomUserImage extends StatelessWidget {
  final double? radius;
  final Function()? onTap;
  const CustomUserImage({super.key, this.radius, this.onTap});
  @override
  Widget build(BuildContext context) {
    var user = AuthCubit.get(context).user;
    final String? imagePath = user.profileImagePath;
    final String? imageUrl = user.profileImageUrl;
    return GestureDetector(
      onTap: () {
        NavTo.push(
          context: context,
          nextPage: ImageViewer(
            isUserImage: true,
            imagePath: imagePath,
            imageUrl: imageUrl,
          ),
        );
      },
      child: CircleAvatar(
        radius: radius ?? 55.r,
        backgroundColor: Colors.grey[300],
        backgroundImage: imagePath != null
            ? FileImage(File(imagePath))
            : (imageUrl != null
                  ? CachedNetworkImageProvider(
                      "$profileImageBaseUrl${user.profileImageUrl}",
                    )
                  : null),
        child: (imagePath == null && imageUrl == null)
            ? Image.asset(
                'assets/images/default_user_image.png',
                fit: BoxFit.cover,
              )
            : null,
      ),
    );
  }
}
