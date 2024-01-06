import 'package:bluescope_news_244/style/app_text_styles.dart';
import 'package:bluescope_news_244/utils/premium/premium.dart';
import 'package:bluescope_news_244/utils/urls.dart';
import 'package:bluescope_news_244/widgets/web_view_news.dart';
import 'package:flutter/material.dart';

class RestoreButtons extends StatelessWidget {
  const RestoreButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          InkWell(
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
            child: Text(
              'Privacy policy',
              style: AppTextStylesBlueScopeNews.s12W400(
                color: Colors.amber,
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () async {
              // await PremiumWebBlueScopeNews.buyTradeFuncRestoreContactPlink(
              //     context);
            },
            child: Text(
              'Restore purchases',
              style: AppTextStylesBlueScopeNews.s12W400(
                color: Colors.amber,
              ),
            ),
          ),
          const Spacer(),
          InkWell(
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
            child: Text(
              'Terms of use',
              style: AppTextStylesBlueScopeNews.s15W400(
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
