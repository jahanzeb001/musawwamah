// To parse this JSON data, do
//
//     final addNewHorseResponse = addNewHorseResponseFromJson(jsonString);

import 'dart:convert';

AddNewHorseResponse addNewHorseResponseFromJson(String str) =>
    AddNewHorseResponse.fromJson(json.decode(str));

String addNewHorseResponseToJson(AddNewHorseResponse data) =>
    json.encode(data.toJson());

class AddNewHorseResponse {
  bool? success;
  String? message;
  Data? data;

  AddNewHorseResponse({
    this.success,
    this.message,
    this.data,
  });

  factory AddNewHorseResponse.fromJson(Map<String, dynamic> json) =>
      AddNewHorseResponse(
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
  int? userId;
  int? height;
  String? horseSellingType;
  String? horseId;
  String? nameOfHorse;
  String? type;
  String? fathersName;
  String? mothersName;
  String? monthOfBirth;
  String? yearOfBirth;
  int? age;
  String? color;
  String? casuality;
  String? originality;
  String? region;
  String? city;
  int? expertOpinionChosen;
  int? expertOpinionAdviceUserId;
  String? expertOpinion;
  int? price;
  int? siteCommision;
  int? expertOpinionPrice;
  int? totalPrice;
  String? additionalDescription;
  String? bankName;
  String? ibanNumber;
  String? isVaccinated;
  String? haveEvidence;
  int? isSold;
  String? status;
  dynamic timeForAuction;
  dynamic dateForAution;
  String? horseBackView;
  String? horseFrontView;
  String? horseImageFromLeft;
  String? horseImageFromRight;
  dynamic moreImages;
  dynamic horseVideo;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Data({
    this.userId,
    this.height,
    this.horseSellingType,
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
    this.horseBackView,
    this.horseFrontView,
    this.horseImageFromLeft,
    this.horseImageFromRight,
    this.moreImages,
    this.horseVideo,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
        height: json["height"],
        horseSellingType: json["horseSellingType"],
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
        dateForAution: json["dateForAution"],
        horseBackView: json["horseBackView"],
        horseFrontView: json["horseFrontView"],
        horseImageFromLeft: json["horseImageFromLeft"],
        horseImageFromRight: json["horseImageFromRight"],
        moreImages: json["moreImages"],
        horseVideo: json["horseVideo"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "height": height,
        "horseSellingType": horseSellingType,
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
        "dateForAution": dateForAution,
        "horseBackView": horseBackView,
        "horseFrontView": horseFrontView,
        "horseImageFromLeft": horseImageFromLeft,
        "horseImageFromRight": horseImageFromRight,
        "moreImages": moreImages,
        "horseVideo": horseVideo,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
