// To parse this JSON data, do
//
//     final confirmDropOffResponse = confirmDropOffResponseFromJson(jsonString);

import 'dart:convert';

ConfirmDropOffResponse confirmDropOffResponseFromJson(String str) =>
    ConfirmDropOffResponse.fromJson(json.decode(str));

String confirmDropOffResponseToJson(ConfirmDropOffResponse data) =>
    json.encode(data.toJson());

class ConfirmDropOffResponse {
  bool? success;
  String? message;
  Data? data;

  ConfirmDropOffResponse({
    this.success,
    this.message,
    this.data,
  });

  factory ConfirmDropOffResponse.fromJson(Map<String, dynamic> json) =>
      ConfirmDropOffResponse(
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
  dynamic pickup;
  String? status;
  String? notes;
  String? deliveryNotes;
  String? isReviewed;
  String? ratting;
  dynamic review;
  String? signature;
  DateTime? createdAt;
  DateTime? updatedAt;
  Request? request;

  Data({
    this.id,
    this.deliveryPersonId,
    this.horseId,
    this.dropOff,
    this.pickup,
    this.status,
    this.notes,
    this.deliveryNotes,
    this.isReviewed,
    this.ratting,
    this.review,
    this.signature,
    this.createdAt,
    this.updatedAt,
    this.request,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        deliveryPersonId: json["deliveryPersonId"],
        horseId: json["horseId"],
        dropOff: json["dropOff"],
        pickup: json["pickup"],
        status: json["status"],
        notes: json["notes"],
        deliveryNotes: json["delivery_notes"],
        isReviewed: json["isReviewed"],
        ratting: json["ratting"],
        review: json["review"],
        signature: json["signature"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        request:
            json["request"] == null ? null : Request.fromJson(json["request"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deliveryPersonId": deliveryPersonId,
        "horseId": horseId,
        "dropOff": dropOff,
        "pickup": pickup,
        "status": status,
        "notes": notes,
        "delivery_notes": deliveryNotes,
        "isReviewed": isReviewed,
        "ratting": ratting,
        "review": review,
        "signature": signature,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "request": request?.toJson(),
      };
}

class Request {
  String? horseId;
  String? horseVideo;
  String? horseImageFromRight;
  String? horseImageFromLeft;
  String? horseFrontView;
  String? horseBackView;
  String? deliveryNotes;

  Request({
    this.horseId,
    this.horseVideo,
    this.horseImageFromRight,
    this.horseImageFromLeft,
    this.horseFrontView,
    this.horseBackView,
    this.deliveryNotes,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        horseId: json["horseId"],
        horseVideo: json["horseVideo"],
        horseImageFromRight: json["horseImageFromRight"],
        horseImageFromLeft: json["horseImageFromLeft"],
        horseFrontView: json["horseFrontView"],
        horseBackView: json["horseBackView"],
        deliveryNotes: json["delivery_notes"],
      );

  Map<String, dynamic> toJson() => {
        "horseId": horseId,
        "horseVideo": horseVideo,
        "horseImageFromRight": horseImageFromRight,
        "horseImageFromLeft": horseImageFromLeft,
        "horseFrontView": horseFrontView,
        "horseBackView": horseBackView,
        "delivery_notes": deliveryNotes,
      };
}
