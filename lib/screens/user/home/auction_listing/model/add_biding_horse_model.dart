// To parse this JSON data, do
//
//     final addBidingHorseResponse = addBidingHorseResponseFromJson(jsonString);

import 'dart:convert';

AddBidingHorseResponse addBidingHorseResponseFromJson(String str) =>
    AddBidingHorseResponse.fromJson(json.decode(str));

String addBidingHorseResponseToJson(AddBidingHorseResponse data) =>
    json.encode(data.toJson());

class AddBidingHorseResponse {
  bool? success;
  String? message;
  Highestbid? highestbid;
  Autioninfo? autioninfo;
  Opinion? opinion;
  Data? data;
  int? sales;
  int? ratting;

  AddBidingHorseResponse({
    this.success,
    this.message,
    this.highestbid,
    this.autioninfo,
    this.opinion,
    this.data,
    this.sales,
    this.ratting,
  });

  factory AddBidingHorseResponse.fromJson(Map<String, dynamic> json) =>
      AddBidingHorseResponse(
        success: json["success"],
        message: json["message"],
        highestbid: json["highestbid"] == null
            ? null
            : Highestbid.fromJson(json["highestbid"]),
        autioninfo: json["autioninfo"] == null
            ? null
            : Autioninfo.fromJson(json["autioninfo"]),
        opinion:
            json["opinion"] == null ? null : Opinion.fromJson(json["opinion"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        sales: json["sales"],
        ratting: json["ratting"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "highestbid": highestbid?.toJson(),
        "autioninfo": autioninfo?.toJson(),
        "opinion": opinion?.toJson(),
        "data": data?.toJson(),
        "sales": sales,
        "ratting": ratting,
      };
}

class Autioninfo {
  DateTime? auctionDate;
  String? auctionTime;
  String? remainingTime;
  int? isAuctionPassed;

  Autioninfo({
    this.auctionDate,
    this.auctionTime,
    this.remainingTime,
    this.isAuctionPassed,
  });

  factory Autioninfo.fromJson(Map<String, dynamic> json) => Autioninfo(
        auctionDate: json["auction_date"] == null
            ? null
            : DateTime.parse(json["auction_date"]),
        auctionTime: json["auction_time"],
        remainingTime: json["remaining_time"],
        isAuctionPassed: json["is_auction_passed"],
      );

  Map<String, dynamic> toJson() => {
        "auction_date": auctionDate?.toIso8601String(),
        "auction_time": auctionTime,
        "remaining_time": remainingTime,
        "is_auction_passed": isAuctionPassed,
      };
}

class Data {
  int? id;
  String? horseSellingType;
  String? horseBackView;
  String? horseFrontView;
  String? horseImageFromLeft;
  String? horseImageFromRight;
  List<String>? moreImages;
  String? horseVideo;
  String? horseId;
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
  String? price;
  String? siteCommision;
  String? expertOpinionPrice;
  dynamic totalPrice;
  String? additionalDescription;
  dynamic bankName;
  String? ibanNumber;
  String? isVaccinated;
  String? haveEvidence;
  String? isSold;
  String? status;
  String? timeForAuction;
  DateTime? dateForAution;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? userId;
  String? height;
  String? weight;
  String? didHeComplete;
  String? safety;
  User? user;

  Data({
    this.id,
    this.horseSellingType,
    this.horseBackView,
    this.horseFrontView,
    this.horseImageFromLeft,
    this.horseImageFromRight,
    this.moreImages,
    this.horseVideo,
    this.horseId,
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
    this.status,
    this.timeForAuction,
    this.dateForAution,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.height,
    this.weight,
    this.didHeComplete,
    this.safety,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        horseSellingType: json["horseSellingType"],
        horseBackView: json["horseBackView"],
        horseFrontView: json["horseFrontView"],
        horseImageFromLeft: json["horseImageFromLeft"],
        horseImageFromRight: json["horseImageFromRight"],
        moreImages: json["moreImages"] == null
            ? []
            : List<String>.from(json["moreImages"]!.map((x) => x)),
        horseVideo: json["horseVideo"],
        horseId: json["horseId"],
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
        status: json["status"],
        timeForAuction: json["timeForAuction"],
        dateForAution: json["dateForAution"] == null
            ? null
            : DateTime.parse(json["dateForAution"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        userId: json["userId"],
        height: json["height"],
        weight: json["weight"],
        didHeComplete: json["did_he_complete"],
        safety: json["safety"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "horseSellingType": horseSellingType,
        "horseBackView": horseBackView,
        "horseFrontView": horseFrontView,
        "horseImageFromLeft": horseImageFromLeft,
        "horseImageFromRight": horseImageFromRight,
        "moreImages": moreImages == null
            ? []
            : List<dynamic>.from(moreImages!.map((x) => x)),
        "horseVideo": horseVideo,
        "horseId": horseId,
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
        "status": status,
        "timeForAuction": timeForAuction,
        "dateForAution": dateForAution?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "userId": userId,
        "height": height,
        "weight": weight,
        "did_he_complete": didHeComplete,
        "safety": safety,
        "user": user?.toJson(),
      };
}

class User {
  int? id;
  dynamic fullname;
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "profile_image": profileImage,
      };
}

class Highestbid {
  int? horseId;
  String? fullname;
  String? amount;

  Highestbid({
    this.horseId,
    this.fullname,
    this.amount,
  });

  factory Highestbid.fromJson(Map<String, dynamic> json) => Highestbid(
        horseId: json["horseId"],
        fullname: json["fullname"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "horseId": horseId,
        "fullname": fullname,
        "amount": amount,
      };
}

class Opinion {
  int? id;
  String? userId;
  String? price;
  String? percentage;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? userpicture;

  Opinion({
    this.id,
    this.userId,
    this.price,
    this.percentage,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.userpicture,
  });

  factory Opinion.fromJson(Map<String, dynamic> json) => Opinion(
        id: json["id"],
        userId: json["user_id"],
        price: json["price"],
        percentage: json["percentage"],
        description: json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        userpicture: json["userpicture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "price": price,
        "percentage": percentage,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "userpicture": userpicture,
      };
}
