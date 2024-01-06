import 'package:bluescope_news_244/style/app_colors.dart';
import 'package:bluescope_news_244/style/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingItemWidget extends StatelessWidget {
  const OnboardingItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.titleTwo,
    required this.titleTrhee,
  });

  final String image;
  final String title;
  final String titleTwo;
  final String titleTrhee;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Image.asset(
                image,
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                height: 520.h,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 44,
                right: 16,
                left: 16,
                child: FittedBox(
                  child: Text(
                    title,
                    style: AppTextStylesBlueScopeNews.s57W700(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  titleTwo,
                  style: AppTextStylesBlueScopeNews.s28W700(
                    color: AppColorsBlueScopeNews.color191B1B,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              FittedBox(
                child: Text(
                  titleTrhee,
                  style: AppTextStylesBlueScopeNews.s15W400(
                    color: AppColorsBlueScopeNews.color64717B,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
