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

// To parse this JSON data, do
//
//     final deliveryAccountResponse = deliveryAccountResponseFromJson(jsonString);

import 'dart:convert';

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
  String? accountBalance;
  int? id;
  String? deliveryPersonId;
  String? horseId;
  String? via;
  dynamic invoiceId;
  String? amount;
  String? transactionType;
  DateTime? date;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.accountBalance,
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accountBalance: json["account_balance"],
        id: json["id"],
        deliveryPersonId: json["deliveryPersonId"],
        horseId: json["horseId"],
        via: json["via"],
        invoiceId: json["invoiceId"],
        amount: json["amount"],
        transactionType: json["transactionType"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "account_balance": accountBalance,
        "id": id,
        "deliveryPersonId": deliveryPersonId,
        "horseId": horseId,
        "via": via,
        "invoiceId": invoiceId,
        "amount": amount,
        "transactionType": transactionType,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
