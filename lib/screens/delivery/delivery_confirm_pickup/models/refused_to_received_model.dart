// To parse this JSON data, do
//
//     final refusedByCustomer = refusedByCustomerFromJson(jsonString);

import 'dart:convert';

RefusedByCustomer refusedByCustomerFromJson(String str) =>
    RefusedByCustomer.fromJson(json.decode(str));

String refusedByCustomerToJson(RefusedByCustomer data) =>
    json.encode(data.toJson());

class RefusedByCustomer {
  bool? success;
  String? message;
  Data? data;

  RefusedByCustomer({
    this.success,
    this.message,
    this.data,
  });

  factory RefusedByCustomer.fromJson(Map<String, dynamic> json) =>
      RefusedByCustomer(
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
  String? horseSellingType;
  String? horseBackView;
  String? horseFrontView;
  String? horseImageFromLeft;
  String? horseImageFromRight;
  String? moreImages;
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
  String? region;
  String? city;
  String? expertOpinionChosen;
  String? expertOpinionAdviceUserId;
  String? expertOpinion;
  String? price;
  String? siteCommision;
  String? expertOpinionPrice;
  String? totalPrice;
  String? additionalDescription;
  String? bankName;
  String? ibanNumber;
  String? isVaccinated;
  String? haveEvidence;
  String? isSold;
  String? status;
  dynamic timeForAuction;
  DateTime? dateForAution;
  DateTime? auctionEndTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? userId;
  String? height;
  String? weight;
  String? didHeComplete;
  String? safety;
  int? rejectedByCustomer;
  String? horseNotMatch;

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
    this.auctionEndTime,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.height,
    this.weight,
    this.didHeComplete,
    this.safety,
    this.rejectedByCustomer,
    this.horseNotMatch,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        horseSellingType: json["horseSellingType"],
        horseBackView: json["horseBackView"],
        horseFrontView: json["horseFrontView"],
        horseImageFromLeft: json["horseImageFromLeft"],
        horseImageFromRight: json["horseImageFromRight"],
        moreImages: json["moreImages"],
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
        auctionEndTime: json["auctionEndTime"] == null
            ? null
            : DateTime.parse(json["auctionEndTime"]),
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
        rejectedByCustomer: json["rejected_by_customer"],
        horseNotMatch: json["horse_not_match"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "horseSellingType": horseSellingType,
        "horseBackView": horseBackView,
        "horseFrontView": horseFrontView,
        "horseImageFromLeft": horseImageFromLeft,
        "horseImageFromRight": horseImageFromRight,
        "moreImages": moreImages,
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
        "auctionEndTime": auctionEndTime?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "userId": userId,
        "height": height,
        "weight": weight,
        "did_he_complete": didHeComplete,
        "safety": safety,
        "rejected_by_customer": rejectedByCustomer,
        "horse_not_match": horseNotMatch,
      };
}
