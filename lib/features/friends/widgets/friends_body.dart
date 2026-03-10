import 'friends.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/features/friends/manager/friends_states.dart';
import '../../../core/features/friends/manager/friends_cubit.dart';

class FriendsBody extends StatelessWidget {
  const FriendsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cubit = FriendsCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        BlocBuilder<FriendsCubit, FriendsStates>(
          builder: (context, state) => MTextFormField(
            prefixIcon: Icons.search,
            suffixIcon: cubit.isSearching ? Icons.close : null,
            suffixTap: cubit.clearSearch,
            hintText: 'Search for friends',
            controller: cubit.searchController,
            onChanged: (value) => cubit.changeSearch(value: value ?? ""),
          ),
        ),
        SizedBox(height: 20.h),
        CustomText(
          text: s.friends,
          size: 20.sp,
          type: Type.overMedium,
          opacity: FontOpacity.overMedium,
        ),
        SizedBox(height: 10.h),
        Expanded(child: Friends()),
      ],
    );
  }
}
