import '../widgets/explore_body.dart';
import 'package:flutter/material.dart';
import '../../manager/explores_cubit.dart';
import '../../manager/explores_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../layout/widgets/layout_top.dart';
import '../../../../../core/di/server_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_background.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ExploresCubit>()..fetchExploreUsers(),
      child: RefreshIndicator(
        onRefresh: () async {
          await getIt<ExploresCubit>().fetchExploreUsers();
        },
        child: BlocListener<ExploresCubit, ExploresStates>(
          listener: (context, state) {
            if (state is SendFriendRequestSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Friend request sent successfully!")),
              );
            }
          },
          child: BackGround(
            top: LayoutTop(),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ExploreBody(),
            ),
          ),
        ),
      ),
    );
  }
}
