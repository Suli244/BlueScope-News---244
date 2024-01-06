import 'package:bluescope_news_244/screen/feature/new_posts/domain/hive_helper.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/cubit/new_post_cubit.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/new_post_page.dart';
import 'package:bluescope_news_244/screen/page/home_page.dart';
import 'package:bluescope_news_244/screen/page/saved_page.dart';
import 'package:bluescope_news_244/screen/page/settings_page.dart';
import 'package:bluescope_news_244/screen/page/your_posts_page.dart';
import 'package:bluescope_news_244/style/app_colors.dart';
import 'package:bluescope_news_244/utils/image/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigatorScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewPostCubit(HiveHelperBla()),
        )
      ],
      child: Scaffold(
        body: pages[index],
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 0,
          selectedFontSize: 0,
          currentIndex: index,
          onTap: (indexFrom) async {
            setState(() {
              index = indexFrom;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: '•',
              icon: Image.asset(
                AppImages.homeIcon,
                width: 25,
                color: AppColorsBlueScopeNews.color64717B,
              ),
              activeIcon: Image.asset(
                AppImages.homeActivIcon,
                color: AppColorsBlueScopeNews.color2D52D6,
                width: 25,
              ),
            ),
            BottomNavigationBarItem(
              label: '•',
              icon: Image.asset(
                AppImages.heartIcon,
                width: 25,
                color: AppColorsBlueScopeNews.color64717B,
              ),
              activeIcon: Image.asset(
                AppImages.heartActivIcon,
                color: AppColorsBlueScopeNews.color2D52D6,
                width: 25,
              ),
            ),
            BottomNavigationBarItem(
              label: '•',
              icon: Image.asset(
                AppImages.editIcon,
                width: 25,
                color: AppColorsBlueScopeNews.color64717B,
              ),
              activeIcon: Image.asset(
                AppImages.editActivIcon,
                color: AppColorsBlueScopeNews.color2D52D6,
                width: 25,
              ),
            ),
            BottomNavigationBarItem(
              label: '•',
              icon: Image.asset(
                AppImages.archiveIcon,
                width: 25,
                color: AppColorsBlueScopeNews.color64717B,
              ),
              activeIcon: Image.asset(
                AppImages.archiveActivIcon,
                color: AppColorsBlueScopeNews.color2D52D6,
                width: 25,
              ),
            ),
            BottomNavigationBarItem(
              label: '•',
              icon: Image.asset(
                AppImages.settingsIcon,
                width: 25,
                color: AppColorsBlueScopeNews.color64717B,
              ),
              activeIcon: Image.asset(
                AppImages.settingsActivIcon,
                color: AppColorsBlueScopeNews.color2D52D6,
                width: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> pages = [
  const HomePage(),
  const SavedPage(),
  const NewPostPage(),
  const YourPostsPage(),
  const SettingsPage(),
];
