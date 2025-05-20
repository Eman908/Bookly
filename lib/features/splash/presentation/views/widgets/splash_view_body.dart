import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> logoAnimation;
  @override
  void initState() {
    initAnimation();
    navigateTransition();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: logoAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: logoAnimation,
            child: Image.asset(AssetsData.logo),
          );
        },
      ),
    );
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    logoAnimation = Tween<Offset>(
      begin: const Offset(0, 10),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );
    animationController.forward();
  }

  void navigateTransition() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.offAll(
        () => const HomeView(),
        transition: Transition.leftToRight,
        duration: (kTransitionDuration),
      );
    });
  }
}
