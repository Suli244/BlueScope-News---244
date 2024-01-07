import 'package:bluescope_news_244/logic/get_home_model.dart';
import 'package:bluescope_news_244/screen/page/home_detail_screen.dart';
import 'package:bluescope_news_244/style/app_colors.dart';
import 'package:bluescope_news_244/style/app_text_styles.dart';
import 'package:bluescope_news_244/utils/image/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({
    super.key,
    required this.model,
    required this.type,
    required this.index,
  });
  final GetNewsModel model;
  final String type;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeDetailScreen(
              model: model,
              type: type,
              index: index,
            ),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: model.image,
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
                  image: DecorationImage(
                    image: NetworkImage(
                      model.image,
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
                  model.title,
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
                        model.time,
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
                        '${model.view} views',
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
