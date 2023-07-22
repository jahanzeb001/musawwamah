// To parse this JSON data, do
//
//     final getMyConnectionResponse = getMyConnectionResponseFromJson(jsonString);

import 'dart:convert';

GetMyConnectionResponse getMyConnectionResponseFromJson(String str) =>
    GetMyConnectionResponse.fromJson(json.decode(str));

String getMyConnectionResponseToJson(GetMyConnectionResponse data) =>
    json.encode(data.toJson());

class GetMyConnectionResponse {
  bool? success;
  String? message;
  List<Datum>? data;

  GetMyConnectionResponse({this.success, this.message, this.data});

  factory GetMyConnectionResponse.fromJson(Map<String, dynamic> json) =>
      GetMyConnectionResponse(
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
  String? deliveryPersonId;
  String? horseId;
  String? dropOff;
  String? pickup;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Horse? horse;

  Datum({
    this.id,
    this.deliveryPersonId,
    this.horseId,
    this.dropOff,
    this.pickup,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.horse,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        deliveryPersonId: json["deliveryPersonId"],
        horseId: json["horseId"],
        dropOff: json["dropOff"],
        pickup: json["pickup"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        horse: json["horse"] == null ? null : Horse.fromJson(json["horse"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deliveryPersonId": deliveryPersonId,
        "horseId": horseId,
        "dropOff": dropOff,
        "pickup": pickup,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "horse": horse?.toJson(),
      };
}

class Horse {
  int? id;
  String? horseSellingType;
  String? horseBackView;
  String? horseFrontView;
  String? horseImageFromLeft;
  String? horseImageFromRight;
  String? moreImages;
  dynamic horseVideo;
  String? horseId;
  String? nameOfHorse;
  String? type;
  dynamic fathersName;
  dynamic mothersName;
  String? monthOfBirth;
  String? yearOfBirth;
  String? age;
  dynamic color;
  String? casuality;
  String? originality;
  String? region;
  dynamic city;
  String? expertOpinionChosen;
  String? expertOpinionAdviceUserId;
  String? expertOpinion;
  String? price;
  String? siteCommision;
  String? expertOpinionPrice;
  String? totalPrice;
  dynamic additionalDescription;
  String? bankName;
  dynamic ibanNumber;
  String? isVaccinated;
  String? haveEvidence;
  String? isSold;
  String? status;
  dynamic timeForAuction;
  dynamic dateForAution;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? userId;
  String? height;
  String? weight;
  String? didHeComplete;
  String? safety;
  String? rejectedByCustomer;
  String? horseNotMatch;
  Seller? seller;
  Purchase? purchase;

  Horse({
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
    this.rejectedByCustomer,
    this.horseNotMatch,
    this.seller,
    this.purchase,
  });

  factory Horse.fromJson(Map<String, dynamic> json) => Horse(
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
        safety: json["safety"],
        rejectedByCustomer: json["rejected_by_customer"],
        horseNotMatch: json["horse_not_match"],
        seller: Seller.fromJson(json["seller"]),
        purchase: Purchase.fromJson(json["purchase"]),
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
        "dateForAution": dateForAution,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "userId": userId,
        "height": height,
        "weight": weight,
        "did_he_complete": didHeComplete,
        "safety": safety,
        "rejected_by_customer": rejectedByCustomer,
        "horse_not_match": horseNotMatch,
        "seller": seller!.toJson(),
        "purchase": purchase!.toJson(),
      };
}

class Purchase {
  int? id;
  String? purchaserId;
  String? horseId;
  Seller? purchaser;

  Purchase({
    this.id,
    this.purchaserId,
    this.horseId,
    this.purchaser,
  });

  factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
        id: json["id"],
        purchaserId: json["purchaserId"],
        horseId: json["horseId"],
        purchaser: Seller.fromJson(json["purchaser"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "purchaserId": purchaserId,
        "horseId": horseId,
        "purchaser": purchaser!.toJson(),
      };
}

class Seller {
  int? id;
  String? mobileNumber;

  Seller({
    this.id,
    this.mobileNumber,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        mobileNumber: json["mobile_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mobile_number": mobileNumber,
      };
}
