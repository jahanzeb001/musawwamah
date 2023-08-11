// To parse this JSON data, do
//
//     final getNotificationResponse = getNotificationResponseFromJson(jsonString);

import 'dart:convert';

GetNotificationResponse getNotificationResponseFromJson(String str) =>
    GetNotificationResponse.fromJson(json.decode(str));

String getNotificationResponseToJson(GetNotificationResponse data) =>
    json.encode(data.toJson());

class GetNotificationResponse {
  bool? success;
  String? message;
  List<Datum>? data;

  GetNotificationResponse({
    this.success,
    this.message,
    this.data,
  });

  factory GetNotificationResponse.fromJson(Map<String, dynamic> json) =>
      GetNotificationResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? recieverId;
  dynamic horseId;
  String? description;
  String? title;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic horse;

  Datum({
    this.id,
    this.recieverId,
    this.horseId,
    this.description,
    this.title,
    this.createdAt,
    this.updatedAt,
    this.horse,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        recieverId: json["reciever_id"],
        horseId: json["horse_id"],
        description: json["description"],
        title: json["title"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        horse: json["horse"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reciever_id": recieverId,
        "horse_id": horseId,
        "description": description,
        "title": title,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "horse": horse,
      };
}
