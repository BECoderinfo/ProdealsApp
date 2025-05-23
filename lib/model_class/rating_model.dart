class RatingModel {
  String id;
  UserId userId;
  String businessId;
  int rating;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String comment;

  RatingModel({
    required this.id,
    required this.userId,
    required this.businessId,
    required this.rating,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.comment,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        id: json["_id"],
        userId: UserId.fromJson(json["userId"]),
        businessId: json["businessId"],
        rating: json["rating"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId.toJson(),
        "businessId": businessId,
        "rating": rating,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "comment": comment,
      };
}

class UserId {
  String id;
  String userName;

  UserId({
    required this.id,
    required this.userName,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userName": userName,
      };
}
