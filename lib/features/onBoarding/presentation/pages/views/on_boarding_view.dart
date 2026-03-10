// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:flutter/material.dart';
import '../widgets/on_boarding_body.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/model/on_boarding.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../login/pages/views/login_view.dart';
import '../../../../../core/utils/navigator_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/features/settings/manager/settings_cubit.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentPage = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: 3,
                controller: pageController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) => SafeArea(
                  child: OnBoardingBody(
                    onBoarding: onBoardingData(context: context)[index],
                  ),
                ),
              ),
            ),

            /// Indicator
            _Indicator(pageController: pageController),
            SizedBox(height: 20.h),
            _Image(
              currentPage: currentPage,
              onTap: () {
                if (currentPage < 2) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                } else {
                  getIt<SettingsCubit>().setFirstTime();
                  NavTo.pushReplacement(
                    context: context,
                    nextPage: LoginView(),
                  );
                }
              },
            ),
            SizedBox(height: 20.h),

            _Skip(currentPage: currentPage, pageController: pageController),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  final PageController pageController;
  const _Indicator({required this.pageController});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      effect: WormEffect(
        dotHeight: 6.h,
        dotWidth: 31.w,
        radius: 50.r,
        spacing: 6.w,
        activeDotColor: theme.primaryColor,
        dotColor: theme.primaryColor.withOpacity(0.5),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final int currentPage;
  final VoidCallback onTap;
  const _Image({required this.currentPage, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        currentPage < 2
            ? "assets/images/on_boarding_next_button.png"
            : "assets/images/on_boarding_done_button.png",
        height: 88.h,
      ),
    );
  }
}

class _Skip extends StatelessWidget {
  final int currentPage;
  final PageController pageController;
  const _Skip({required this.currentPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: currentPage < 2 ? Offset.zero : const Offset(0, 0.3),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: AnimatedOpacity(
        opacity: currentPage < 2 ? 1 : 0,
        duration: const Duration(milliseconds: 300),
        child: currentPage < 2
            ? TextButton(
                onPressed: () {
                  pageController.jumpToPage(2);
                },
                child: CustomText(
                  text: S.of(context).skip,
                  size: 20.sp,
                  type: Type.overSmall,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
