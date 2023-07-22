// To parse this JSON data, do
//
//     final deliveryAccountResponse = deliveryAccountResponseFromJson(jsonString);

import 'dart:convert';

GetDeliveryAccountService deliveryAccountResponseFromJson(String str) =>
    GetDeliveryAccountService.fromJson(json.decode(str));

String deliveryAccountResponseToJson(GetDeliveryAccountService data) =>
    json.encode(data.toJson());

class GetDeliveryAccountService {
  bool? success;
  String? message;
  Data? data;

  GetDeliveryAccountService({
    this.success,
    this.message,
    this.data,
  });

  factory GetDeliveryAccountService.fromJson(Map<String, dynamic> json) =>
      GetDeliveryAccountService(
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
  DeliveryAccount? deliveryAccount;
  DeliveryAccount? user;

  Data({
    this.deliveryAccount,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        deliveryAccount: json["delivery_account"] == null
            ? null
            : DeliveryAccount.fromJson(json["delivery_account"]),
        user: json["user"] == null
            ? null
            : DeliveryAccount.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "delivery_account": deliveryAccount?.toJson(),
        "user": user?.toJson(),
      };
}

class DeliveryAccount {
  int? id;
  String? deliveryPersonId;
  String? horseId;
  dynamic via;
  dynamic invoiceId;
  dynamic amount;
  String? transactionType;
  String? date;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  DeliveryAccount({
    this.id,
    this.deliveryPersonId,
    this.horseId,
    this.invoiceId,
    this.amount,
    this.transactionType,
    this.date,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory DeliveryAccount.fromJson(Map<String, dynamic> json) =>
      DeliveryAccount(
        id: json["id"],
        deliveryPersonId: json["deliveryPersonId"],
        horseId: json["horseId"],
        invoiceId: json["invoiceId"],
        amount: json["amount"],
        transactionType: json["transactionType"],
        date: json["date"],
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
        "invoiceId": invoiceId,
        "amount": amount,
        "transactionType": transactionType,
        "date": date,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
