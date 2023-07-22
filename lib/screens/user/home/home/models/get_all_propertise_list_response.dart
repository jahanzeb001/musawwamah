// To parse this JSON data, do
//
//     final getFilterPropertiseResponse = getFilterPropertiseResponseFromJson(jsonString);

import 'dart:convert';

GetFilterPropertiseResponse getFilterPropertiseResponseFromJson(String str) =>
    GetFilterPropertiseResponse.fromJson(json.decode(str));

String getFilterPropertiseResponseToJson(GetFilterPropertiseResponse data) =>
    json.encode(data.toJson());

class GetFilterPropertiseResponse {
  bool? success;
  String? message;
  List<String>? type;
  List<String>? region;
  List<String>? age;
  List<String>? color;
  List<String>? casuality;
  List<String>? originality;

  GetFilterPropertiseResponse({
    this.success,
    this.message,
    this.type,
    this.region,
    this.age,
    this.color,
    this.casuality,
    this.originality,
  });

  factory GetFilterPropertiseResponse.fromJson(Map<String, dynamic> json) =>
      GetFilterPropertiseResponse(
        success: json["success"],
        message: json["message"],
        type: json["type"] == null
            ? []
            : List<String>.from(json["type"]!.map((x) => x)),
        region: json["region"] == null
            ? []
            : List<String>.from(json["region"]!.map((x) => x)),
        age: json["age"] == null
            ? []
            : List<String>.from(json["age"]!.map((x) => x)),
        color: json["color"] == null
            ? []
            : List<String>.from(json["color"]!.map((x) => x)),
        casuality: json["casuality"] == null
            ? []
            : List<String>.from(json["casuality"]!.map((x) => x)),
        originality: json["originality"] == null
            ? []
            : List<String>.from(json["originality"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "type": type == null ? [] : List<dynamic>.from(type!.map((x) => x)),
        "region":
            region == null ? [] : List<dynamic>.from(region!.map((x) => x)),
        "age": age == null ? [] : List<dynamic>.from(age!.map((x) => x)),
        "color": color == null ? [] : List<dynamic>.from(color!.map((x) => x)),
        "casuality": casuality == null
            ? []
            : List<dynamic>.from(casuality!.map((x) => x)),
        "originality": originality == null
            ? []
            : List<dynamic>.from(originality!.map((x) => x)),
      };
}
