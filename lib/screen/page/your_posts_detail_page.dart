import 'package:bluescope_news_244/screen/feature/new_posts/data/new_poster_model.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/new_post_page.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/widgets/font_sizer.dart';
import 'package:bluescope_news_244/utils/image/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourPostsDetailPage extends StatelessWidget {
  const YourPostsDetailPage(this.model, {super.key});
  final NewPosterModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(10),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.sp),
                    topRight: Radius.circular(32.sp),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFD8E6EF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(AppImages.clockIcon),
                                const SizedBox(width: 10),
                                const Flexible(
                                  child: FittedBox(
                                    child: Text(
                                      '3 hours ago',
                                      style: TextStyle(
                                        color: Color(0xFF181A1B),
                                        fontSize: 12,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 93,
                            height: 40,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFD8E6EF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(AppImages.eyeIcon),
                                const SizedBox(width: 10),
                                const Flexible(
                                  child: FittedBox(
                                    child: Text(
                                      '3892',
                                      style: TextStyle(
                                        color: Color(0xFF181A1B),
                                        fontSize: 12,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      size: 30.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewPostPage(model: model),
                      ),
                    );
                  },
                  child: Image.asset(
                    AppImages.editIcon,
                    scale: 3,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            expandedHeight: 420,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                model.images.first,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 0),
              child: Column(
                children: [
                  Text(
                    'Quantum Computing Breakthrough Promises to Change the Tech Landscape',
                    style: const TextStyle(
                      color: Color(0xFF181A1B),
                      fontSize: 19,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w900,
                    ),
                    textScaleFactor: FontSizer.textScaleFactor(context),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'In whats being hailed as a landmark achievement in the field of computer science, researchers at TechAdvance Institute have successfully developed a quantum computer capable of solving complex problems in mere seconds, a task that would take traditional computers thousands of years. This groundbreaking discovery is set to revolutionize industries across the globe, from healthcare, where it could lead to advancements in drug discovery, to cybersecurity, offering unprecedented levels of data encryption.',
                    style: TextStyle(
                      color: Color(0xFF63717B),
                      fontSize: 15,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: model.images
                        .map(
                          (image) => Container(
                            width: 171,
                            height: 171,
                            padding: const EdgeInsets.all(8),
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage(image),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
