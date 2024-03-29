import 'package:apphud/apphud.dart';
import 'package:bluescope_news_244/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:bluescope_news_244/utils/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PremiumWebBlueScopeNews {
  static Future<bool> getPremium() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('ISBUY') ?? false;
  }

  static Future<void> setPremium() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('ISBUY', true);
  }

  static Future<void> buyTradeFuncRestoreBlueScope(BuildContext context) async {
    final hasPremiumAccess = await Apphud.hasPremiumAccess();
    final hasActiveSubscription = await Apphud.hasActiveSubscription();
    if (hasPremiumAccess || hasActiveSubscription) {
      await setPremium();
      showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('Success!'),
          content: const Text('Your purchase has been restored!'),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const BottomNavigatorScreen(),
                  ),
                  (route) => false,
                );
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('Restore purchase'),
          content: const Text(
              'Your purchase is not found. Write to support: ${DocFFBlueScopeNews.s}'),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () => {Navigator.of(context).pop()},
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    }
  }
}
