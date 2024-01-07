import 'package:bluescope_news_244/logic/models/saved_model/saved_model.dart';
import 'package:bluescope_news_244/style/app_colors.dart';
import 'package:bluescope_news_244/style/app_text_styles.dart';
import 'package:bluescope_news_244/utils/image/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedDetailPage extends StatelessWidget {
  const SavedDetailPage({required this.data, required this.group, super.key});
  final List<dynamic> data;
  final String group;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            expandedHeight: 415.h,
            // leading: IconButton(
            //   // iconSize: ,
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            //   icon: Container(
            //     margin: const EdgeInsets.only(
            //         // left: 20,
            //         ),
            //     height: 30,
            //     width: 30,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //     child: const Center(
            //       child: Icon(
            //         Icons.arrow_back_ios_new,
            //         color: AppColorsBlueScopeNews.color161621,
            //       ),
            //     ),
            //   ),
            // ),
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/saved_detail.png',
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 44,
                    left: 18,
                    right: 0,
                    child: Text(
                      group,
                      style: AppTextStylesBlueScopeNews.s46W700(
                          color: Colors.white),
                    )),
                Positioned(
                  bottom: -7,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 30.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                  ),
                )
              ],
            ),
            // FlexibleSpaceBar(
            //   background: Image.network(
            //     data.image!,
            //     width: double.maxFinite,
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
          SliverToBoxAdapter(
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 125.h,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    group,
                                    style: AppTextStylesBlueScopeNews.s12W500(
                                      color: AppColorsBlueScopeNews.color64717B,
                                    ),
                                  ),
                                  Text(
                                    data[index].title,
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
                                        color:
                                            AppColorsBlueScopeNews.color64717B,
                                      ),
                                      const SizedBox(width: 3),
                                      Expanded(
                                        child: Text(
                                          data[index].time,
                                          style: AppTextStylesBlueScopeNews
                                              .s12W500(
                                            color: AppColorsBlueScopeNews
                                                .color64717B,
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        AppImages.eyeIcon,
                                        height: 16.h,
                                        color:
                                            AppColorsBlueScopeNews.color64717B,
                                      ),
                                      const SizedBox(width: 3),
                                      Expanded(
                                        child: Text(
                                          '${data[index].view} views',
                                          style: AppTextStylesBlueScopeNews
                                              .s12W500(
                                            color: AppColorsBlueScopeNews
                                                .color64717B,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            height: 125.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Image.network(data[index].images),
                          )
                        ],
                      ),
                      separatorBuilder: (context, index) => Column(
                        children: [
                          const SizedBox(height: 16),
                          Divider(
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                      itemCount: data.length,
                    ),
                    SizedBox(
                      height: 16.h,
                    )
                  ],
                )
                // SingleChildScrollView(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         '${data.name} (${data.country})',
                //         style: AppTextStylesBetCalculator.s24W600(),
                //       ),
                //       const SizedBox(height: 5),
                //       Text(
                //         data.type!,
                //         style: AppTextStylesBetCalculator.s20W500(),
                //       ),
                //       const SizedBox(height: 15),
                //       Text(
                //         '${data.description!} ${data.description!} ${data.description!}',
                //         style: AppTextStylesBetCalculator.s16W400(height: 2),
                //       ),
                //       const SizedBox(height: 24)
                //     ],
                //   ),
                // ),
                ),
          ),
        ],
      ),
    );
  }
}
