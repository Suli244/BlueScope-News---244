import 'package:bluescope_news_244/screen/premium/premium_screen.dart';
import 'package:bluescope_news_244/style/app_colors.dart';
import 'package:bluescope_news_244/style/app_text_styles.dart';
import 'package:bluescope_news_244/utils/image/app_images.dart';
import 'package:bluescope_news_244/utils/premium/first_open.dart';
import 'package:bluescope_news_244/widgets/custom_button.dart';
import 'package:bluescope_news_244/widgets/onboarding_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currantPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const ClampingScrollPhysics(),
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  currantPage = value;
                });
              },
              children: const [
                OnboardingItemWidget(
                  image: AppImages.onboardingOne,
                  title: 'Welcome to\nBlueScope\nNews',
                  titleTwo: 'Stay Updated',
                  titleTrhee:
                      'Welcome to BlueScope News, your go-to source for\nthe latest news. Discover a world of information at\nyour fingertips, from breaking news to in-depth\nanalysis on topics that matter to you.',
                ),
                OnboardingItemWidget(
                  image: AppImages.onboardingTwo,
                  title: 'Customize\nYour\nExperience',
                  titleTwo: 'News Tailored for You',
                  titleTrhee:
                      'Filter news by categories and tags that interest you.\nSave your favorite articles for later, and even add\nyour own news to share with the community. Your\nnewsfeed, your way.',
                ),
                OnboardingItemWidget(
                  image: AppImages.onboardingTrhee,
                  title: 'Join Our\nCommunity',
                  titleTwo: 'Be Part of the Story',
                  titleTrhee:
                      'Create your profile to personalize your experience.\nEngage with the news that shapes our world and\nbecome a part of a community that values informed\ndiscussions and diverse perspectives.',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const ScrollingDotsEffect(
                    activeDotColor: AppColorsBlueScopeNews.color2D52D6,
                    dotColor: AppColorsBlueScopeNews.colorD9E6F0,
                    dotHeight: 6,
                    dotWidth: 6,
                  ),
                ),
                SizedBox(height: 32.h),
                CustomButtonBlueScopeNews(
                  height: 58.h,
                  color: AppColorsBlueScopeNews.color2D52D6,
                  onPress: () async {
                    if (currantPage == 2) {
                      await FirstOpenBlueScopeNews.setFirstOpen();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PremiumScreen(),
                        ),
                        (route) => false,
                      );
                    } else {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                  text: currantPage == 2 ? 'Start now' : 'Continue',
                  textStyle:
                      AppTextStylesBlueScopeNews.s19W900(color: Colors.white),
                  radius: 50,
                ),
                SizedBox(height: 36.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
