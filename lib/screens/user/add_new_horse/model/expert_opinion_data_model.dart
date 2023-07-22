// To parse this JSON data, do
//
//     final expertOpinionHorseResponse = expertOpinionHorseResponseFromJson(jsonString);

import 'dart:convert';

ExpertOpinionHorseResponse expertOpinionHorseResponseFromJson(String str) =>
    ExpertOpinionHorseResponse.fromJson(json.decode(str));

String expertOpinionHorseResponseToJson(ExpertOpinionHorseResponse data) =>
    json.encode(data.toJson());

class ExpertOpinionHorseResponse {
  bool? success;
  String? message;
  Opinion? opinion;
  Settings? settings;

  ExpertOpinionHorseResponse({
    this.success,
    this.message,
    this.opinion,
    this.settings,
  });

  factory ExpertOpinionHorseResponse.fromJson(Map<String, dynamic> json) =>
      ExpertOpinionHorseResponse(
        success: json["success"],
        message: json["message"],
        opinion:
            json["opinion"] == null ? null : Opinion.fromJson(json["opinion"]),
        settings: json["settings"] == null
            ? null
            : Settings.fromJson(json["settings"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "opinion": opinion?.toJson(),
        "settings": settings?.toJson(),
      };
}

class Opinion {
  int? id;
  String? userId;
  String? price;
  String? percentage;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? userpicture;

  Opinion({
    this.id,
    this.userId,
    this.price,
    this.percentage,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.userpicture,
  });

  factory Opinion.fromJson(Map<String, dynamic> json) => Opinion(
        id: json["id"],
        userId: json["user_id"],
        price: json["price"],
        percentage: json["percentage"],
        description: json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        userpicture: json["userpicture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "price": price,
        "percentage": percentage,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "userpicture": userpicture,
      };
}

class Settings {
  String? siteComission;
  String? banner;
  String? banner_2;

  Settings({this.siteComission, this.banner, this.banner_2});

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        siteComission: json["Site Comission"],
        banner: json["banner"],
        banner_2: json["banner-2"],
      );

  Map<String, dynamic> toJson() => {
        "Site Comission": siteComission,
        "banner": banner,
        "banner_2": banner_2,
      };
}
