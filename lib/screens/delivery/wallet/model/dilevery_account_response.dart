// To parse this JSON data, do
//
//     final getUserResponse = getUserResponseFromJson(jsonString);

import 'dart:convert';

// GetDeliveryAccountService getUserResponseFromJson(String str) =>
//     GetDeliveryAccountService.fromJson(json.decode(str));

// String getUserResponseToJson(GetDeliveryAccountService data) =>
//     json.encode(data.toJson());

// class GetDeliveryAccountService {
//   bool? success;
//   String? message;
//   Data? data;

//   GetDeliveryAccountService({
//     this.success,
//     this.message,
//     this.data,
//   });

//   factory GetDeliveryAccountService.fromJson(Map<String, dynamic> json) =>
//       GetDeliveryAccountService(
//         success: json["success"],
//         message: json["message"],
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": data?.toJson(),
//       };
// }

// class Data {
//   int? id;
//   dynamic deliveryPersonId;
//   dynamic horseId;
//   dynamic via;
//   dynamic invoiceId;
//   String? amount;
//   String? transactionType;
//   String? date;
//   String? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   Data({
//     this.id,
//     this.deliveryPersonId,
//     this.horseId,
//     this.via,
//     this.invoiceId,
//     this.amount,
//     this.transactionType,
//     this.date,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         deliveryPersonId: json["deliveryPersonId"],
//         horseId: json["horseId"],
//         via: json["via"],
//         invoiceId: json["invoiceId"],
//         amount: json["amount"],
//         transactionType: json["transactionType"],
//         date: json["date"],
//         status: json["status"],
//         createdAt: json["createdAt"],
//         updatedAt: json["updatedAt"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "deliveryPersonId": deliveryPersonId,
//         "horseId": horseId,
//         "via": via,
//         "invoiceId": invoiceId,
//         "amount": amount,
//         "transactionType": transactionType,
//         "date": date,
//         "status": status,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//       };
// }

// To parse this JSON data, do
//
//     final deliveryAccountResponse = deliveryAccountResponseFromJson(jsonString);

DeliveryAccountResponse deliveryAccountResponseFromJson(String str) =>
    DeliveryAccountResponse.fromJson(json.decode(str));

String deliveryAccountResponseToJson(DeliveryAccountResponse data) =>
    json.encode(data.toJson());

class DeliveryAccountResponse {
  bool? success;
  String? message;
  Data? data;

  DeliveryAccountResponse({
    this.success,
    this.message,
    this.data,
  });

  factory DeliveryAccountResponse.fromJson(Map<String, dynamic> json) =>
      DeliveryAccountResponse(
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
  dynamic deliveryPersonId;
  dynamic horseId;
  dynamic via;
  dynamic invoiceId;
  String? amount;
  String? transactionType;
  String? date;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  DeliveryAccount({
    this.id,
    this.deliveryPersonId,
    this.horseId,
    this.via,
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
        via: json["via"],
        invoiceId: json["invoiceId"],
        amount: json["amount"],
        transactionType: json["transactionType"],
        date: json["date"],
        status: json["status"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deliveryPersonId": deliveryPersonId,
        "horseId": horseId,
        "via": via,
        "invoiceId": invoiceId,
        "amount": amount,
        "transactionType": transactionType,
        "date": date,
        "status": status,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
