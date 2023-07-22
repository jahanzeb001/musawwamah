// To parse this JSON data, do
//
//     final deliveryAccountResponse = deliveryAccountResponseFromJson(jsonString);

import 'dart:convert';

DeliveryAccountResponse deliveryAccountResponseFromJson(String str) =>
    DeliveryAccountResponse.fromJson(json.decode(str));

String deliveryAccountResponseToJson(DeliveryAccountResponse data) =>
    json.encode(data.toJson());

class DeliveryAccountResponse {
  bool? success;
  String? message;
  Data? data;

  DeliveryAccountResponse({
    this.success,
    this.message,
    this.data,
  });

  factory DeliveryAccountResponse.fromJson(Map<String, dynamic> json) =>
      DeliveryAccountResponse(
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
  DeliveryAccount? deliveryAccount;
  DeliveryAccount? user;

  Data({
    this.deliveryAccount,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        deliveryAccount: json["delivery_account"] == null
            ? null
            : DeliveryAccount.fromJson(json["delivery_account"]),
        user: json["user"] == null
            ? null
            : DeliveryAccount.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "delivery_account": deliveryAccount?.toJson(),
        "user": user?.toJson(),
      };
}

class DeliveryAccount {
  int? id;
  String? userId;
  String? fullname;
  String? region;
  dynamic cityOrProvince;
  dynamic deliveryPersonId;
  dynamic languagePreference;
  String? detectLocation;
  String? getAlerts;
  String? darkModeEnabled;
  String? getPromotionalMessages;
  dynamic firebaseMessagingToken;
  String? idNumber;
  String? idPhotoFront;
  String? idPhotoBack;
  String? mobileNumber;
  String? bankName;
  String? ibanNumber;
  List<String>? ordersAcceptanceRegionList;
  String? accountBalance;
  dynamic userType;
  dynamic userRole;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic profileImage;
  String? favourites;

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
    this.profileImage,
    this.favourites,
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
        ordersAcceptanceRegionList: json["ordersAcceptanceRegionList"] == null
            ? []
            : List<String>.from(
                json["ordersAcceptanceRegionList"]!.map((x) => x)),
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
        favourites: json["favourites"],
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
        "ordersAcceptanceRegionList": ordersAcceptanceRegionList == null
            ? []
            : List<dynamic>.from(ordersAcceptanceRegionList!.map((x) => x)),
        "account_balance": accountBalance,
        "user_type": userType,
        "user_role": userRole,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "profile_image": profileImage,
        "favourites": favourites,
      };
}
