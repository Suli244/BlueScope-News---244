import 'dart:developer';

import 'package:bluescope_news_244/screen/feature/new_posts/data/new_poster_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'new_post_cubit.freezed.dart';
part 'new_post_state.dart';

class NewPostCubit extends Cubit<NewPostState> {
  NewPostCubit() : super(const NewPostState.loading()) {
    // clearData();
  }

  List<NewPosterModel> listOfPosts = [];

  saveData(NewPosterModel model) async {
    try {
      emit(const NewPostState.loading());
      var box = await Hive.openBox<NewPosterModel>('newPost');
      box.add(model);

      // emit(const NewPostState.loaded());
    } catch (e) {
      emit(NewPostState.error(e.toString()));
    }
  }

  getData() async {
    emit(const NewPostState.loading());
    try {
      listOfPosts = [];
      var box = await Hive.openBox<NewPosterModel>('newPost');
      listOfPosts = box.values.toList();
      log('data: listOfPosts: $listOfPosts ');
      emit(NewPostState.loaded(listOfPosts.reversed.toList()));
    } catch (e) {
      emit(NewPostState.error(e.toString()));
    }
  }

  searchList(String text) {
    try {
      List<NewPosterModel> newList = [];
      if (text.isNotEmpty) {
        newList = listOfPosts.where(
          (e) {
            final listsTitles = e.title.toLowerCase().trim();
            final input = text.toLowerCase().trim();
            return listsTitles.contains(input);
          },
        ).toList();
      } else {
        newList = listOfPosts;
      }
      emit(NewPostState.loaded(newList));
    } catch (e) {
      emit(NewPostState.error(e.toString()));
    }
  }

  editData(NewPosterModel model) async {
    var box = await Hive.openBox<NewPosterModel>('newPost');
    final Map<dynamic, NewPosterModel> deliveriesMap = box.toMap();
    dynamic desiredKey;
    deliveriesMap.forEach((key, value) {
      if (value.id == model.id) {
        desiredKey = key;
      }
    });

    var post = box.get(desiredKey);
    post?.images = model.images;
    post?.desc = model.desc;
    post?.title = model.title;
    await post?.save();
  }

  clearData() async {
    var box = await Hive.openBox<NewPosterModel>('newPost');
    await box.clear();
  }
}
