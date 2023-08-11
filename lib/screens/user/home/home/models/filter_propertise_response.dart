// To parse this JSON data, do
//
//     final propertiseFIlterResponse = propertiseFIlterResponseFromJson(jsonString);

import 'dart:convert';

PropertiseFIlterResponse propertiseFIlterResponseFromJson(String str) =>
    PropertiseFIlterResponse.fromJson(json.decode(str));

String propertiseFIlterResponseToJson(PropertiseFIlterResponse data) =>
    json.encode(data.toJson());

class PropertiseFIlterResponse {
  bool? success;
  String? message;
  List<Type>? type;
  List<Region>? region;
  List<Horseage>? horseage;
  List<Horsecolor>? horsecolor;
  List<Casuality>? casuality;
  List<Originality>? originality;

  PropertiseFIlterResponse({
    this.success,
    this.message,
    this.type,
    this.region,
    this.horseage,
    this.horsecolor,
    this.casuality,
    this.originality,
  });

  factory PropertiseFIlterResponse.fromJson(Map<String, dynamic> json) =>
      PropertiseFIlterResponse(
        success: json["success"],
        message: json["message"],
        type: json["type"] == null
            ? []
            : List<Type>.from(json["type"]!.map((x) => Type.fromJson(x))),
        region: json["region"] == null
            ? []
            : List<Region>.from(json["region"]!.map((x) => Region.fromJson(x))),
        horseage: json["horseage"] == null
            ? []
            : List<Horseage>.from(
                json["horseage"]!.map((x) => Horseage.fromJson(x))),
        horsecolor: json["horsecolor"] == null
            ? []
            : List<Horsecolor>.from(
                json["horsecolor"]!.map((x) => Horsecolor.fromJson(x))),
        casuality: json["casuality"] == null
            ? []
            : List<Casuality>.from(
                json["casuality"]!.map((x) => Casuality.fromJson(x))),
        originality: json["originality"] == null
            ? []
            : List<Originality>.from(
                json["originality"]!.map((x) => Originality.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "type": type == null
            ? []
            : List<dynamic>.from(type!.map((x) => x.toJson())),
        "region": region == null
            ? []
            : List<dynamic>.from(region!.map((x) => x.toJson())),
        "horseage": horseage == null
            ? []
            : List<dynamic>.from(horseage!.map((x) => x.toJson())),
        "horsecolor": horsecolor == null
            ? []
            : List<dynamic>.from(horsecolor!.map((x) => x.toJson())),
        "casuality": casuality == null
            ? []
            : List<dynamic>.from(casuality!.map((x) => x.toJson())),
        "originality": originality == null
            ? []
            : List<dynamic>.from(originality!.map((x) => x.toJson())),
      };
}

class Casuality {
  String? casuality;
  bool? isCasualitySelected;

  Casuality({
    this.casuality,
    this.isCasualitySelected,
  });

  factory Casuality.fromJson(Map<String, dynamic> json) => Casuality(
        casuality: json["casuality"],
        isCasualitySelected: json["is_casuality_selected"],
      );

  Map<String, dynamic> toJson() => {
        "casuality": casuality,
        "is_casuality_selected": isCasualitySelected,
      };
}

class Horseage {
  String? horseage;
  bool? isHorseageSelected;

  Horseage({
    this.horseage,
    this.isHorseageSelected,
  });

  factory Horseage.fromJson(Map<String, dynamic> json) => Horseage(
        horseage: json["horseage"],
        isHorseageSelected: json["is_horseage_selected"],
      );

  Map<String, dynamic> toJson() => {
        "horseage": horseage,
        "is_horseage_selected": isHorseageSelected,
      };
}

class Horsecolor {
  String? color;
  bool? isColorSelected;

  Horsecolor({
    this.color,
    this.isColorSelected,
  });

  factory Horsecolor.fromJson(Map<String, dynamic> json) => Horsecolor(
        color: json["color"],
        isColorSelected: json["is_color_selected"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "is_color_selected": isColorSelected,
      };
}

class Originality {
  String? originality;
  bool? isOriginalitySelected;

  Originality({
    this.originality,
    this.isOriginalitySelected,
  });

  factory Originality.fromJson(Map<String, dynamic> json) => Originality(
        originality: json["originality"],
        isOriginalitySelected: json["is_originality_selected"],
      );

  Map<String, dynamic> toJson() => {
        "originality": originality,
        "is_originality_selected": isOriginalitySelected,
      };
}

class Region {
  String? region;
  bool? isRegionSelected;

  Region({
    this.region,
    this.isRegionSelected,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        region: json["region"],
        isRegionSelected: json["is_region_selected"],
      );

  Map<String, dynamic> toJson() => {
        "region": region,
        "is_region_selected": isRegionSelected,
      };
}

class Type {
  String? type;
  bool? isTypeSelected;

  Type({
    this.type,
    this.isTypeSelected,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        type: json["type"],
        isTypeSelected: json["is_type_selected"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "is_type_selected": isTypeSelected,
      };
}
