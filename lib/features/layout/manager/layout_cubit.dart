// ignore_for_file: strict_top_level_inference

import 'layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);

  /// =========================
  /// 🔹 Bottom Navigation
  /// =========================

  int currentIndex = 0;
  final PageController pageController = PageController();

  void changeLayoutScreen(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    emit(ChangeLayoutScreen());
  }

  void onPageChanged(int index) {
    currentIndex = index;
    emit(ChangeLayoutScreen());
  }

  /// =========================
  /// 🔹 Chat Internal Tabs
  /// =========================

  int chatIndex = 0;
  final PageController chatController = PageController();

  void changeChatTab(int index) {
    chatIndex = index;

    chatController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    emit(ChangeLayoutScreen());
  }

  void onChatPageChanged(int index) {
    chatIndex = index;
    emit(ChangeLayoutScreen());
  }

  /// =========================
  /// 🔹 Dispose
  /// =========================

  @override
  Future<void> close() {
    pageController.dispose();
    chatController.dispose();
    return super.close();
  }
}
