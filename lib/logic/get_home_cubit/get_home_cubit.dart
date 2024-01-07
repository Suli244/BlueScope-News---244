import 'package:bluescope_news_244/logic/get_home_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_home_cubit.freezed.dart';
part 'get_home_state.dart';

class GetHomeCubit extends Cubit<GetHomeState> {
  GetHomeCubit() : super(const GetHomeState.loading());

  final dio = Dio();

  final List<GetNewsModel> newsList = [];

  getNews(String type) async {
    emit(const GetHomeState.loading());
    try {
      final result = await dio.get(
          'https://bluescope-news-244-default-rtdb.firebaseio.com/$type.json?auth=AIzaSyAnOwrFH-vh_qocALVzi4ExFM7TPAmdJbc');
      final listModel = result.data
          .map<GetNewsModel>(
            (e) => GetNewsModel.fromJson(e),
          )
          .toList();
      newsList.clear();
      newsList.addAll(listModel);
      emit(GetHomeState.success(newsList));
    } catch (e) {
      emit(GetHomeState.error(e.toString()));
    }
  }

  searchByName(String text) {
    emit(const GetHomeState.loading());
    try {
      List<GetNewsModel> newsNewsList = List<GetNewsModel>.from(newsList);
      newsNewsList.removeWhere(
          (e) => !e.title.toLowerCase().contains(text.toLowerCase()));
      emit(GetHomeState.success(newsNewsList));
    } catch (e) {
      emit(GetHomeState.error(e.toString()));
    }
  }
}
