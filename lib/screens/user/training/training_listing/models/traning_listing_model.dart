// To parse this JSON data, do
//
//     final getTraningListingResponse = getTraningListingResponseFromJson(jsonString);

import 'dart:convert';

GetTraningListingResponse getTraningListingResponseFromJson(String str) =>
    GetTraningListingResponse.fromJson(json.decode(str));

String getTraningListingResponseToJson(GetTraningListingResponse data) =>
    json.encode(data.toJson());

class GetTraningListingResponse {
  bool? success;
  String? message;
  Data? data;

  GetTraningListingResponse({
    this.success,
    this.message,
    this.data,
  });

  factory GetTraningListingResponse.fromJson(Map<String, dynamic> json) =>
      GetTraningListingResponse(
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
  int? id;
  String? image;
  String? trainerUserId;
  String? regionId;
  dynamic rating;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<TrainingImage>? trainingImages;
  Trainer? trainer;
  Region? region;

  Data({
    this.id,
    this.image,
    this.trainerUserId,
    this.regionId,
    this.rating,
    this.createdAt,
    this.updatedAt,
    this.trainingImages,
    this.trainer,
    this.region,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        image: json["image"],
        trainerUserId: json["trainer_user_id"],
        regionId: json["region_id"],
        rating: json["rating"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        trainingImages: json["training_images"] == null
            ? []
            : List<TrainingImage>.from(
                json["training_images"]!.map((x) => TrainingImage.fromJson(x))),
        trainer:
            json["trainer"] == null ? null : Trainer.fromJson(json["trainer"]),
        region: json["region"] == null ? null : Region.fromJson(json["region"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "trainer_user_id": trainerUserId,
        "region_id": regionId,
        "rating": rating,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "training_images": trainingImages == null
            ? []
            : List<dynamic>.from(trainingImages!.map((x) => x.toJson())),
        "trainer": trainer?.toJson(),
        "region": region?.toJson(),
      };
}

class Region {
  int? id;
  String? name;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Service>? services;

  Region({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.services,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        services: json["services"] == null
            ? []
            : List<Service>.from(
                json["services"]!.map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "services": services == null
            ? []
            : List<dynamic>.from(services!.map((x) => x.toJson())),
      };
}

class Service {
  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;

  Service({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
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
  String? traningRegionId;
  String? traningServiceId;
  String? enabled;
  String? startTime;
  String? endTime;
  String? price;
  String? days;
  DateTime? createdAt;
  DateTime? updatedAt;

  Pivot({
    this.traningRegionId,
    this.traningServiceId,
    this.enabled,
    this.startTime,
    this.endTime,
    this.price,
    this.days,
    this.createdAt,
    this.updatedAt,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        traningRegionId: json["traning_region_id"],
        traningServiceId: json["traning_service_id"],
        enabled: json["enabled"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        price: json["price"],
        days: json["days"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "traning_region_id": traningRegionId,
        "traning_service_id": traningServiceId,
        "enabled": enabled,
        "start_time": startTime,
        "end_time": endTime,
        "price": price,
        "days": days,
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

class TrainingImage {
  int? id;
  String? traningId;
  String? imagePath;

  TrainingImage({
    this.id,
    this.traningId,
    this.imagePath,
  });

  factory TrainingImage.fromJson(Map<String, dynamic> json) => TrainingImage(
        id: json["id"],
        traningId: json["traning_id"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "traning_id": traningId,
        "image_path": imagePath,
      };
}
