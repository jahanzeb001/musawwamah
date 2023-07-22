// To parse this JSON data, do
//
//     final deliveryConfirmPickupResponse = deliveryConfirmPickupResponseFromJson(jsonString);

import 'dart:convert';

DeliveryConfirmPickupResponse deliveryConfirmPickupResponseFromJson(
        String str) =>
    DeliveryConfirmPickupResponse.fromJson(json.decode(str));

String deliveryConfirmPickupResponseToJson(
        DeliveryConfirmPickupResponse data) =>
    json.encode(data.toJson());

class DeliveryConfirmPickupResponse {
  bool? success;
  String? message;
  String? horseImageFromRight;
  String? horseImageFromLeft;
  String? horseFrontView;
  String? notesImage;
  String? horseBackView;
  String? horseVideo;

  DeliveryConfirmPickupResponse({
    this.success,
    this.message,
    this.horseImageFromRight,
    this.horseImageFromLeft,
    this.horseFrontView,
    this.notesImage,
    this.horseBackView,
    this.horseVideo,
  });

  factory DeliveryConfirmPickupResponse.fromJson(Map<String, dynamic> json) =>
      DeliveryConfirmPickupResponse(
        success: json["success"],
        message: json["message"],
        horseImageFromRight: json["horseImageFromRight"],
        horseImageFromLeft: json["horseImageFromLeft"],
        horseFrontView: json["horseFrontView"],
        notesImage: json["notesImage"],
        horseBackView: json["horseBackView"],
        horseVideo: json["horseVideo"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "horseImageFromRight": horseImageFromRight,
        "horseImageFromLeft": horseImageFromLeft,
        "horseFrontView": horseFrontView,
        "notesImage": notesImage,
        "horseBackView": horseBackView,
        "horseVideo": horseVideo,
      };
}

//////////////////////////////confrim pickup
// To parse this JSON data, do
//
//     final confirmPickupResponse = confirmPickupResponseFromJson(jsonString);

ConfirmPickupResponse confirmPickupResponseFromJson(String str) =>
    ConfirmPickupResponse.fromJson(json.decode(str));

String confirmPickupResponseToJson(ConfirmPickupResponse data) =>
    json.encode(data.toJson());

class ConfirmPickupResponse {
  bool? success;
  String? message;
  Data? data;

  ConfirmPickupResponse({
    this.success,
    this.message,
    this.data,
  });

  factory ConfirmPickupResponse.fromJson(Map<String, dynamic> json) =>
      ConfirmPickupResponse(
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
  String? isReviewed;
  String? ratting;
  dynamic review;
  dynamic signature;
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
  int? horseId;
  String? horseImageFromRight;
  String? horseImageFromLeft;
  String? horseFrontView;
  String? notesImage;
  String? horseBackView;
  String? horseVideo;
  String? notes;

  Request({
    this.horseId,
    this.horseImageFromRight,
    this.horseImageFromLeft,
    this.horseFrontView,
    this.notesImage,
    this.horseBackView,
    this.horseVideo,
    this.notes,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        horseId: json["horseId"],
        horseImageFromRight: json["horseImageFromRight"],
        horseImageFromLeft: json["horseImageFromLeft"],
        horseFrontView: json["horseFrontView"],
        notesImage: json["notesImage"],
        horseBackView: json["horseBackView"],
        horseVideo: json["horseVideo"],
        notes: json["notes"],
      );

  Map<String, dynamic> toJson() => {
        "horseId": horseId,
        "horseImageFromRight": horseImageFromRight,
        "horseImageFromLeft": horseImageFromLeft,
        "horseFrontView": horseFrontView,
        "notesImage": notesImage,
        "horseBackView": horseBackView,
        "horseVideo": horseVideo,
        "notes": notes,
      };
}
