import 'dart:convert';

import 'package:obaiah_mobile_app/screens/delivery/my_deliveries/models/my_deliver_model.dart';
import 'package:obaiah_mobile_app/screens/delivery/my_deliveries/models/reject_connection_model.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class MyDeliverService {
  static Future<dynamic> getMyConnections(int deliveryAcctId) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.getMyConnections}/$deliveryAcctId";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        return getMyConnectionResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  ////////////////////////reject connection
  static Future<dynamic> rejectConnections(
      int deliveryPersonId, int horseId) async {
    Map data = {"horseId": horseId, "deliveryPersonId": deliveryPersonId};
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.rejectConnections}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return rejectonnectionResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  ////////////////////////accept connection
  static Future<dynamic> acceptConnections(
      int deliveryPersonId, int horseId) async {
    Map data = {"horseId": horseId, "deliveryPersonId": deliveryPersonId};
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.acceptConnections}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return jsonEncode(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
