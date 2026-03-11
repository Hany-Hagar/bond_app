import 'requests.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/requests_cubit.dart';
import '../../manager/requests_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class RequestsBody extends StatelessWidget {
  const RequestsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
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
            hintText: s.requestsSearchHint,
            controller: cubit.searchController,
            onChanged: (value) => cubit.changeSearch(value: value ?? ""),
          ),
        ),
        SizedBox(height: 20.h),
        CustomText(
          text: s.requestsTitle,
          size: 22.sp,
          type: Type.overMedium,
          opacity: FontOpacity.overMedium,
        ),
        SizedBox(height: 20.h),
        Expanded(child: Requests()),
        SizedBox(height: 20.h),
      ],
    );
  }
}