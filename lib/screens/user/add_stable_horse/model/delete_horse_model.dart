// To parse this JSON data, do
//
//     final deleteStableHorseResponse = deleteStableHorseResponseFromJson(jsonString);

import 'dart:convert';

DeleteStableHorseResponse deleteStableHorseResponseFromJson(String str) =>
    DeleteStableHorseResponse.fromJson(json.decode(str));

String deleteStableHorseResponseToJson(DeleteStableHorseResponse data) =>
    json.encode(data.toJson());

class DeleteStableHorseResponse {
  bool? success;
  String? message;
  int? sales;
  int? ratting;
  dynamic data;

  DeleteStableHorseResponse({
    this.success,
    this.message,
    this.sales,
    this.ratting,
    this.data,
  });

  factory DeleteStableHorseResponse.fromJson(Map<String, dynamic> json) =>
      DeleteStableHorseResponse(
        success: json["success"],
        message: json["message"],
        sales: json["sales"],
        ratting: json["ratting"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "sales": sales,
        "ratting": ratting,
        "data": data,
      };
}
