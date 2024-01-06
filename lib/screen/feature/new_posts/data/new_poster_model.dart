import 'package:hive/hive.dart';

part 'new_poster_model.g.dart';

@HiveType(typeId: 0)
class NewPosterModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String desc;

  @HiveField(3)
  List<String> images;

  NewPosterModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.images,
  });
}
