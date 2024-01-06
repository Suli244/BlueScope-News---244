import 'package:bloc/bloc.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/data/new_poster_model.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/domain/hive_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'new_post_cubit.freezed.dart';
part 'new_post_state.dart';

class NewPostCubit extends Cubit<NewPostState> {
  NewPostCubit(this.hive) : super(const NewPostState.initial());

  final HiveHelperBla hive;

  // final dio = Dio();

  // final List<HomeModel> savedList = [];

  saveData(NewPosterModel model) async {
    try {
      emit(const NewPostState.loading());
      var box = await Hive.openBox<NewPosterModel>('newPost');
      box.add(model);

      emit(const NewPostState.loaded());
    } catch (e) {
      emit(NewPostState.error(e.toString()));
    }
  }

  getData(String json) async {
    emit(const NewPostState.loading());
    try {
      // savedList.addAll(listModel);
      emit(const NewPostState.loaded());
    } catch (e) {
      emit(NewPostState.error(e.toString()));
    }
  }
}
