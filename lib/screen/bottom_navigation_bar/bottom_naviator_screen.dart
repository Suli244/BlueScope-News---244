import 'package:bluescope_news_244/screen/feature/new_posts/presentation/new_post_page.dart';
import 'package:bluescope_news_244/screen/page/home_page.dart';
import 'package:bluescope_news_244/screen/page/saved_page.dart';
import 'package:bluescope_news_244/screen/page/settings_page.dart';
import 'package:bluescope_news_244/screen/page/your_posts_page.dart';
import 'package:bluescope_news_244/style/app_colors.dart';
import 'package:bluescope_news_244/utils/image/app_images.dart';
import 'package:flutter/material.dart';

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
        bottomNavigationBar: Container(
          height: 106,
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1,
                color: AppColorsBlueScopeNews.colorD9E6F0,
              ),
            ),
          ),
          child: BottomNavigationBar(
            selectedItemColor: AppColorsBlueScopeNews.color2D52D6,
            backgroundColor: Colors.white,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
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
                label: index == 0 ? '•' : '',
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
                label: index == 1 ? '•' : '',
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
                label: index == 2 ? '•' : '',
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
                label: index == 3 ? '•' : '',
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
                label: index == 4 ? '•' : '',
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
