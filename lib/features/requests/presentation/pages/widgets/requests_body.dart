import 'package:flutter/material.dart';
import '../../manager/requests_cubit.dart';
import '../../manager/requests_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'requests.dart';

class RequestsBody extends StatelessWidget {
  const RequestsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = RequestsCubit.get(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        BlocBuilder<RequestsCubit, RequestsStates>(
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
          text: "Explore Requests",
          size: 22.sp,
          type: Type.medium,
          opacity: FontOpacity.overMedium,
        ),
        SizedBox(height: 20.h),
        Expanded(child: Requests()),
      ],
    );
  }
}
