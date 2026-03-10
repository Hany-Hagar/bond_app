import '../items/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/features/chats/presentation/manager/chats_cubit.dart';
import '../../../../../core/features/chats/presentation/manager/chats_states.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Messages",
            size: 20.sp,
            type: Type.overMedium,
            opacity: FontOpacity.medium,
          ),
          SizedBox(height: 15.h),
          _Chats(),
        ],
      ),
    );
  }
}

class _Chats extends StatelessWidget {
  const _Chats();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        var cubit = ChatsCubit.get(context);
        if (state is ChatsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (cubit.chats.isEmpty) {
          return const _Empty();
        } else {
          return const _Body();
        }
      },
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.15,
        ),
        Image.asset("assets/images/empty.png", height: 200.h),
        SizedBox(height: 20.h),
        CustomText(
          text: "No messages yet",
          size: 18.sp,
          type: Type.overMedium,
          opacity: FontOpacity.medium,
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    var cubit = ChatsCubit.get(context);

    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: cubit.chats.length,
        itemBuilder: (context, index) {
          return Item(chat: cubit.chats[index]);
        },
        separatorBuilder: (context, index) => SizedBox(height: 10.h),
      ),
    );
  }
}
