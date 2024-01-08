import 'package:bluescope_news_244/core/hive/saved_hive.dart';
import 'package:bluescope_news_244/logic/get_home_model.dart';
import 'package:bluescope_news_244/logic/models/saved_model/saved_model.dart';
import 'package:bluescope_news_244/screen/premium/premium_screen.dart';
import 'package:bluescope_news_244/style/app_colors.dart';
import 'package:bluescope_news_244/style/app_text_styles.dart';
import 'package:bluescope_news_244/utils/image/app_images.dart';
import 'package:bluescope_news_244/utils/premium/premium.dart';
import 'package:bluescope_news_244/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeDetailScreen extends StatefulWidget {
  const HomeDetailScreen({
    super.key,
    required this.model,
    required this.type,
    required this.index,
  });
  final GetNewsModel model;
  final String type;
  final int index;

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  bool isFavorite = false;
  bool isPremium = false;
  List<dynamic> values = [];

  @override
  void initState() {
    super.initState();
    initIsFavorite();
    getList();
  }

  initIsFavorite() async {
    isFavorite = await SavedHive.hasData(group: widget.type, id: widget.index);
    isPremium = await PremiumWebBlueScopeNews.getPremium();

    setState(() {});
  }

  getList() async {
    values.clear();
    final box = await Hive.openBox<Map<dynamic, dynamic>>('saved');
    Map<dynamic, dynamic>? savedList = box.get('saved');
    savedList?.forEach((key, value) {
      if (value.isNotEmpty) {
        values.addAll(value);
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Container(
                width: context.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.sp),
                    topRight: Radius.circular(32.sp),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 16.h),
                      Container(
                        width: 80.h,
                        height: 4.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: AppColorsBlueScopeNews.colorD9E6F0,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: AppColorsBlueScopeNews.colorD9E6F0,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImages.clockIcon,
                                  height: 15.h,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  widget.model.time,
                                  style: AppTextStylesBlueScopeNews.s12W500(),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: AppColorsBlueScopeNews.colorD9E6F0,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImages.eyeIcon,
                                  height: 15.h,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  widget.model.view.toString(),
                                  style: AppTextStylesBlueScopeNews.s12W500(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
            ),
            automaticallyImplyLeading: false,
            title: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.all(15.h),
                child: GestureDetector(
                  onTap: () async {
                    await getList();
                    if (isFavorite) {
                      SavedHive.deleteData(
                          id: widget.index, group: widget.type);
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    } else {
                      if (!isPremium && values.length == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PremiumScreen(
                              isClose: true,
                            ),
                          ),
                        );
                      } else {
                        SavedHive.dataToCache(
                          group: widget.type,
                          data: SavedModel(
                            id: widget.index,
                            time: widget.model.time,
                            desciption: widget.model.desription,
                            title: widget.model.title,
                            view: widget.model.view,
                            images: widget.model.image,
                          ),
                        );
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      }
                    }
                  },
                  child: isFavorite
                      ? Image.asset(
                          AppImages.heartActivIcon,
                          height: 24.h,
                          color: AppColorsBlueScopeNews.colorDD3737,
                        )
                      : Image.asset(
                          AppImages.heartIcon,
                          height: 24.h,
                          color: Colors.white,
                        ),
                ),
              ),
              const SizedBox(width: 20),
            ],
            backgroundColor: Colors.white,
            expandedHeight: context.height / 2.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image.network(
                    widget.model.image,
                    width: double.infinity,
                    height: context.height / 2.h + 20,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    height: context.height / 2.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.8),
                          Colors.black,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16.w,
                    right: 16.w,
                    bottom: 100.h,
                    child: Text(
                      widget.model.title,
                      style: AppTextStylesBlueScopeNews.s28W700(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
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
                    widget.model.desription,
                    style: AppTextStylesBlueScopeNews.s14W400(
                      color: AppColorsBlueScopeNews.color64717B,
                    ),
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
