// To parse this JSON data, do
//
//     final deliveryAccountDetailResponse = deliveryAccountDetailResponseFromJson(jsonString);

import 'dart:convert';

DeliveryAccountDetailResponse deliveryAccountDetailResponseFromJson(
        String str) =>
    DeliveryAccountDetailResponse.fromJson(json.decode(str));

String deliveryAccountDetailResponseToJson(
        DeliveryAccountDetailResponse data) =>
    json.encode(data.toJson());

class DeliveryAccountDetailResponse {
  bool? success;
  String? message;
  List<Datum>? data;

  DeliveryAccountDetailResponse({
    this.success,
    this.message,
    this.data,
  });

  factory DeliveryAccountDetailResponse.fromJson(Map<String, dynamic> json) =>
      DeliveryAccountDetailResponse(
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
  String? accountBalance;
  int? id;
  String? deliveryPersonId;
  String? horseId;
  Via? via;
  dynamic invoiceId;
  String? amount;
  String? transactionType;
  String? date;
  Status? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        accountBalance: json["account_balance"],
        id: json["id"],
        deliveryPersonId: json["deliveryPersonId"],
        horseId: json["horseId"],
        via: viaValues.map[json["via"]]!,
        invoiceId: json["invoiceId"],
        amount: json["amount"],
        transactionType: json["transactionType"]!,
        date: json["date"],
        status: statusValues.map[json["status"]]!,
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
        "via": viaValues.reverse[via],
        "invoiceId": invoiceId,
        "amount": amount,
        "transactionType": transactionType,
        "date": date,
        "status": statusValues.reverse[status],
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum Status { SUCCESSFUL }

final statusValues = EnumValues({"Successful": Status.SUCCESSFUL});

enum TransactionType { CREDIT, TRANSACTION_TYPE_CREDIT }

final transactionTypeValues = EnumValues({
  "credit": TransactionType.CREDIT,
  "Credit": TransactionType.TRANSACTION_TYPE_CREDIT
});

enum Via { HORSE_DELIVERY }

final viaValues = EnumValues({"Horse Delivery": Via.HORSE_DELIVERY});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
