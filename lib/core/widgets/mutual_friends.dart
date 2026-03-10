<<<<<<< HEAD

import 'custom_text.dart';
import '../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../const_data/api_const_data.dart';
=======
import 'custom_text.dart';
import 'package:flutter/material.dart';
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_image_overlap/flutter_image_overlap.dart';
import '../../features/explore/data/models/mutual_friend_model.dart';

class MutualFriends extends StatelessWidget {
  final List<MutualFriendModel> mutualFriends;
  const MutualFriends({super.key, required this.mutualFriends});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (mutualFriends.isNotEmpty)
          Padding(
            padding: EdgeInsetsDirectional.only(end: 8.w),
            child: _OverlappingImage(mutualFriends: mutualFriends),
          ),
        CustomText(
<<<<<<< HEAD
          text: "${mutualFriends.length} ${S.of(context).mutualFriends}",
=======
          text: "${mutualFriends.length} mutual friends",
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
          size: 14.sp,
          type: Type.medium,
        ),
      ],
    );
  }
}

class _OverlappingImage extends StatelessWidget {
  final List<MutualFriendModel> mutualFriends;
  const _OverlappingImage({required this.mutualFriends});

  @override
  Widget build(BuildContext context) {
    final index = mutualFriends.length > 3 ? 3 : mutualFriends.length;
    return OverlappingImages(
      imageRadius: 12.r,
      images: List.generate(
        index,
        (i) => CachedNetworkImageProvider(
<<<<<<< HEAD
          "$profileImageBaseUrl${mutualFriends[i].profileImage}",
=======
          "https://back.ibond.ai/uploads/profiles/${mutualFriends[i].profileImage}",
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
        ),
      ),
    );
  }
}
