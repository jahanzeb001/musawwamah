// To parse this JSON data, do
//
//     final deleteHorseResponse = deleteHorseResponseFromJson(jsonString);

import 'dart:convert';

DeleteHorseResponse deleteHorseResponseFromJson(String str) =>
    DeleteHorseResponse.fromJson(json.decode(str));

String deleteHorseResponseToJson(DeleteHorseResponse data) =>
    json.encode(data.toJson());

class DeleteHorseResponse {
  bool? success;
  String? message;
  Data? data;

  DeleteHorseResponse({
    this.success,
    this.message,
    this.data,
  });

  factory DeleteHorseResponse.fromJson(Map<String, dynamic> json) =>
      DeleteHorseResponse(
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
  String? fullname;
  String? region;
  dynamic cityOrProvince;
  dynamic languagePreference;
  String? detectLocation;
  String? getAlerts;
  String? darkModeEnabled;
  String? getPromotionalMessages;
  dynamic firebaseMessagingToken;
  Map<String, int>? favourites;
  String? idNumber;
  String? idPhotoFront;
  dynamic idPhotoBack;
  String? mobileNumber;
  dynamic bankName;
  String? ibanNumber;
  String? accountBalance;
  dynamic userType;
  dynamic userRole;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? profileImage;

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        favourites: Map.from(json["favourites"]!)
            .map((k, v) => MapEntry<String, int>(k, v)),
        idNumber: json["id_number"],
        idPhotoFront: json["id_photo_front"],
        idPhotoBack: json["id_photo_back"],
        mobileNumber: json["mobile_number"],
        bankName: json["bank_name"],
        ibanNumber: json["iban_number"],
        accountBalance: json["account_balance"],
        userType: json["user_type"],
        userRole: json["user_role"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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
        "favourites": Map.from(favourites!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "id_number": idNumber,
        "id_photo_front": idPhotoFront,
        "id_photo_back": idPhotoBack,
        "mobile_number": mobileNumber,
        "bank_name": bankName,
        "iban_number": ibanNumber,
        "account_balance": accountBalance,
        "user_type": userType,
        "user_role": userRole,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "profile_image": profileImage,
      };
}
