import 'package:ibond_application/features/requests/presentation/pages/views/requests_view.dart';

import '../manager/layout_cubit.dart';
import 'package:flutter/material.dart';
import '../../chat/pages/views/chats_view.dart';
import '../../explore/presentation/pages/views/explore_view.dart';

class LayoutBody extends StatelessWidget {
  const LayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);

    return PageView(
      controller: cubit.pageController,
      onPageChanged: cubit.onPageChanged,
      physics: const BouncingScrollPhysics(),
      children: const [
        ChatsView(),
        Center(child: Text("Status")),
        ExploreView(),
        RequestsView(),
      ],
    );
  }
}
