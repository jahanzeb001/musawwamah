// To parse this JSON data, do
//
//     final acceptConnectionResponse = acceptConnectionResponseFromJson(jsonString);

import 'dart:convert';

AcceptConnectionResponse acceptConnectionResponseFromJson(String str) =>
    AcceptConnectionResponse.fromJson(json.decode(str));

String acceptConnectionResponseToJson(AcceptConnectionResponse data) =>
    json.encode(data.toJson());

class AcceptConnectionResponse {
  bool? success;
  String? message;
  dynamic data;

  AcceptConnectionResponse({
    this.success,
    this.message,
    this.data,
  });

  factory AcceptConnectionResponse.fromJson(Map<String, dynamic> json) =>
      AcceptConnectionResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data,
      };
}
