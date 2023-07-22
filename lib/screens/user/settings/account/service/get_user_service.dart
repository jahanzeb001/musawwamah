import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:obaiah_mobile_app/screens/user/settings/account/model/get_user_response.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';

class UserService {
  static Future<dynamic> getUser(int uid) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.getUser}/$uid";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        log(res.body);
        return getUserResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  ///////////////////////////update user Model

  static Future<dynamic> updateUser(
      int uid,
      String name,
      String id,
      String region,
      String city,
      String mobile,
      String bankName,
      String iban,
      String idback,
      String idFront) async {
    Map data = {
      "fullname": name,
      "city": city,
      "bank_name": bankName,
      "region": region,
      "iban_number": iban,
      "mobile_number": mobile,
      "id_number": id,
      "id_photo_back": idback,
      "id_photo_front": idFront
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.updateProfile}/$uid";
      var res = await BaseClientClass.put(url, data);

      if (res is http.Response) {
        return getUserResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> updateUser2(
    int uid,
    String name,
    String id,
    String region,
    String city,
    String mobile,
    String bankName,
    String iban,
  ) async {
    Map data = {
      "fullname": name,
      "city": city,
      "bank_name": bankName,
      "region": region,
      "iban_number": iban,
      "mobile_number": mobile,
      "id_number": id,
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.updateProfile}/$uid";
      var res = await BaseClientClass.put(url, data);

      if (res is http.Response) {
        return getUserResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  ////////////////update settings
  static Future<dynamic> updateAppSettings(
      int uid,
      String areAlertOn,
      String areDarkenMode,
      String isPromotionMessagingOn,
      String isLocationServicesOn) async {
    Map data = {
      "detect_location": isLocationServicesOn,
      "getAlerts": areAlertOn,
      "darkModeEnabled": areDarkenMode,
      "getPromotionalMessages": isPromotionMessagingOn
    };

    try {
      var url = "${AppUrls.baseUrl}${AppUrls.getUser}/$uid";
      var res = await BaseClientClass.put(url, data);

      if (res is http.Response) {
        return getUserResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
