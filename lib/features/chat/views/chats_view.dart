import '../widgets/chats_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/widgets/layout_top.dart';
import '../../../core/widgets/custom_background.dart';
import '../../../core/features/chats/presentation/manager/chats_cubit.dart';
import '../../../core/features/chats/presentation/manager/chats_states.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatsCubit, ChatsState>(
      listener: (context, state) {
        if (state is ChatsErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: BackGround(top: const LayoutTop(), body: const ChatsBody()),
    );
  }
}
