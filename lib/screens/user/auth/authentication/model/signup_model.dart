// To parse this JSON data, do
//
//     final signUpResponse = signUpResponseFromJson(jsonString);

import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) =>
    SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
  bool? success;
  String? message;
  Data? data;

  SignUpResponse({
    this.success,
    this.message,
    this.data,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
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
  DeliveryAccount? user;
  DeliveryAccount? deliveryAccount;

  Data({
    this.user,
    this.deliveryAccount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null
            ? null
            : DeliveryAccount.fromJson(json["user"]),
        deliveryAccount: json["delivery_account"] == null
            ? null
            : DeliveryAccount.fromJson(json["delivery_account"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "delivery_account": deliveryAccount?.toJson(),
      };
}

class DeliveryAccount {
  int? id;
  String? userId;
  dynamic fullname;
  dynamic region;
  dynamic cityOrProvince;
  dynamic deliveryPersonId;
  dynamic languagePreference;
  String? detectLocation;
  String? getAlerts;
  String? darkModeEnabled;
  String? getPromotionalMessages;
  dynamic firebaseMessagingToken;
  dynamic idNumber;
  dynamic idPhotoFront;
  dynamic idPhotoBack;
  String? mobileNumber;
  dynamic bankName;
  dynamic ibanNumber;
  dynamic ordersAcceptanceRegionList;
  String? accountBalance;
  dynamic userType;
  dynamic userRole;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic favourites;
  String? profileImage;

  DeliveryAccount({
    this.id,
    this.userId,
    this.fullname,
    this.region,
    this.cityOrProvince,
    this.deliveryPersonId,
    this.languagePreference,
    this.detectLocation,
    this.getAlerts,
    this.darkModeEnabled,
    this.getPromotionalMessages,
    this.firebaseMessagingToken,
    this.idNumber,
    this.idPhotoFront,
    this.idPhotoBack,
    this.mobileNumber,
    this.bankName,
    this.ibanNumber,
    this.ordersAcceptanceRegionList,
    this.accountBalance,
    this.userType,
    this.userRole,
    this.createdAt,
    this.updatedAt,
    this.favourites,
    this.profileImage,
  });

  factory DeliveryAccount.fromJson(Map<String, dynamic> json) =>
      DeliveryAccount(
        id: json["id"],
        userId: json["userId"],
        fullname: json["fullname"],
        region: json["region"],
        cityOrProvince: json["city_or_province"],
        deliveryPersonId: json["deliveryPersonId"],
        languagePreference: json["language_preference"],
        detectLocation: json["detect_location"],
        getAlerts: json["getAlerts"],
        darkModeEnabled: json["darkModeEnabled"],
        getPromotionalMessages: json["getPromotionalMessages"],
        firebaseMessagingToken: json["firebaseMessagingToken"],
        idNumber: json["id_number"],
        idPhotoFront: json["id_photo_front"],
        idPhotoBack: json["id_photo_back"],
        mobileNumber: json["mobile_number"],
        bankName: json["bank_name"],
        ibanNumber: json["iban_number"],
        ordersAcceptanceRegionList: json["ordersAcceptanceRegionList"],
        accountBalance: json["account_balance"],
        userType: json["user_type"],
        userRole: json["user_role"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        favourites: json["favourites"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "fullname": fullname,
        "region": region,
        "city_or_province": cityOrProvince,
        "deliveryPersonId": deliveryPersonId,
        "language_preference": languagePreference,
        "detect_location": detectLocation,
        "getAlerts": getAlerts,
        "darkModeEnabled": darkModeEnabled,
        "getPromotionalMessages": getPromotionalMessages,
        "firebaseMessagingToken": firebaseMessagingToken,
        "id_number": idNumber,
        "id_photo_front": idPhotoFront,
        "id_photo_back": idPhotoBack,
        "mobile_number": mobileNumber,
        "bank_name": bankName,
        "iban_number": ibanNumber,
        "ordersAcceptanceRegionList": ordersAcceptanceRegionList,
        "account_balance": accountBalance,
        "user_type": userType,
        "user_role": userRole,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "favourites": favourites,
        "profile_image": profileImage,
      };
}
