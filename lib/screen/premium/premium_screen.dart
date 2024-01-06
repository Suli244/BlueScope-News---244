import 'package:bluescope_news_244/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:bluescope_news_244/style/app_colors.dart';
import 'package:bluescope_news_244/style/app_text_styles.dart';
import 'package:bluescope_news_244/utils/image/app_images.dart';
import 'package:bluescope_news_244/utils/premium/first_open.dart';
import 'package:bluescope_news_244/utils/premium/premium.dart';
import 'package:bluescope_news_244/widgets/custom_button.dart';
import 'package:bluescope_news_244/widgets/restore_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key, this.isClose = false});

  final bool isClose;

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool toLoad = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 5.h),
            Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: () async {
                    if (widget.isClose) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavigatorScreen(),
                        ),
                        (protected) => false,
                      );
                    }
                  },
                  child: Image.asset(
                    AppImages.xIcon,
                    width: 44,
                    height: 44,
                    color: AppColorsBlueScopeNews.colorDD3737,
                  ),
                ),
                const SizedBox(width: 14),
              ],
            ),
            Image.asset(
              AppImages.premiumImage,
              width: double.infinity,
              height: 352.h,
            ),
            SizedBox(height: 32.h),
            Text(
              '• Ability to add your own news',
              style: AppTextStylesBlueScopeNews.s19W900(
                color: AppColorsBlueScopeNews.color191B1B,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              '• Unlimited number of news saves',
              style: AppTextStylesBlueScopeNews.s19W900(
                color: AppColorsBlueScopeNews.color191B1B,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              '• NO ADS',
              style: AppTextStylesBlueScopeNews.s19W900(
                color: AppColorsBlueScopeNews.color191B1B,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  CustomButtonBlueScopeNews(
                    isLoading: toLoad,
                    color: AppColorsBlueScopeNews.colorDD3737,
                    onPress: () async {
                      await PremiumWebBlueScopeNews.setPremium();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BottomNavigatorScreen(),
                        ),
                        (route) => false,
                      );

                      // setState(() {
                      //   toLoad = true;
                      // });
                      // final apphudPaywalls = await Apphud.paywalls();
                      // await Apphud.purchase(
                      //   product: apphudPaywalls?.paywalls.first.products?.first,
                      // ).whenComplete(
                      //   () async {
                      //     if (await Apphud.hasPremiumAccess() ||
                      //         await Apphud.hasActiveSubscription()) {
                      //       await PremiumContactPlink
                      //           .buyTradeFuncRestoreContactPlink(context);
                      //       Navigator.pushAndRemoveUntil(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (_) => const BottomNavigatorScreen(),
                      //         ),
                      //         (route) => false,
                      //       );
                      //     }
                      //   },
                      // );
                      // setState(() {
                      //   toLoad = false;
                      // });
                    },
                    text: 'PREMIUM FOR \$1,99',
                    textStyle: AppTextStylesBlueScopeNews.s17W600(
                        color: AppColorsBlueScopeNews.colorD9E6F0),
                    height: 61,
                    radius: 8,
                  ),
                  SizedBox(height: 20.h),
                  const RestoreButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
