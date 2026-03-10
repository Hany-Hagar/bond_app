<<<<<<< HEAD
import 'requests.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
=======
import 'package:flutter/material.dart';
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
import '../../manager/requests_cubit.dart';
import '../../manager/requests_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
<<<<<<< HEAD
=======
import 'requests.dart';
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f

class RequestsBody extends StatelessWidget {
  const RequestsBody({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    var s = S.of(context);
=======
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
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
<<<<<<< HEAD
            hintText: s.requestsSearchHint,
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
          text: s.requestsTitle,
          size: 22.sp,
          type: Type.overMedium,
=======
          text: "Explore Requests",
          size: 22.sp,
          type: Type.medium,
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
          opacity: FontOpacity.overMedium,
        ),
        SizedBox(height: 20.h),
        Expanded(child: Requests()),
<<<<<<< HEAD
        SizedBox(height: 20.h),
=======
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
      ],
    );
  }
}
