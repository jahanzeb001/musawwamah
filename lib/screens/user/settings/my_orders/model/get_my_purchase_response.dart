// To parse this JSON data, do
//
//     final getMyPurchasResponse = getMyPurchasResponseFromJson(jsonString);

import 'dart:convert';

GetMyPurchasResponse getMyPurchasResponseFromJson(String str) =>
    GetMyPurchasResponse.fromJson(json.decode(str));

String getMyPurchasResponseToJson(GetMyPurchasResponse data) =>
    json.encode(data.toJson());

class GetMyPurchasResponse {
  bool? success;
  String? message;
  List<Datum>? data;

  GetMyPurchasResponse({
    this.success,
    this.message,
    this.data,
  });

  factory GetMyPurchasResponse.fromJson(Map<String, dynamic> json) =>
      GetMyPurchasResponse(
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
  String? horseNumber;
  int? id;
  String? purchaserId;
  String? horseId;
  String? isPaid;
  String? isDelivered;
  String? acceptedByDeliveryBoy;
  dynamic rejectToDeliverBy;
  String? latitude;
  String? longitude;
  String? sellerId;
  String? pickupAddress;
  String? deliveryAddress;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? horseSellingType;
  String? horseBackView;
  String? horseFrontView;
  String? horseImageFromLeft;
  String? horseImageFromRight;
  String? moreImages;
  String? horseVideo;
  String? nameOfHorse;
  String? type;
  String? fathersName;
  String? mothersName;
  String? monthOfBirth;
  String? yearOfBirth;
  String? age;
  String? color;
  String? casuality;
  String? originality;
  dynamic region;
  String? city;
  String? expertOpinionChosen;
  String? expertOpinionAdviceUserId;
  String? expertOpinion;
  dynamic price;
  String? siteCommision;
  String? expertOpinionPrice;
  String? totalPrice;
  String? additionalDescription;
  String? bankName;
  String? ibanNumber;
  String? isVaccinated;
  String? haveEvidence;
  String? isSold;
  String? timeForAuction;
  DateTime? dateForAution;
  String? userId;
  String? height;
  dynamic fullname;
  dynamic cityOrProvince;
  dynamic languagePreference;
  String? detectLocation;
  String? getAlerts;
  String? darkModeEnabled;
  String? getPromotionalMessages;
  dynamic firebaseMessagingToken;
  String? favourites;
  dynamic idNumber;
  dynamic idPhotoFront;
  dynamic idPhotoBack;
  String? mobileNumber;
  dynamic datumBankName;
  dynamic datumIbanNumber;
  String? accountBalance;
  dynamic userType;
  String? profileImage;
  dynamic userRole;
  dynamic rememberToken;
  dynamic isReviewed;
  dynamic sellername;
  dynamic deliveryboyname;

  Datum({
    this.horseNumber,
    this.id,
    this.purchaserId,
    this.horseId,
    this.isPaid,
    this.isDelivered,
    this.acceptedByDeliveryBoy,
    this.rejectToDeliverBy,
    this.latitude,
    this.longitude,
    this.sellerId,
    this.pickupAddress,
    this.deliveryAddress,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.horseSellingType,
    this.horseBackView,
    this.horseFrontView,
    this.horseImageFromLeft,
    this.horseImageFromRight,
    this.moreImages,
    this.horseVideo,
    this.nameOfHorse,
    this.type,
    this.fathersName,
    this.mothersName,
    this.monthOfBirth,
    this.yearOfBirth,
    this.age,
    this.color,
    this.casuality,
    this.originality,
    this.region,
    this.city,
    this.expertOpinionChosen,
    this.expertOpinionAdviceUserId,
    this.expertOpinion,
    this.price,
    this.siteCommision,
    this.expertOpinionPrice,
    this.totalPrice,
    this.additionalDescription,
    this.bankName,
    this.ibanNumber,
    this.isVaccinated,
    this.haveEvidence,
    this.isSold,
    this.timeForAuction,
    this.dateForAution,
    this.userId,
    this.height,
    this.fullname,
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
    this.datumBankName,
    this.datumIbanNumber,
    this.accountBalance,
    this.userType,
    this.profileImage,
    this.userRole,
    this.rememberToken,
    this.isReviewed,
    this.sellername,
    this.deliveryboyname,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        horseNumber: json["horseNumber"],
        id: json["id"],
        purchaserId: json["purchaserId"],
        horseId: json["horseId"],
        isPaid: json["isPaid"],
        isDelivered: json["isDelivered"],
        acceptedByDeliveryBoy: json["acceptedByDeliveryBoy"],
        rejectToDeliverBy: json["rejectToDeliverBy"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        sellerId: json["sellerId"],
        pickupAddress: json["pickupAddress"],
        deliveryAddress: json["deliveryAddress"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        horseSellingType: json["horseSellingType"],
        horseBackView: json["horseBackView"],
        horseFrontView: json["horseFrontView"],
        horseImageFromLeft: json["horseImageFromLeft"],
        horseImageFromRight: json["horseImageFromRight"],
        moreImages: json["moreImages"],
        horseVideo: json["horseVideo"],
        nameOfHorse: json["nameOfHorse"],
        type: json["type"],
        fathersName: json["fathersName"],
        mothersName: json["mothersName"],
        monthOfBirth: json["monthOfBirth"],
        yearOfBirth: json["yearOfBirth"],
        age: json["age"],
        color: json["color"],
        casuality: json["casuality"],
        originality: json["originality"],
        region: json["region"],
        city: json["city"],
        expertOpinionChosen: json["expertOpinionChosen"],
        expertOpinionAdviceUserId: json["expertOpinionAdviceUserID"],
        expertOpinion: json["expert_opinion"],
        price: json["price"],
        siteCommision: json["siteCommision"],
        expertOpinionPrice: json["expertOpinionPrice"],
        totalPrice: json["totalPrice"],
        additionalDescription: json["additionalDescription"],
        bankName: json["bankName"],
        ibanNumber: json["IbanNumber"],
        isVaccinated: json["isVaccinated"],
        haveEvidence: json["haveEvidence"],
        isSold: json["isSold"],
        timeForAuction: json["timeForAuction"],
        dateForAution: json["dateForAution"] == null
            ? null
            : DateTime.parse(json["dateForAution"]),
        userId: json["userId"],
        height: json["height"],
        fullname: json["fullname"],
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
        datumBankName: json["bank_name"],
        datumIbanNumber: json["iban_number"],
        accountBalance: json["account_balance"],
        userType: json["user_type"],
        profileImage: json["profile_image"],
        userRole: json["user_role"],
        rememberToken: json["remember_token"],
        isReviewed: json["isReviewed"],
        sellername: json["sellerName"],
        deliveryboyname: json["deliveryBoyName"],
      );

  Map<String, dynamic> toJson() => {
        "horseNumber": horseNumber,
        "id": id,
        "purchaserId": purchaserId,
        "horseId": horseId,
        "isPaid": isPaid,
        "isDelivered": isDelivered,
        "acceptedByDeliveryBoy": acceptedByDeliveryBoy,
        "rejectToDeliverBy": rejectToDeliverBy,
        "latitude": latitude,
        "longitude": longitude,
        "sellerId": sellerId,
        "pickupAddress": pickupAddress,
        "deliveryAddress": deliveryAddress,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "horseSellingType": horseSellingType,
        "horseBackView": horseBackView,
        "horseFrontView": horseFrontView,
        "horseImageFromLeft": horseImageFromLeft,
        "horseImageFromRight": horseImageFromRight,
        "moreImages": moreImages,
        "horseVideo": horseVideo,
        "nameOfHorse": nameOfHorse,
        "type": type,
        "fathersName": fathersName,
        "mothersName": mothersName,
        "monthOfBirth": monthOfBirth,
        "yearOfBirth": yearOfBirth,
        "age": age,
        "color": color,
        "casuality": casuality,
        "originality": originality,
        "region": region,
        "city": city,
        "expertOpinionChosen": expertOpinionChosen,
        "expertOpinionAdviceUserID": expertOpinionAdviceUserId,
        "expert_opinion": expertOpinion,
        "price": price,
        "siteCommision": siteCommision,
        "expertOpinionPrice": expertOpinionPrice,
        "totalPrice": totalPrice,
        "additionalDescription": additionalDescription,
        "bankName": bankName,
        "IbanNumber": ibanNumber,
        "isVaccinated": isVaccinated,
        "haveEvidence": haveEvidence,
        "isSold": isSold,
        "timeForAuction": timeForAuction,
        "dateForAution": dateForAution?.toIso8601String(),
        "userId": userId,
        "height": height,
        "fullname": fullname,
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
        "bank_name": datumBankName,
        "iban_number": datumIbanNumber,
        "account_balance": accountBalance,
        "user_type": userType,
        "profile_image": profileImage,
        "user_role": userRole,
        "remember_token": rememberToken,
        "isReviewed": isReviewed,
        "sellerName": sellername,
        "deliveryBoyName": deliveryboyname,
      };
}
