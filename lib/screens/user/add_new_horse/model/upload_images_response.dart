// To parse this JSON data, do
//
//     final addImagesResponse = addImagesResponseFromJson(jsonString);

import 'dart:convert';

AddImagesResponse addImagesResponseFromJson(String str) =>
    AddImagesResponse.fromJson(json.decode(str));

String addImagesResponseToJson(AddImagesResponse data) =>
    json.encode(data.toJson());

class AddImagesResponse {
  bool? success;
  String? message;
  String? horseImageFromRight;
  String? horseImageFromLeft;
  String? horseFrontView;
  String? horseBackView;
  List<dynamic>? moreImages;
  String? horseVideo;

  AddImagesResponse({
    this.success,
    this.message,
    this.horseImageFromRight,
    this.horseImageFromLeft,
    this.horseFrontView,
    this.horseBackView,
    this.moreImages,
    this.horseVideo,
  });

  factory AddImagesResponse.fromJson(Map<String, dynamic> json) =>
      AddImagesResponse(
        success: json["success"],
        message: json["message"],
        horseImageFromRight: json["horseImageFromRight"],
        horseImageFromLeft: json["horseImageFromLeft"],
        horseFrontView: json["horseFrontView"],
        horseBackView: json["horseBackView"],
        moreImages: json["more_images"] == null
            ? []
            : List<dynamic>.from(json["more_images"]!.map((x) => x)),
        horseVideo: json["horseVideo"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "horseImageFromRight": horseImageFromRight,
        "horseImageFromLeft": horseImageFromLeft,
        "horseFrontView": horseFrontView,
        "horseBackView": horseBackView,
        "more_images": moreImages == null
            ? []
            : List<dynamic>.from(moreImages!.map((x) => x)),
        "horseVideo": horseVideo,
      };
}
