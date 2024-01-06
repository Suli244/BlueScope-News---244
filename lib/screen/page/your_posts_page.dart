import 'package:bluescope_news_244/screen/feature/new_posts/data/new_poster_model.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/cubit/new_post_cubit.dart';
import 'package:bluescope_news_244/screen/page/your_posts_detail_page.dart';
import 'package:bluescope_news_244/style/app_colors.dart';
import 'package:bluescope_news_244/style/app_text_styles.dart';
import 'package:bluescope_news_244/utils/image/app_images.dart';
import 'package:bluescope_news_244/widgets/app_unfocuser.dart';
import 'package:bluescope_news_244/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourPostsPage extends StatefulWidget {
  const YourPostsPage({super.key});

  @override
  State<YourPostsPage> createState() => _YourPostsPageState();
}

class _YourPostsPageState extends State<YourPostsPage> {
  @override
  void initState() {
    super.initState();
    context.read<NewPostCubit>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return AppUnfocuserBlueScopeNews(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your posts',
                  style: AppTextStylesBlueScopeNews.s46W700(),
                ),
                const SizedBox(height: 32),
                TextFieldWidgetSearch(
                  onChanged: (p0) =>
                      context.read<NewPostCubit>().searchList(p0),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: BlocBuilder<NewPostCubit, NewPostState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () {
                          return const SizedBox(height: 10);
                        },
                        loading: () {
                          return const SizedBox(height: 10);
                        },
                        error: (v) {
                          return const SizedBox(height: 10);
                        },
                        loaded: (models) {
                          return models.isEmpty
                              ? const Center(
                                  child: Text(
                                    'Нou have no published posts',
                                  ),
                                )
                              : ListView.separated(
                                  itemCount: models.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(height: 32);
                                  },
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          HomeItemWidget(
                                    models[index],
                                  ),
                                );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget(this.model, {super.key});
  final NewPosterModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => YourPostsDetailPage(model),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (model.images.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                model.images.first,
                height: 70,
                width: 60,
                fit: BoxFit.cover,
              ),
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
