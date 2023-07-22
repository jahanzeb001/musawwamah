// To parse this JSON data, do
//
//     final getTraningResponse = getTraningResponseFromJson(jsonString);

import 'dart:convert';

GetTraningResponse getTraningResponseFromJson(String str) =>
    GetTraningResponse.fromJson(json.decode(str));

String getTraningResponseToJson(GetTraningResponse data) =>
    json.encode(data.toJson());

class GetTraningResponse {
  bool? success;
  String? message;
  List<Datum>? data;

  GetTraningResponse({
    this.success,
    this.message,
    this.data,
  });

  factory GetTraningResponse.fromJson(Map<String, dynamic> json) =>
      GetTraningResponse(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? image;
  String? trainerUserId;
  String? regionId;
  dynamic rating;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<TrainingImage>? trainingImages;
  User? user;
  Region? region;

  Datum({
    this.id,
    this.image,
    this.trainerUserId,
    this.regionId,
    this.rating,
    this.createdAt,
    this.updatedAt,
    this.trainingImages,
    this.user,
    this.region,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        image: json["image"],
        trainerUserId: json["trainer_user_id"],
        regionId: json["region_id"],
        rating: json["rating"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        trainingImages: List<TrainingImage>.from(
            json["training_images"].map((x) => TrainingImage.fromJson(x))),
        user: User.fromJson(json["user"]),
        region: Region.fromJson(json["region"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "trainer_user_id": trainerUserId,
        "region_id": regionId,
        "rating": rating,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "training_images":
            List<dynamic>.from(trainingImages!.map((x) => x.toJson())),
        "user": user!.toJson(),
        "region": region!.toJson(),
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "services": List<dynamic>.from(services!.map((x) => x.toJson())),
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "pivot": pivot!.toJson(),
      };
}

enum Name { HORSEBACK_RIDING, JUMP_OBSTACLES }

final nameValues = EnumValues({
  "Horseback Riding": Name.HORSEBACK_RIDING,
  "Jump Obstacles": Name.JUMP_OBSTACLES
});

class Pivot {
  String? traningRegionId;
  String? traningServiceId;
  String? enabled;
  String? startTime;
  String? endTime;
  String? price;
  DateTime? createdAt;
  DateTime? updatedAt;

  Pivot({
    this.traningRegionId,
    this.traningServiceId,
    this.enabled,
    this.startTime,
    this.endTime,
    this.price,
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "traning_region_id": traningRegionId,
        "traning_service_id": traningServiceId,
        "enabled": enabled,
        "start_time": startTime,
        "end_time": endTime,
        "price": price,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
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

class User {
  int? id;
  String? fullname;
  dynamic region;
  dynamic cityOrProvince;
  dynamic languagePreference;
  String? detectLocation;
  String? getAlerts;
  String? darkModeEnabled;
  String? getPromotionalMessages;
  dynamic firebaseMessagingToken;
  dynamic favourites;
  dynamic idNumber;
  dynamic idPhotoFront;
  dynamic idPhotoBack;
  String? mobileNumber;
  dynamic bankName;
  dynamic ibanNumber;
  String? accountBalance;
  dynamic userType;
  dynamic userRole;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic profileImage;

  User({
    this.id,
    this.fullname,
    this.region,
    this.cityOrProvince,
    this.languagePreference,
    this.detectLocation,
    this.getAlerts,
    this.darkModeEnabled,
    this.getPromotionalMessages,
    this.firebaseMessagingToken,
    this.favourites,
    this.idNumber,
    this.idPhotoFront,
    this.idPhotoBack,
    this.mobileNumber,
    this.bankName,
    this.ibanNumber,
    this.accountBalance,
    this.userType,
    this.userRole,
    this.createdAt,
    this.updatedAt,
    this.profileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullname: json["fullname"],
        region: json["region"],
        cityOrProvince: json["city_or_province"],
        languagePreference: json["language_preference"],
        detectLocation: json["detect_location"],
        getAlerts: json["getAlerts"],
        darkModeEnabled: json["darkModeEnabled"],
        getPromotionalMessages: json["getPromotionalMessages"],
        firebaseMessagingToken: json["firebaseMessagingToken"],
        favourites: json["favourites"],
        idNumber: json["id_number"],
        idPhotoFront: json["id_photo_front"],
        idPhotoBack: json["id_photo_back"],
        mobileNumber: json["mobile_number"],
        bankName: json["bank_name"],
        ibanNumber: json["iban_number"],
        accountBalance: json["account_balance"],
        userType: json["user_type"],
        userRole: json["user_role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "region": region,
        "city_or_province": cityOrProvince,
        "language_preference": languagePreference,
        "detect_location": detectLocation,
        "getAlerts": getAlerts,
        "darkModeEnabled": darkModeEnabled,
        "getPromotionalMessages": getPromotionalMessages,
        "firebaseMessagingToken": firebaseMessagingToken,
        "favourites": favourites,
        "id_number": idNumber,
        "id_photo_front": idPhotoFront,
        "id_photo_back": idPhotoBack,
        "mobile_number": mobileNumber,
        "bank_name": bankName,
        "iban_number": ibanNumber,
        "account_balance": accountBalance,
        "user_type": userType,
        "user_role": userRole,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "profile_image": profileImage,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
