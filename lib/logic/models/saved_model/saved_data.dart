// class SavedModel {
//   String? title;
//   String? desciption;
//   String? image;
//   String? time;
//   String? view;

//   SavedModel({this.title, this.desciption, this.image, this.time, this.view});

//   SavedModel.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     desciption = json['desciption'];
//     image = json['image'];
//     time = json['time'];
//     view = json['view'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['desciption'] = this.desciption;
//     data['image'] = this.image;
//     data['time'] = this.time;
//     data['view'] = this.view;
//     return data;
//   }
// }