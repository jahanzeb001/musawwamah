// To parse this JSON data, do
//
//     final getMyWalletResponse = getMyWalletResponseFromJson(jsonString);

import 'dart:convert';

GetDeleveryWalletResponse getMyWalletResponseFromJson(String str) =>
    GetDeleveryWalletResponse.fromJson(json.decode(str));

String getMyWalletResponseToJson(GetDeleveryWalletResponse data) =>
    json.encode(data.toJson());

class GetDeleveryWalletResponse {
  bool? success;
  String? message;
  String? accountBalance;
  List<Datum>? data;

  GetDeleveryWalletResponse({
    this.success,
    this.message,
    this.accountBalance,
    this.data,
  });

  factory GetDeleveryWalletResponse.fromJson(Map<String, dynamic> json) =>
      GetDeleveryWalletResponse(
        success: json["success"],
        message: json["message"],
        accountBalance: json["account_balance"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "account_balance": accountBalance,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? accountBalance;
  int? id;
  String? userId;
  String? horseId;
  String? via;
  dynamic invoiceId;
  String? amount;
  String? transactionType;
  DateTime? date;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.accountBalance,
    this.id,
    this.userId,
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
        userId: json["userId"],
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
        "userId": userId,
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
