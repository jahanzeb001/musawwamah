// To parse this JSON data, do
//
//     final getApprovedHorsesResponse = getApprovedHorsesResponseFromJson(jsonString);

import 'dart:convert';

GetApprovedHorsesResponse getApprovedHorsesResponseFromJson(String str) =>
    GetApprovedHorsesResponse.fromJson(json.decode(str));

String getApprovedHorsesResponseToJson(GetApprovedHorsesResponse data) =>
    json.encode(data.toJson());

class GetApprovedHorsesResponse {
  bool? success;
  String? message;
  List<Datum>? data;

  GetApprovedHorsesResponse({
    this.success,
    this.message,
    this.data,
  });

  factory GetApprovedHorsesResponse.fromJson(Map<String, dynamic> json) =>
      GetApprovedHorsesResponse(
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
  dynamic moreImages;
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
  Casuality? casuality;
  Originality? originality;
  Region? region;
  String? city;
  String? expertOpinionChosen;
  String? expertOpinionAdviceUserId;
  String? expertOpinion;
  String? price;
  String? siteCommision;
  String? expertOpinionPrice;
  String? totalPrice;
  String? additionalDescription;
  BankName? bankName;
  String? ibanNumber;
  String? isVaccinated;
  String? haveEvidence;
  String? isSold;
  Status? status;
  dynamic timeForAuction;
  dynamic dateForAution;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? userId;
  String? height;
  String? weight;
  String? didHeComplete;
  Safety? safety;
  User? user;

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
    this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        horseSellingType: horseSellingTypeValues.map[json["horseSellingType"]]!,
        horseBackView: json["horseBackView"],
        horseFrontView: json["horseFrontView"],
        horseImageFromLeft: json["horseImageFromLeft"],
        horseImageFromRight: json["horseImageFromRight"],
        moreImages: json["moreImages"],
        horseVideo: json["horseVideo"],
        horseId: json["horseId"],
        nameOfHorse: json["nameOfHorse"],
        type: json["type"]!,
        fathersName: json["fathersName"],
        mothersName: json["mothersName"],
        monthOfBirth: json["monthOfBirth"],
        yearOfBirth: json["yearOfBirth"],
        age: json["age"],
        color: json["color"],
        casuality: casualityValues.map[json["casuality"]]!,
        originality: originalityValues.map[json["originality"]]!,
        region: regionValues.map[json["region"]]!,
        city: json["city"],
        expertOpinionChosen: json["expertOpinionChosen"],
        expertOpinionAdviceUserId: json["expertOpinionAdviceUserID"],
        expertOpinion: json["expert_opinion"],
        price: json["price"],
        siteCommision: json["siteCommision"],
        expertOpinionPrice: json["expertOpinionPrice"],
        totalPrice: json["totalPrice"],
        additionalDescription: json["additionalDescription"],
        bankName: bankNameValues.map[json["bankName"]]!,
        ibanNumber: json["IbanNumber"],
        isVaccinated: json["isVaccinated"],
        haveEvidence: json["haveEvidence"],
        isSold: json["isSold"],
        status: statusValues.map[json["status"]]!,
        timeForAuction: json["timeForAuction"],
        dateForAution: json["dateForAution"],
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
        safety: safetyValues.map[json["safety"]]!,
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "horseSellingType": horseSellingTypeValues.reverse[horseSellingType],
        "horseBackView": horseBackView,
        "horseFrontView": horseFrontView,
        "horseImageFromLeft": horseImageFromLeft,
        "horseImageFromRight": horseImageFromRight,
        "moreImages": moreImages,
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
        "region": regionValues.reverse[region],
        "city": city,
        "expertOpinionChosen": expertOpinionChosen,
        "expertOpinionAdviceUserID": expertOpinionAdviceUserId,
        "expert_opinion": expertOpinion,
        "price": price,
        "siteCommision": siteCommision,
        "expertOpinionPrice": expertOpinionPrice,
        "totalPrice": totalPrice,
        "additionalDescription": additionalDescription,
        "bankName": bankNameValues.reverse[bankName],
        "IbanNumber": ibanNumber,
        "isVaccinated": isVaccinated,
        "haveEvidence": haveEvidence,
        "isSold": isSold,
        "status": statusValues.reverse[status],
        "timeForAuction": timeForAuction,
        "dateForAution": dateForAution,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "userId": userId,
        "height": height,
        "weight": weight,
        "did_he_complete": didHeComplete,
        "safety": safetyValues.reverse[safety],
        "user": user?.toJson(),
      };
}

enum BankName { SAUDI_BANK, BANK_NAME }

final bankNameValues = EnumValues(
    {"bank name": BankName.BANK_NAME, "saudi bank": BankName.SAUDI_BANK});

enum Casuality { INJURED, SALIM, CASUALITY_SALIM }

final casualityValues = EnumValues({
  "Salim": Casuality.CASUALITY_SALIM,
  "injured": Casuality.INJURED,
  "salim": Casuality.SALIM
});

enum HorseSellingType { FIXED }

final horseSellingTypeValues = EnumValues({"Fixed": HorseSellingType.FIXED});

enum Originality { ARABIC, ORIGINALITY_ARABIC, HYBRID }

final originalityValues = EnumValues({
  "arabic": Originality.ARABIC,
  "hybrid": Originality.HYBRID,
  "Arabic": Originality.ORIGINALITY_ARABIC
});

enum Region { ABC, RIAZ }

final regionValues = EnumValues({"abc": Region.ABC, "Riaz": Region.RIAZ});

enum Safety { UNCHECKED }

final safetyValues = EnumValues({"Unchecked": Safety.UNCHECKED});

enum Status { PENDING }

final statusValues = EnumValues({"Pending": Status.PENDING});

enum Type { KHEL, MARE }

final typeValues = EnumValues({"khel": Type.KHEL, "mare": Type.MARE});

class User {
  int? id;
  String? fullname;
  BankNameEnum? region;
  CityOrProvince? cityOrProvince;
  dynamic languagePreference;
  String? detectLocation;
  String? getAlerts;
  String? darkModeEnabled;
  String? getPromotionalMessages;
  dynamic firebaseMessagingToken;
  Favourites? favourites;
  String? idNumber;
  IdPhotoFront? idPhotoFront;
  IdPhotoBack? idPhotoBack;
  String? mobileNumber;
  BankNameEnum? bankName;
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
        region: bankNameEnumValues.map[json["region"]],
        cityOrProvince: cityOrProvinceValues.map[json["city_or_province"]],
        languagePreference: json["language_preference"],
        detectLocation: json["detect_location"],
        getAlerts: json["getAlerts"],
        darkModeEnabled: json["darkModeEnabled"],
        getPromotionalMessages: json["getPromotionalMessages"],
        firebaseMessagingToken: json["firebaseMessagingToken"],
        favourites: favouritesValues.map[json["favourites"]],
        idNumber: json["id_number"],
        idPhotoFront: idPhotoFrontValues.map[json["id_photo_front"]],
        idPhotoBack: idPhotoBackValues.map[json["id_photo_back"]],
        mobileNumber: json["mobile_number"],
        bankName: bankNameEnumValues.map[json["bank_name"]],
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
        "fullname": fullnameValues.reverse[fullname],
        "region": bankNameEnumValues.reverse[region],
        "city_or_province": cityOrProvinceValues.reverse[cityOrProvince],
        "language_preference": languagePreference,
        "detect_location": detectLocation,
        "getAlerts": getAlerts,
        "darkModeEnabled": darkModeEnabled,
        "getPromotionalMessages": getPromotionalMessages,
        "firebaseMessagingToken": firebaseMessagingToken,
        "favourites": favouritesValues.reverse[favourites],
        "id_number": idNumber,
        "id_photo_front": idPhotoFrontValues.reverse[idPhotoFront],
        "id_photo_back": idPhotoBackValues.reverse[idPhotoBack],
        "mobile_number": mobileNumber,
        "bank_name": bankNameEnumValues.reverse[bankName],
        "iban_number": ibanNumber,
        "account_balance": accountBalance,
        "user_type": userType,
        "user_role": userRole,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "profile_image": profileImage,
      };
}

enum BankNameEnum { NULL, EMPTY }

final bankNameEnumValues =
    EnumValues({"بنك الرياض": BankNameEnum.EMPTY, "null": BankNameEnum.NULL});

enum CityOrProvince { JADDAH }

final cityOrProvinceValues = EnumValues({"jaddah": CityOrProvince.JADDAH});

enum Favourites { THE_1511413746, THE_94, THE_48606063 }

final favouritesValues = EnumValues({
  "[15,11,41,37,46]": Favourites.THE_1511413746,
  "[48,60,60,63]": Favourites.THE_48606063,
  "[94]": Favourites.THE_94
});

enum Fullname { RIAZ, HANZLA, SHAHBAZ, WADOOD }

final fullnameValues = EnumValues({
  "Hanzla": Fullname.HANZLA,
  "riaz": Fullname.RIAZ,
  "shahbaz": Fullname.SHAHBAZ,
  "Wadood": Fullname.WADOOD
});

enum IdPhotoBack {
  IMAGES_USER_ID_PHOTOS_C_FC7_ZQ_I3_6460_C286_CAC3_F_JPEG,
  IMAGES_USER_ID_PHOTOS_OB_EAX_K_LR_646_B597816_B8_F_JPEG,
  IMAGES_USER_ID_PHOTOS_IF_W1_JG7_R_6468_C477551_A9_JPEG
}

final idPhotoBackValues = EnumValues({
  "images/user_id_photos/cFc7ZqI3__6460c286cac3f.jpeg":
      IdPhotoBack.IMAGES_USER_ID_PHOTOS_C_FC7_ZQ_I3_6460_C286_CAC3_F_JPEG,
  "images/user_id_photos/ifW1JG7r__6468c477551a9.jpeg":
      IdPhotoBack.IMAGES_USER_ID_PHOTOS_IF_W1_JG7_R_6468_C477551_A9_JPEG,
  "images/user_id_photos/ObEaxKLr__646b597816b8f.jpeg":
      IdPhotoBack.IMAGES_USER_ID_PHOTOS_OB_EAX_K_LR_646_B597816_B8_F_JPEG
});

enum IdPhotoFront {
  IMAGES_USER_ID_PHOTOS_Q_G_GS_SG_ET_6460_C286_CA919_JPEG,
  IMAGES_USER_ID_PHOTOS_E9_FQRE3_H_646_B597816883_JPEG,
  IMAGES_USER_ID_PHOTOS_JWLS4_ON_R_6468_C4775508_D_JPEG
}

final idPhotoFrontValues = EnumValues({
  "images/user_id_photos/E9FQRE3H__646b597816883.jpeg":
      IdPhotoFront.IMAGES_USER_ID_PHOTOS_E9_FQRE3_H_646_B597816883_JPEG,
  "images/user_id_photos/JWLS4onR__6468c4775508d.jpeg":
      IdPhotoFront.IMAGES_USER_ID_PHOTOS_JWLS4_ON_R_6468_C4775508_D_JPEG,
  "images/user_id_photos/qGGsSGEt__6460c286ca919.jpeg":
      IdPhotoFront.IMAGES_USER_ID_PHOTOS_Q_G_GS_SG_ET_6460_C286_CA919_JPEG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}



/////////////////////second model
