import '../widgets/layout_body.dart';
import '../manager/layout_cubit.dart';
<<<<<<< HEAD
import '../../../generated/l10n.dart';
=======
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
import 'package:flutter/material.dart';
import '../manager/layout_states.dart';
import '../../../core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: Scaffold(
        body: const LayoutBody(),
        bottomNavigationBar: const _Bottom(),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom();

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    var s = S.of(context);
=======
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);

        return BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: cubit.changeLayoutScreen,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          selectedLabelStyle: Styles.textStyle600,
          unselectedLabelStyle: Styles.textStyle400,
          selectedItemColor: Theme.of(context).primaryColor,
          items: [
            buildBottomNavigationBarItem(Icons.chat_bubble_outline, 'Chat'),
            buildBottomNavigationBarItem(Icons.circle_outlined, 'Status'),
<<<<<<< HEAD
            buildBottomNavigationBarItem(Icons.search, s.explore),
            buildBottomNavigationBarItem(Icons.move_to_inbox, s.requests),
=======
            buildBottomNavigationBarItem(Icons.person_add_alt, 'Friends'),
            buildBottomNavigationBarItem(Icons.move_to_inbox, 'Requests'),
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
          ],
        );
      },
    );
  }
}

BottomNavigationBarItem buildBottomNavigationBarItem(
  IconData icon,
  String label,
) {
  return BottomNavigationBarItem(
    icon: Icon(icon, size: 30.sp),
    label: label,
  );
}
