import 'package:bluescope_news_244/screen/feature/new_posts/data/new_poster_model.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/new_post_page.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/widgets/cached_image_widget.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/widgets/font_sizer.dart';
import 'package:bluescope_news_244/utils/image/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

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
                                Flexible(
                                  child: FittedBox(
                                    child: Text(
                                      formatTimeAgo(model.dateTime),
                                      style: const TextStyle(
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
              expandedTitleScale: 1,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 50, right: 16, left: 16),
                child: Text(
                  truncateString(model.title, 35),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 46,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w700,
                  ),
                  textScaleFactor: FontSizer.textScaleFactor(context),
                ),
              ),
              background: model.images.isEmpty
                  ? const CachedImageWidget(
                      image: 'https://via.placeholder.com/171x171',
                      height: 70,
                      width: 60,
                    )
                  : Image.asset(
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
                    model.title,
                    style: const TextStyle(
                      color: Color(0xFF181A1B),
                      fontSize: 19,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w900,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 5,
                    textScaleFactor: FontSizer.textScaleFactor(context),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    model.desc,
                    style: const TextStyle(
                      color: Color(0xFF63717B),
                      fontSize: 15,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: model.images.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 171,
                        height: 171,
                        padding: const EdgeInsets.all(8),
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage(model.images[index]),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    },
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

String truncateString(String text, int maxCharacters) {
  if (text.length <= maxCharacters) {
    return text;
  }

  String truncatedText = text.substring(0, maxCharacters);
  int lastSpaceIndex = truncatedText.lastIndexOf(' ');

  if (lastSpaceIndex != -1) {
    truncatedText = truncatedText.substring(0, lastSpaceIndex);
  }

  return '$truncatedText...';
}

String formatTimeAgo(DateTime dateTime) {
  Duration difference = DateTime.now().difference(dateTime);

  if (difference.inDays > 0) {
    return DateFormat.yMMMd().format(dateTime);
  } else if (difference.inHours > 0) {
    return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
  } else {
    return 'just now';
  }
}
