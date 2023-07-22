// ignore_for_file: unnecessary_type_check

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:obaiah_mobile_app/screens/user/add_new_horse/model/upload_images_response.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_horses_stable/model/add_to_sale_model.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_horses_stable/model/modify_horse_response.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_horses_stable/model/my_horse_stable_model.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';

class MyHorseStableService {
  static Future<dynamic> myHorseStable(int uid) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.getUserHorses}/$uid";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        return myHorseStableResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  /////////////////////////////add to sal
  static Future<dynamic> addToSale(int hid) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.addToSale}/$hid";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        return addToSaleStableResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  ////////////////////////////modify horse

  static Future<dynamic> modifyHorse(
      {int? hid,
      String? nameOfHorse,
      String? type,
      String? fathersName,
      String? mothersName,
      String? monthOfBirth,
      String? yearOfBirth,
      int? age,
      String? color,
      String? casuality,
      String? originality,
      dynamic region,
      String? city,
      dynamic siteCommision,
      dynamic expertOpinionPrice,
      dynamic totalPrice,
      String? ibanNumber,
      String? horseBackView,
      String? horseFrontView,
      String? horseImageFromLeft,
      String? horseImageFromRight}) async {
    Map data = {
      "nameOfHorse ": nameOfHorse,
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
      "siteCommision": siteCommision,
      "expertOpinionPrice": expertOpinionPrice,
      "totalPrice": totalPrice,
      "ibanNumber": ibanNumber,
      "horseBackView": horseBackView,
      "horseFrontView": horseFrontView,
      "horseImageFromLeft": horseImageFromLeft,
      "horseImageFromRight": horseImageFromRight,
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.modifyHorse}/$hid";
      var res = await BaseClientClass.put(url, data);

      if (res is http.Response) {
        return modifyHorseResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  //////////////////////////////////////////////
  static Future<dynamic> uploadFiles(
    File file1,
    File file2,
    File file3,
    File file4,
  ) async {
    try {
      final url = "${AppUrls.baseUrl}${AppUrls.uplaodImages}";
      final request = http.MultipartRequest('POST', Uri.parse(url));
      print(url);
      request.files
          .add(await http.MultipartFile.fromPath('horseFrontView', file1.path));
      request.files
          .add(await http.MultipartFile.fromPath('horseBackView', file2.path));
      request.files.add(
          await http.MultipartFile.fromPath('horseImageFromLeft', file3.path));
      request.files.add(
          await http.MultipartFile.fromPath('horseImageFromRight', file4.path));

      final response = await request.send().then(http.Response.fromStream);
      print(response);
      if (response is http.Response) {
        return addImagesResponseFromJson(response.body);

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
}
