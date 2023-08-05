// To parse this JSON data, do
//
//     final trainingFilterPropertiseResponse = trainingFilterPropertiseResponseFromJson(jsonString);

import 'dart:convert';

TrainingFilterPropertiseResponse trainingFilterPropertiseResponseFromJson(String str) => TrainingFilterPropertiseResponse.fromJson(json.decode(str));

String trainingFilterPropertiseResponseToJson(TrainingFilterPropertiseResponse data) => json.encode(data.toJson());

class TrainingFilterPropertiseResponse {
    bool? success;
    String? message;
    List<Region>? region;
    List<Type>? type;
    List<Sex>? sex;

    TrainingFilterPropertiseResponse({
        this.success,
        this.message,
        this.region,
        this.type,
        this.sex,
    });

    factory TrainingFilterPropertiseResponse.fromJson(Map<String, dynamic> json) => TrainingFilterPropertiseResponse(
        success: json["success"],
        message: json["message"],
        region: json["region"] == null ? [] : List<Region>.from(json["region"]!.map((x) => Region.fromJson(x))),
        type: json["type"] == null ? [] : List<Type>.from(json["type"]!.map((x) => Type.fromJson(x))),
        sex: json["sex"] == null ? [] : List<Sex>.from(json["sex"]!.map((x) => Sex.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "region": region == null ? [] : List<dynamic>.from(region!.map((x) => x.toJson())),
        "type": type == null ? [] : List<dynamic>.from(type!.map((x) => x.toJson())),
        "sex": sex == null ? [] : List<dynamic>.from(sex!.map((x) => x.toJson())),
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

class Sex {
    String? sex;
    bool? isSexSelected;

    Sex({
        this.sex,
        this.isSexSelected,
    });

    factory Sex.fromJson(Map<String, dynamic> json) => Sex(
        sex: json["sex"],
        isSexSelected: json["is_sex_selected"],
    );

    Map<String, dynamic> toJson() => {
        "sex": sex,
        "is_sex_selected": isSexSelected,
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
