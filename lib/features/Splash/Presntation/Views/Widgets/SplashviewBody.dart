import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/Splash/Presntation/Views/Widgets/slidingtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashviewBody extends StatefulWidget {
  const SplashviewBody({super.key});

  @override
  State<SplashviewBody> createState() => _SplashviewBodyState();
}

class _SplashviewBodyState extends State<SplashviewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    initslidinganimation();
    NavigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 20,
        ),
        SlidingText(slideAnimation: slideAnimation),
      ],
    );
  }

  void NavigateToHome() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        // Get.to(() => const HomeView(),
        //     transition: Transition.fadeIn, duration: kTranstionDuration);
        GoRouter.of(context).push('/homeView');
      },
    );
  }

  void initslidinganimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 4),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }
}
