<<<<<<< HEAD

import 'package:flutter/material.dart';
import '../widgets/requests_body.dart';
import '../../manager/requests_cubit.dart';
import '../../../../../generated/l10n.dart';
=======
import '../widgets/requests_body.dart';
import 'package:flutter/material.dart';
import '../../manager/requests_cubit.dart';
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
import '../../manager/requests_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../layout/widgets/layout_top.dart';
import '../../../../../core/di/server_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_background.dart';
<<<<<<< HEAD
import '../../../../../core/services/snack_bar_service.dart';
=======
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
import '../../../../../core/features/friends/manager/friends_cubit.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
<<<<<<< HEAD
    
      value: getIt<RequestsCubit>()..fetchRequests(),
      child: RefreshIndicator(
        
=======
      value: getIt<RequestsCubit>()..fetchRequests(),
      child: RefreshIndicator(
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
        onRefresh: () async {
          await getIt<RequestsCubit>().refreshFetchRequests();
        },
        child: BlocListener<RequestsCubit, RequestsStates>(
          listener: (context, state) {
<<<<<<< HEAD
            var s = S.of(context);
=======
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
            if (state is RequestsFailureState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }

            if (state is AcceptRequestSuccessState) {
<<<<<<< HEAD
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
=======
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Friend Request Accepted")),
              );
              getIt<RequestsCubit>().refreshFetchRequests();
              getIt<FriendsCubit>().refreshfetchFriends();
            }
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
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
