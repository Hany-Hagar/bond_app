
import 'explore_friends.dart';
import 'package:flutter/material.dart';
import '../../manager/explores_cubit.dart';
import '../../manager/explores_states.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class ExploreBody extends StatelessWidget {
  const ExploreBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
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
            hintText: s.exploreSearchHint,
            controller: cubit.searchController,
            onChanged: (value) => cubit.changeSearch(value: value ?? ""),
          ),
        ),
        SizedBox(height: 20.h),
        CustomText(
          text: s.exploreTitle,
          size: 22.sp,
          type: Type.overMedium,
          opacity: FontOpacity.overMedium,
        ),
        SizedBox(height: 20.h),
        Expanded(child: ExploreFriends()),
        SizedBox(height: 20.h),
      ],
    );
  }
}