import 'package:bluescope_news_244/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:bluescope_news_244/screen/onboarding/onboarding_screen.dart';
import 'package:bluescope_news_244/utils/image/app_images.dart';
import 'package:bluescope_news_244/utils/premium/first_open.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    toGoOnBoarBlueScope();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.splashLogo,
              width: 223.w,
              height: 171.h,
            ),
          ),
        ],
      ),
    );
  }

  toGoOnBoarBlueScope() async {
    await Future.delayed(const Duration(milliseconds: 1450));
    final isFirst = await FirstOpenBlueScopeNews.getFirstOpen();
    if (!isFirst) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavigatorScreen(),
        ),
      );
    }
  }
}
