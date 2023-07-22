// To parse this JSON data, do
//
//     final rejectonnectionResponse = rejectonnectionResponseFromJson(jsonString);

import 'dart:convert';

HorseDidnotMatch horsedidnotResponseFromJson(String str) =>
    HorseDidnotMatch.fromJson(json.decode(str));

String rejectonnectionResponseFromJson(HorseDidnotMatch data) =>
    json.encode(data.toJson());

class HorseDidnotMatch {
  bool? success;
  String? message;
  Data? data;

  HorseDidnotMatch({
    this.success,
    this.message,
    this.data,
  });

  factory HorseDidnotMatch.fromJson(Map<String, dynamic> json) =>
      HorseDidnotMatch(
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

  Data({
    this.id,
    this.deliveryPersonId,
    this.horseId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        deliveryPersonId: json["deliveryPersonId"],
        horseId: json["horseId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deliveryPersonId": deliveryPersonId,
        "horseId": horseId,
      };
}
