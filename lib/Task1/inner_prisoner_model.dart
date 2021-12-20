class InnerModel {
  int ?statusCode;
  bool ?success;
  String? message;
  Model ?model;

  // InnerModel(
  //     {required this.statusCode,
  //       required this.success,
  //       required this.message,
  //       required this.model,
  //     });

  InnerModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    model = (json['model'] != null ?  Model.fromJson(json['model']) : null)!;
  }


}
class Model {
  String ?id;
   String? name;
  String? number;
  String ?details;
  String ?place;
  late String thumbnail;
 late String image;
  String ?status;
  int ?neededAmount;
  int ?collectedAmount;
  bool ?isPinned;
  String? createdAt;
  String ?updatedAt;


  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    details = json['details'];
    place = json['place'];
    thumbnail = json['thumbnail'];
    image = json['image'];
    status = json['status'];
    neededAmount = json['neededAmount'];
    collectedAmount = json['collectedAmount'];
    isPinned = json['isPinned'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

}
