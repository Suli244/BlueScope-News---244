import 'package:bluescope_news_244/screen/feature/new_posts/data/new_poster_model.dart';
import 'package:hive/hive.dart';

class HiveHelperBla {
  getData() async {
    var box = await Hive.openBox<NewPosterModel>('newPost');
    return box.values.toList();
  }

  addData(NewPosterModel model) async {
    var box = await Hive.openBox<NewPosterModel>('newPost');
    box.add(model);
  }

  deleteData(int id) async {
    var box = await Hive.openBox<NewPosterModel>('newPost');
    final Map<dynamic, NewPosterModel> deliveriesMap = box.toMap();
    dynamic desiredKey;
    deliveriesMap.forEach((key, value) {
      if (value.id == id) {
        desiredKey = key;
      }
    });
    box.delete(desiredKey);
    return box.values.toList();
  }

  clearData() async {
    var box = await Hive.openBox<NewPosterModel>('newPost');
    await box.clear();
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

    var car = box.get(desiredKey);
    // log(car.toString());
    // car?.marka = model.marka;
    // car?.model = model.model;
    // car?.year = model.year;
    // car?.engine = model.engine;
    await car?.save();
  }
}
