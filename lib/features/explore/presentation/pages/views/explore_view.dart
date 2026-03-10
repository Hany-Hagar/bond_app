<<<<<<< HEAD

=======
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
import '../widgets/explore_body.dart';
import 'package:flutter/material.dart';
import '../../manager/explores_cubit.dart';
import '../../manager/explores_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../layout/widgets/layout_top.dart';
import '../../../../../core/di/server_locator.dart';
<<<<<<< HEAD
import '../../../../../core/services/snack_bar_service.dart';
=======
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
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
<<<<<<< HEAD
          await getIt<ExploresCubit>().refreshFetchExploreUsers();
        },
        child: BlocListener<ExploresCubit, ExploresStates>(
          listener: (context, state) async {
            if (state is ExploreFailureState) {
              SnackBarService.failure(
                context: context,
                message: state.message,
              );
            }

            if(state is SendFriendRequestSuccessState){
              SnackBarService.success(
                context: context,
                message: "A friend request has been sent",
              );
            }
             if(state is CancelFriendRequestSuccessState){
              SnackBarService.success(
                context: context,
                message: "Cancelled friend request successfully",
              );
            }
             if(state is AcceptFriendRequestSuccessState){
              SnackBarService.success(
                context: context,
                message: "Accepted friend request successfully",
=======
          await getIt<ExploresCubit>().fetchExploreUsers();
        },
        child: BlocListener<ExploresCubit, ExploresStates>(
          listener: (context, state) {
            if (state is SendFriendRequestSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Friend request sent successfully!")),
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
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
