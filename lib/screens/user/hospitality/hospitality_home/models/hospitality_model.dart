// To parse this JSON data, do
//
//     final getHospitalityResponse = getHospitalityResponseFromJson(jsonString);

import 'dart:convert';

GetHospitalityResponse getHospitalityResponseFromJson(String str) =>
    GetHospitalityResponse.fromJson(json.decode(str));

String getHospitalityResponseToJson(GetHospitalityResponse data) =>
    json.encode(data.toJson());

class GetHospitalityResponse {
  bool? success;
  String? message;
  List<Datum>? data;

  GetHospitalityResponse({
    this.success,
    this.message,
    this.data,
  });

  factory GetHospitalityResponse.fromJson(Map<String, dynamic> json) =>
      GetHospitalityResponse(
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
  int? id;
  String? price;
  String? trainerUserId;
  String? regionId;
  String? featuredImage;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? hospitalityRatingsAvgRating;
  Trainer? trainer;
  HospitalityRegion? hospitalityRegion;

  Datum({
    this.id,
    this.price,
    this.trainerUserId,
    this.regionId,
    this.featuredImage,
    this.createdAt,
    this.updatedAt,
    this.hospitalityRatingsAvgRating,
    this.trainer,
    this.hospitalityRegion,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        price: json["price"],
        trainerUserId: json["trainer_user_id"],
        regionId: json["region_id"],
        featuredImage: json["featured_image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        hospitalityRatingsAvgRating: json["hospitality_ratings_avg_rating"],
        trainer:
            json["trainer"] == null ? null : Trainer.fromJson(json["trainer"]),
        hospitalityRegion: json["hospitality_region"] == null
            ? null
            : HospitalityRegion.fromJson(json["hospitality_region"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "trainer_user_id": trainerUserId,
        "region_id": regionId,
        "featured_image": featuredImage,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "hospitality_ratings_avg_rating": hospitalityRatingsAvgRating,
        "trainer": trainer?.toJson(),
        "hospitality_region": hospitalityRegion?.toJson(),
      };
}

class HospitalityRegion {
  int? id;
  String? name;

  HospitalityRegion({
    this.id,
    this.name,
  });

  factory HospitalityRegion.fromJson(Map<String, dynamic> json) =>
      HospitalityRegion(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Trainer {
  int? id;
  String? fullname;

  Trainer({
    this.id,
    this.fullname,
  });

  factory Trainer.fromJson(Map<String, dynamic> json) => Trainer(
        id: json["id"],
        fullname: json["fullname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
      };
}
