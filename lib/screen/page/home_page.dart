import 'package:bluescope_news_244/logic/get_home_cubit/get_home_cubit.dart';
import 'package:bluescope_news_244/style/app_colors.dart';
import 'package:bluescope_news_244/style/app_text_styles.dart';
import 'package:bluescope_news_244/widgets/app_unfocuser.dart';
import 'package:bluescope_news_244/widgets/home_item_widget.dart';
import 'package:bluescope_news_244/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> titles = [
    'Health',
    'Politics',
    'Art',
    'Food',
    'Social',
    'Travel',
    'Sports',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetHomeCubit(),
      child: AppUnfocuserBlueScopeNews(
        child: Scaffold(
          body: DefaultTabController(
            length: 7,
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Discover',
                          style: AppTextStylesBlueScopeNews.s46W700(),
                        ),
                        Text(
                          'News from all over the world',
                          style: AppTextStylesBlueScopeNews.s15W400(
                            color: AppColorsBlueScopeNews.color64717B,
                          ),
                        ),
                        SizedBox(height: 32.h),
                        Builder(
                          builder: (context) => TextFieldWidgetSearch(
                            onChanged: (val) {
                              context.read<GetHomeCubit>().searchByName(val);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 26.h),
                  Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColorsBlueScopeNews.colorD9E6F0,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                      TabBar(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        indicatorColor: AppColorsBlueScopeNews.color2D52D6,
                        unselectedLabelColor:
                            AppColorsBlueScopeNews.color64717B,
                        unselectedLabelStyle:
                            AppTextStylesBlueScopeNews.s19W900(
                          color: AppColorsBlueScopeNews.color64717B,
                        ),
                        indicator: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColorsBlueScopeNews.color2D52D6,
                              width: 3,
                            ),
                          ),
                        ),
                        indicatorWeight: 10,
                        labelStyle: AppTextStylesBlueScopeNews.s19W900(),
                        labelColor: Colors.black,
                        isScrollable: true,
                        onTap: (index) {},
                        tabs: titles.map<Widget>((e) => Text(e)).toList(),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: titles
                          .map<Widget>(
                            (e) => TabWidget(type: e.toLowerCase()),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TabWidget extends StatefulWidget {
  const TabWidget({super.key, required this.type});
  final String type;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  @override
  void initState() {
    context.read<GetHomeCubit>().getNews(widget.type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHomeCubit, GetHomeState>(
      builder: (context, state) {
        return state.when(
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          error: (error) => Center(
            child: Text(error),
          ),
          success: (model) => ListView.separated(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 16.w,
            ),
            itemCount: model.length,
            separatorBuilder: (context, index) => SizedBox(height: 24.h),
            itemBuilder: (context, index) => HomeItemWidget(
              model: model[index],
              type: widget.type,
              index: index,
            ),
          ),
        );
      },
    );
  }
}
