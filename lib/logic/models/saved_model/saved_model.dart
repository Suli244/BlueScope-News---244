import 'package:hive/hive.dart';

part 'saved_model.g.dart';

@HiveType(typeId: 1)
class SavedModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String desciption;

  @HiveField(3)
  String images;

  @HiveField(4)
  String view;

  @HiveField(5)
  String time;

  SavedModel({
    required this.id,
    required this.title,
    required this.desciption,
    required this.images,
    required this.view,
    required this.time,
  });
}
