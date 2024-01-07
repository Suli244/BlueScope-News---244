class GetNewsModel {
  final String title;
  final String desription;
  final String time;
  final int view;
  final String image;
  GetNewsModel({
    required this.title,
    required this.desription,
    required this.time,
    required this.view,
    required this.image,
  });

  factory GetNewsModel.fromJson(Map<String, dynamic> map) {
    return GetNewsModel(
      title: map['title'],
      desription: map['desription'],
      time: map['time'],
      view: map['view'],
      image: map['image'],
    );
  }
}
