import 'package:bluescope_news_244/prem_log/prem_log/hakj_model/hakj_model.dart';
import 'package:hive/hive.dart';

class GeuyRepo {
  Future<GudfModel?> getData() async {
    final box = await Hive.openBox<GudfModel>('sdf');
    final result = box.get('ggt');
    return result;
  }

  setData(GudfModel model) async {
    final box = await Hive.openBox<GudfModel>('sdf');
    box.put('ggt', model);
  }
}
