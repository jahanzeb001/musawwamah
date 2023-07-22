// ignore_for_file: unnecessary_type_check

import 'dart:io';

import 'package:obaiah_mobile_app/screens/delivery/delivery_confirm_pickup/models/delivery_confirm_pickup_model.dart';
import 'package:obaiah_mobile_app/screens/delivery/my_deliveries/models/reject_connection_model.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class DeliverConformPivkupService {
  ////////////////////////horse ot match
  static Future<dynamic> horseDidnotMatch(
      int deliveryPersonId, int horseId) async {
    Map data = {"horseId": 92, "deliveryPersonId": deliveryPersonId};
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.horsenotmatch}/$horseId";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        print('our response  ${res.body.toString()}');
        return rejectonnectionResponseFromJson(res.body);
      } else {
        return rejectonnectionResponseFromJson(res.body);
      }
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> customerRefusedToReceived(
      int deliveryPersonId, int horseId) async {
    Map data = {"horseId": 92, "deliveryPersonId": deliveryPersonId};
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.refusebycustomer}/$horseId";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        print(res.body.toString());
        return res;
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  ///////////////////////////////////////
  static Future<dynamic> deliveryConfirmPickup(
      {File? horseImageFromRight,
      File? horseImageFromLeft,
      File? horseFrontView,
      File? notesImage,
      File? horseBackView,
      File? horseVideo}) async {
    try {
      final url = "${AppUrls.baseUrl}${AppUrls.uploadImagesPickup}";
      final request = http.MultipartRequest('POST', Uri.parse(url));
      print(url);
      request.files.add(await http.MultipartFile.fromPath(
          'horseFrontView', horseFrontView!.path));
      request.files.add(await http.MultipartFile.fromPath(
          'horseBackView', horseBackView!.path));
      request.files.add(await http.MultipartFile.fromPath(
          'horseImageFromLeft', horseImageFromLeft!.path));
      request.files.add(await http.MultipartFile.fromPath(
          'horseImageFromRight', horseImageFromRight!.path));

      request.files.add(
          await http.MultipartFile.fromPath('notesImage', notesImage!.path));
      request.files.add(
          await http.MultipartFile.fromPath('horseVideo', horseVideo!.path));

      final response = await request.send().then(http.Response.fromStream);
      print(response);
      if (response is http.Response) {
        return deliveryConfirmPickupResponseFromJson(response.body);

        // Handle the response body...
      } else {
        print('File upload failed. Status code: ${response.statusCode}');
        return response;
      }
    } catch (e) {
      return e;
      // Handle the error...
    }
  }

  ////////////////////////////////////////////

  static Future<dynamic> confirmPickup(
      {int? horseId,
      String? horseImageFromRight,
      String? horseImageFromLeft,
      String? horseFrontView,
      String? notesImage,
      String? horseBackView,
      String? horseVideo,
      String? notes}) async {
    Map data = {
      "horseId": horseId,
      "horseImageFromRight": horseImageFromRight,
      "horseImageFromLeft": horseImageFromLeft,
      "horseFrontView": horseFrontView,
      "notesImage": notesImage,
      "horseBackView": horseBackView,
      "horseVideo": horseVideo,
      "notes": notes,
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.confirmPickup}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return confirmPickupResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
