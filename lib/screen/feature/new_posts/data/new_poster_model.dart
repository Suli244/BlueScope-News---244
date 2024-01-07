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

  @HiveField(4)
  DateTime dateTime;
//DateTime.now()
  NewPosterModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.dateTime,
    required this.images,
  });

  @override
  String toString() {
    return 'NewPosterModel(id: $id, title: $title, desc: $desc, dateTime: $dateTime, images: $images)';
  }

  NewPosterModel copyWith({
    int? id,
    String? title,
    String? desc,
    DateTime? dateTime,
    List<String>? images,
  }) {
    return NewPosterModel(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      dateTime: dateTime ?? this.dateTime,
      images: images ?? this.images,
    );
  }
}
