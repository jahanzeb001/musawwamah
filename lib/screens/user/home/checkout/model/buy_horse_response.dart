// To parse this JSON data, do
//
//     final buyHorseResponse = buyHorseResponseFromJson(jsonString);

import 'dart:convert';

BuyHorseResponse buyHorseResponseFromJson(String str) =>
    BuyHorseResponse.fromJson(json.decode(str));

String buyHorseResponseToJson(BuyHorseResponse data) =>
    json.encode(data.toJson());

class BuyHorseResponse {
  bool? success;
  String? message;
  Purchase? purchase;

  BuyHorseResponse({
    this.success,
    this.message,
    this.purchase,
  });

  factory BuyHorseResponse.fromJson(Map<String, dynamic> json) =>
      BuyHorseResponse(
        success: json["success"],
        message: json["message"],
        purchase: json["purchase"] == null
            ? null
            : Purchase.fromJson(json["purchase"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "purchase": purchase?.toJson(),
      };
}

class Purchase {
  int? id;
  int? purchaserId;
  int? horseId;
  int? isPaid;
  int? isDelivered;
  int? acceptedByDeliveryBoy;
  dynamic rejectToDeliverBy;
  String? latitude;
  String? longitude;
  String? sellerId;
  String? pickupAddress;
  String? deliveryAddress;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Purchase({
    this.id,
    this.purchaserId,
    this.horseId,
    this.isPaid,
    this.isDelivered,
    this.acceptedByDeliveryBoy,
    this.rejectToDeliverBy,
    this.latitude,
    this.longitude,
    this.sellerId,
    this.pickupAddress,
    this.deliveryAddress,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
        id: json["id"],
        purchaserId: json["purchaserId"],
        horseId: json["horseId"],
        isPaid: json["isPaid"],
        isDelivered: json["isDelivered"],
        acceptedByDeliveryBoy: json["acceptedByDeliveryBoy"],
        rejectToDeliverBy: json["rejectToDeliverBy"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        sellerId: json["sellerId"],
        pickupAddress: json["pickupAddress"],
        deliveryAddress: json["deliveryAddress"],
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
        "purchaserId": purchaserId,
        "horseId": horseId,
        "isPaid": isPaid,
        "isDelivered": isDelivered,
        "acceptedByDeliveryBoy": acceptedByDeliveryBoy,
        "rejectToDeliverBy": rejectToDeliverBy,
        "latitude": latitude,
        "longitude": longitude,
        "sellerId": sellerId,
        "pickupAddress": pickupAddress,
        "deliveryAddress": deliveryAddress,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
