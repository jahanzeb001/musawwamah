// To parse this JSON data, do
//
//     final rejectonnectionResponse = rejectonnectionResponseFromJson(jsonString);

import 'dart:convert';

RejectonnectionResponse rejectonnectionResponseFromJson(String str) =>
    RejectonnectionResponse.fromJson(json.decode(str));

String rejectonnectionResponseToJson(RejectonnectionResponse data) =>
    json.encode(data.toJson());

class RejectonnectionResponse {
  bool? success;
  String? message;
  Data? data;

  RejectonnectionResponse({
    this.success,
    this.message,
    this.data,
  });

  factory RejectonnectionResponse.fromJson(Map<String, dynamic> json) =>
      RejectonnectionResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? deliveryPersonId;
  String? horseId;
  String? dropOff;
  String? pickup;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.deliveryPersonId,
    this.horseId,
    this.dropOff,
    this.pickup,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        deliveryPersonId: json["deliveryPersonId"],
        horseId: json["horseId"],
        dropOff: json["dropOff"],
        pickup: json["pickup"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deliveryPersonId": deliveryPersonId,
        "horseId": horseId,
        "dropOff": dropOff,
        "pickup": pickup,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
