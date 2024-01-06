import 'package:bluescope_news_244/style/app_text_styles.dart';
import 'package:bluescope_news_244/widgets/home_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDetailScreen extends StatelessWidget {
  const HomeDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.sp),
                    topRight: Radius.circular(32.sp),
                  ),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'news.name',
                        style: AppTextStylesBlueScopeNews.s17W600(),
                      ),
                      Row(
                        children: [
                          Text(
                            'news.min',
                            style: AppTextStylesBlueScopeNews.s17W600(),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'news.date',
                            style: AppTextStylesBlueScopeNews.s17W600(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            automaticallyImplyLeading: false,
            title: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 30.sp,
                  color: Colors.white,
                ),
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            expandedHeight: 420,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                url,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'news.description',
                    style: AppTextStylesBlueScopeNews.s17W600(),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
