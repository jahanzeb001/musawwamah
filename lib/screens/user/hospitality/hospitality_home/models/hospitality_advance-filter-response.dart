// To parse this JSON data, do
//
//     final hospitalityAdvanceFilterResponse = hospitalityAdvanceFilterResponseFromJson(jsonString);

import 'dart:convert';

HospitalityAdvanceFilterResponse hospitalityAdvanceFilterResponseFromJson(
        String str) =>
    HospitalityAdvanceFilterResponse.fromJson(json.decode(str));

String hospitalityAdvanceFilterResponseToJson(
        HospitalityAdvanceFilterResponse data) =>
    json.encode(data.toJson());

class HospitalityAdvanceFilterResponse {
  bool? success;
  String? message;
  List<Region>? region;
  List<Service>? services;

  HospitalityAdvanceFilterResponse({
    this.success,
    this.message,
    this.region,
    this.services,
  });

  factory HospitalityAdvanceFilterResponse.fromJson(
          Map<String, dynamic> json) =>
      HospitalityAdvanceFilterResponse(
        success: json["success"],
        message: json["message"],
        region: json["region"] == null
            ? []
            : List<Region>.from(json["region"]!.map((x) => Region.fromJson(x))),
        services: json["services"] == null
            ? []
            : List<Service>.from(
                json["services"]!.map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "region": region == null
            ? []
            : List<dynamic>.from(region!.map((x) => x.toJson())),
        "services": services == null
            ? []
            : List<dynamic>.from(services!.map((x) => x.toJson())),
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

class Service {
  String? service;
  bool? isServiceSelected;

  Service({
    this.service,
    this.isServiceSelected,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        service: json["service"],
        isServiceSelected: json["is_service_selected"],
      );

  Map<String, dynamic> toJson() => {
        "service": service,
        "is_service_selected": isServiceSelected,
      };
}
