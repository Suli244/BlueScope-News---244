import 'package:hive/hive.dart';
part 'hakj_model.g.dart';

@HiveType(typeId: 4)
class GudfModel extends HiveObject {
  @HiveField(0)
  String dadfUrl;

  @HiveField(1)
  bool sldkfOp;
  GudfModel({
    required this.dadfUrl,
    required this.sldkfOp,
  });
}
