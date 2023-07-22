// To parse this JSON data, do
//
//     final getHospitalityListingResponse = getHospitalityListingResponseFromJson(jsonString);

import 'dart:convert';

GetHospitalityListingResponse getHospitalityListingResponseFromJson(
        String str) =>
    GetHospitalityListingResponse.fromJson(json.decode(str));

String getHospitalityListingResponseToJson(
        GetHospitalityListingResponse data) =>
    json.encode(data.toJson());

class GetHospitalityListingResponse {
  bool? success;
  String? message;
  List<Datum>? data;

  GetHospitalityListingResponse({
    this.success,
    this.message,
    this.data,
  });

  factory GetHospitalityListingResponse.fromJson(Map<String, dynamic> json) =>
      GetHospitalityListingResponse(
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
  List<HospitalityImage>? hospitalityImages;
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
    this.hospitalityImages,
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
        hospitalityImages: json["hospitality_images"] == null
            ? []
            : List<HospitalityImage>.from(json["hospitality_images"]!
                .map((x) => HospitalityImage.fromJson(x))),
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
        "hospitality_images": hospitalityImages == null
            ? []
            : List<dynamic>.from(hospitalityImages!.map((x) => x.toJson())),
        "trainer": trainer?.toJson(),
        "hospitality_region": hospitalityRegion?.toJson(),
      };
}

class HospitalityImage {
  int? id;
  String? hospitalityId;
  String? imagePath;

  HospitalityImage({
    this.id,
    this.hospitalityId,
    this.imagePath,
  });

  factory HospitalityImage.fromJson(Map<String, dynamic> json) =>
      HospitalityImage(
        id: json["id"],
        hospitalityId: json["hospitality_id"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hospitality_id": hospitalityId,
        "image_path": imagePath,
      };
}

class HospitalityRegion {
  int? id;
  String? name;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<HospitalityService>? hospitalityServices;

  HospitalityRegion({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.hospitalityServices,
  });

  factory HospitalityRegion.fromJson(Map<String, dynamic> json) =>
      HospitalityRegion(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        hospitalityServices: json["hospitality_services"] == null
            ? []
            : List<HospitalityService>.from(json["hospitality_services"]!
                .map((x) => HospitalityService.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "hospitality_services": hospitalityServices == null
            ? []
            : List<dynamic>.from(hospitalityServices!.map((x) => x.toJson())),
      };
}

class HospitalityService {
  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;

  HospitalityService({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory HospitalityService.fromJson(Map<String, dynamic> json) =>
      HospitalityService(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pivot": pivot?.toJson(),
      };
}

class Pivot {
  String? hospitalityRegionId;
  String? hospitalityServiceId;
  String? enabled;
  DateTime? createdAt;
  DateTime? updatedAt;

  Pivot({
    this.hospitalityRegionId,
    this.hospitalityServiceId,
    this.enabled,
    this.createdAt,
    this.updatedAt,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        hospitalityRegionId: json["hospitality_region_id"],
        hospitalityServiceId: json["hospitality_service_id"],
        enabled: json["enabled"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "hospitality_region_id": hospitalityRegionId,
        "hospitality_service_id": hospitalityServiceId,
        "enabled": enabled,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
