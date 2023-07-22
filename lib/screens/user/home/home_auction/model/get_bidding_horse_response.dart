// To parse this JSON data, do
//
//     final getBidingHorseResponse = getBidingHorseResponseFromJson(jsonString);

import 'dart:convert';

GetBidingHorseResponse getBidingHorseResponseFromJson(String str) =>
    GetBidingHorseResponse.fromJson(json.decode(str));

String getBidingHorseResponseToJson(GetBidingHorseResponse data) =>
    json.encode(data.toJson());

class GetBidingHorseResponse {
  bool? success;
  String? message;
  List<Datum>? data;

  GetBidingHorseResponse({
    this.success,
    this.message,
    this.data,
  });

  factory GetBidingHorseResponse.fromJson(Map<String, dynamic> json) =>
      GetBidingHorseResponse(
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
  HorseSellingType? horseSellingType;
  String? horseBackView;
  String? horseFrontView;
  String? horseImageFromLeft;
  String? horseImageFromRight;
  MoreImages? moreImages;
  dynamic horseVideo;
  String? horseId;
  String? nameOfHorse;
  Type? type;
  String? fathersName;
  String? mothersName;
  String? monthOfBirth;
  String? yearOfBirth;
  String? age;
  String? color;
  Casuality? casuality;
  Originality? originality;
  dynamic region;
  City? city;
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
  Status? status;
  String? timeForAuction;
  DateTime? dateForAution;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? userId;
  String? height;
  String? weight;
  String? didHeComplete;
  Safety? safety;
  String? timeLeft;
  String? maxBid;
  User? user;
  List<Bid>? bids;

  Datum({
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
    this.timeLeft,
    this.maxBid,
    this.user,
    this.bids,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        horseSellingType: horseSellingTypeValues.map[json["horseSellingType"]],
        horseBackView: json["horseBackView"],
        horseFrontView: json["horseFrontView"],
        horseImageFromLeft: json["horseImageFromLeft"],
        horseImageFromRight: json["horseImageFromRight"],
        moreImages: moreImagesValues.map[json["moreImages"]],
        horseVideo: json["horseVideo"],
        horseId: json["horseId"],
        nameOfHorse: json["nameOfHorse"],
        type: typeValues.map[json["type"]],
        fathersName: json["fathersName"],
        mothersName: json["mothersName"],
        monthOfBirth: json["monthOfBirth"],
        yearOfBirth: json["yearOfBirth"],
        age: json["age"],
        color: json["color"],
        casuality: casualityValues.map[json["casuality"]],
        originality: originalityValues.map[json["originality"]],
        region: json["region"],
        city: cityValues.map[json["city"]],
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
        status: statusValues.map[json["status"]],
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
        safety: safetyValues.map[json["safety"]],
        timeLeft: json["time_left"],
        maxBid: json["max_bid"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        bids: json["bids"] == null
            ? []
            : List<Bid>.from(json["bids"]!.map((x) => Bid.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "horseSellingType": horseSellingTypeValues.reverse[horseSellingType],
        "horseBackView": horseBackView,
        "horseFrontView": horseFrontView,
        "horseImageFromLeft": horseImageFromLeft,
        "horseImageFromRight": horseImageFromRight,
        "moreImages": moreImagesValues.reverse[moreImages],
        "horseVideo": horseVideo,
        "horseId": horseId,
        "nameOfHorse": nameOfHorse,
        "type": typeValues.reverse[type],
        "fathersName": fathersName,
        "mothersName": mothersName,
        "monthOfBirth": monthOfBirth,
        "yearOfBirth": yearOfBirth,
        "age": age,
        "color": color,
        "casuality": casualityValues.reverse[casuality],
        "originality": originalityValues.reverse[originality],
        "region": region,
        "city": cityValues.reverse[city],
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
        "status": statusValues.reverse[status],
        "timeForAuction": timeForAuction,
        "dateForAution": dateForAution?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "userId": userId,
        "height": height,
        "weight": weight,
        "did_he_complete": didHeComplete,
        "safety": safetyValues.reverse[safety],
        "time_left": timeLeft,
        "max_bid": maxBid,
        "user": user?.toJson(),
        "bids": bids == null
            ? []
            : List<dynamic>.from(bids!.map((x) => x.toJson())),
      };
}

class Bid {
  int? id;
  String? horseId;
  String? userId;
  String? amount;
  DateTime? createdAt;
  DateTime? updatedAt;

  Bid({
    this.id,
    this.horseId,
    this.userId,
    this.amount,
    this.createdAt,
    this.updatedAt,
  });

  factory Bid.fromJson(Map<String, dynamic> json) => Bid(
        id: json["id"],
        horseId: json["horseId"],
        userId: json["userId"],
        amount: json["amount"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "horseId": horseId,
        "userId": userId,
        "amount": amount,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum Casuality { INJURED, SALIM }

final casualityValues =
    EnumValues({"injured": Casuality.INJURED, "salim": Casuality.SALIM});

enum City { JADDAH, JJHH, AL_SALAM }

final cityValues = EnumValues(
    {"Al Salam": City.AL_SALAM, "jaddah": City.JADDAH, "jjhh": City.JJHH});

enum HorseSellingType { BIDDING }

final horseSellingTypeValues =
    EnumValues({"Bidding": HorseSellingType.BIDDING});

enum MoreImages { NULL }

final moreImagesValues = EnumValues({"null": MoreImages.NULL});

enum Originality { ARABIC, HYBRID }

final originalityValues =
    EnumValues({"arabic": Originality.ARABIC, "hybrid": Originality.HYBRID});

enum Safety { UNCHECKED }

final safetyValues = EnumValues({"Unchecked": Safety.UNCHECKED});

enum Status { APPROVED, PENDING }

final statusValues =
    EnumValues({"Approved": Status.APPROVED, "Pending": Status.PENDING});

enum Type { KHEL }

final typeValues = EnumValues({"khel": Type.KHEL});

class User {
  int? id;
  String? fullname;
  MoreImages? region;
  dynamic cityOrProvince;
  dynamic languagePreference;
  String? detectLocation;
  String? getAlerts;
  String? darkModeEnabled;
  String? getPromotionalMessages;
  dynamic firebaseMessagingToken;
  String? favourites;
  String? idNumber;
  String? idPhotoFront;
  String? idPhotoBack;
  String? mobileNumber;
  MoreImages? bankName;
  String? ibanNumber;
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
        region: moreImagesValues.map[json["region"]],
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
        bankName: moreImagesValues.map[json["bank_name"]],
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
        "region": moreImagesValues.reverse[region],
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
        "bank_name": moreImagesValues.reverse[bankName],
        "iban_number": ibanNumber,
        "account_balance": accountBalance,
        "user_type": userType,
        "user_role": userRole,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
