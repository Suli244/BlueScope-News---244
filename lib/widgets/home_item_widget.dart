import 'package:bluescope_news_244/screen/page/home_detail_screen.dart';
import 'package:bluescope_news_244/style/app_colors.dart';
import 'package:bluescope_news_244/style/app_text_styles.dart';
import 'package:bluescope_news_244/utils/image/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

const url =
    'https://www.supersprint.com/public/img/01-504900-504930-504960-504990-505020.jpg';

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeDetailScreen(),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: url,
            placeholder: (_, url) {
              return SizedBox(
                height: 72.h,
                width: 72.w,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.4),
                  highlightColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              );
            },
            imageBuilder: (_, imageProvider) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 72.h,
                width: 72.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: NetworkImage(
                      url,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h),
                Text(
                  'What to know about Mycoplasma, the bacteria behind recent spikes',
                  style: AppTextStylesBlueScopeNews.s17W600(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Image.asset(
                      AppImages.clockIcon,
                      height: 16.h,
                      color: AppColorsBlueScopeNews.color64717B,
                    ),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        '1 hours ago',
                        style: AppTextStylesBlueScopeNews.s12W500(
                          color: AppColorsBlueScopeNews.color64717B,
                        ),
                      ),
                    ),
                    Image.asset(
                      AppImages.eyeIcon,
                      height: 16.h,
                      color: AppColorsBlueScopeNews.color64717B,
                    ),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        '1006 views',
                        style: AppTextStylesBlueScopeNews.s12W500(
                          color: AppColorsBlueScopeNews.color64717B,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
