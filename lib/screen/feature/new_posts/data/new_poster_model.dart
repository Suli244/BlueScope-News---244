import 'dart:convert';

import 'package:flutter/foundation.dart';
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

  @override
  String toString() {
    return 'NewPosterModel(id: $id, title: $title, desc: $desc, images: $images)';
  }

  NewPosterModel copyWith({
    int? id,
    String? title,
    String? desc,
    List<String>? images,
  }) {
    return NewPosterModel(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'desc': desc});
    result.addAll({'images': images});

    return result;
  }

  factory NewPosterModel.fromMap(Map<String, dynamic> map) {
    return NewPosterModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      desc: map['desc'] ?? '',
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewPosterModel.fromJson(String source) =>
      NewPosterModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewPosterModel &&
        other.id == id &&
        other.title == title &&
        other.desc == desc &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ desc.hashCode ^ images.hashCode;
  }
}
