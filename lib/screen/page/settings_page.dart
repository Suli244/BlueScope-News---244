import 'package:bluescope_news_244/screen/premium/premium_screen.dart';
import 'package:bluescope_news_244/style/app_colors.dart';
import 'package:bluescope_news_244/style/app_text_styles.dart';
import 'package:bluescope_news_244/utils/premium/premium.dart';
import 'package:bluescope_news_244/utils/urls.dart';
import 'package:bluescope_news_244/widgets/settings_item_widget.dart';
import 'package:bluescope_news_244/widgets/web_view_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isPremiumNews = true;
  @override
  void initState() {
    getPremium();
    super.initState();
  }

  getPremium() async {
    isPremiumNews = await PremiumWebBlueScopeNews.getPremium();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 29),
          child: Column(
            children: [
              SettingsItemWidget(
                title: 'Privacy policy',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebBlueScopeNews(
                        title: 'Privacy policy',
                        url: DocFFBlueScopeNews.pP,
                      ),
                    ),
                  );
                },
              ),
              SettingsItemWidget(
                top: 16.h,
                title: 'Terms of use',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebBlueScopeNews(
                        title: 'Terms of use',
                        url: DocFFBlueScopeNews.tUse,
                      ),
                    ),
                  );
                },
              ),
              SettingsItemWidget(
                top: 16.h,
                title: 'Support',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebBlueScopeNews(
                        title: 'Support',
                        url: DocFFBlueScopeNews.s,
                      ),
                    ),
                  );
                },
              ),
              if (!isPremiumNews)
                SettingsItemWidget(
                  top: 16.h,
                  bottom: 16.h,
                  title: 'Restore',
                  onTap: () async {
                    await PremiumWebBlueScopeNews.buyTradeFuncRestoreBlueScope(
                        context);
                  },
                ),
              if (!isPremiumNews)
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (cotext) => const PremiumScreen(
                          isClose: true,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 61.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColorsBlueScopeNews.colorD8E6EF,
                        width: 1.30,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'PREMIUM FOR \$1,99',
                            style: AppTextStylesBlueScopeNews.s17W600(
                              color: AppColorsBlueScopeNews.colorDD3737,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
