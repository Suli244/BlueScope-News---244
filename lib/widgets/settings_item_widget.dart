import 'package:bluescope_news_244/style/app_colors.dart';
import 'package:bluescope_news_244/style/app_text_styles.dart';
import 'package:bluescope_news_244/utils/image/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsItemWidget extends StatelessWidget {
  const SettingsItemWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.top,
    this.bottom,
  });
  final String title;
  final Function() onTap;
  final double? top;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: top ?? 0,
        bottom: bottom ?? 0,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 64.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColorsBlueScopeNews.colorD8E6EF,
              width: 1.30,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Row(
              children: [
                Text(
                  title,
                  style: AppTextStylesBlueScopeNews.s15W400(
                      color: AppColorsBlueScopeNews.color191B1B),
                ),
                const Spacer(),
                Image.asset(
                  AppImages.arrowRightIcon,
                  width: 27.h,
                  height: 27.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
