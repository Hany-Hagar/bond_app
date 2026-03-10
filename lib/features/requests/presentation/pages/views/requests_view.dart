
import 'package:flutter/material.dart';
import '../widgets/requests_body.dart';
import '../../manager/requests_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/requests_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../layout/widgets/layout_top.dart';
import '../../../../../core/di/server_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_background.dart';
import '../../../../../core/services/snack_bar_service.dart';
import '../../../../../core/features/friends/manager/friends_cubit.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
    
      value: getIt<RequestsCubit>()..fetchRequests(),
      child: RefreshIndicator(
        
        onRefresh: () async {
          await getIt<RequestsCubit>().refreshFetchRequests();
        },
        child: BlocListener<RequestsCubit, RequestsStates>(
          listener: (context, state) {
            var s = S.of(context);
            if (state is RequestsFailureState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }

            if (state is AcceptRequestSuccessState) {
              SnackBarService.success(
                context: context,
                message: s.friendRequestAccepted,
              );
              getIt<FriendsCubit>().refreshfetchFriends();
            }

            if (state is DeclineRequestSuccessState) {
              SnackBarService.success(
                context: context,
                message: s.friendRequestDeclined,
              );
            }
          },
          child: BackGround(
            top: LayoutTop(),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const RequestsBody(),
            ),
          ),
        ),
      ),
    );
  }
}
