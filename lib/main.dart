import 'package:apphud/apphud.dart';
import 'package:bluescope_news_244/core/hive/hive_helper.dart';
import 'package:bluescope_news_244/logic/models/saved_model/saved_model.dart';
import 'package:bluescope_news_244/prem_log/prem_log/hakj_model/hakj_model.dart';
import 'package:bluescope_news_244/prem_log/start_logic.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/data/new_poster_model.dart';
import 'package:bluescope_news_244/screen/splash/splash_screen.dart';
import 'package:bluescope_news_244/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Apphud.start(apiKey: DocFFBlueScopeNews.apphudApiKey);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  Hive.registerAdapter(NewPosterModelAdapter());
  Hive.registerAdapter(SavedModelAdapter());
  Hive.registerAdapter(GudfModelAdapter());
  await ajhjkasfalsf();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'First Method',
        home: child,
        theme: ThemeData.light().copyWith(
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
      ),
      child: const SplashScreen(),
    );
  }
}
