<<<<<<< HEAD

import 'explore_friends.dart';
import 'package:flutter/material.dart';
import '../../manager/explores_cubit.dart';
import '../../manager/explores_states.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
=======
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/explores_cubit.dart';
import '../../manager/explores_states.dart';
import 'explore_friends.dart';
import 'package:flutter/material.dart';
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class ExploreBody extends StatelessWidget {
  const ExploreBody({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    var s = S.of(context);
=======
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
    var cubit = ExploresCubit.get(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        BlocBuilder<ExploresCubit, ExploresStates>(
          builder: (context, state) => MTextFormField(
            prefixIcon: Icons.search,
            suffixIcon: cubit.isSearching ? Icons.close : null,
            suffixTap: cubit.clearSearch,
<<<<<<< HEAD
            hintText: s.exploreSearchHint,
=======
            hintText: 'Search for friends',
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
            controller: cubit.searchController,
            onChanged: (value) => cubit.changeSearch(value: value ?? ""),
          ),
        ),
        SizedBox(height: 20.h),
        CustomText(
<<<<<<< HEAD
          text: s.exploreTitle,
          size: 22.sp,
          type: Type.overMedium,
=======
          text: "Explore Friends",
          size: 22.sp,
          type: Type.medium,
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
          opacity: FontOpacity.overMedium,
        ),
        SizedBox(height: 20.h),
        Expanded(child: ExploreFriends()),
<<<<<<< HEAD
        SizedBox(height: 20.h),
=======
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
      ],
    );
  }
}
