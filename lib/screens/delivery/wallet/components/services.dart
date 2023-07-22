import 'dart:convert';

import 'package:obaiah_mobile_app/screens/delivery/delivery_home/model/delivery_account_response.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class GetDeliveryAccountServices {
  static Future<dynamic> deliveryAccount(int uid) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.getMyDelWalletDetails}/$uid";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        return deliveryAccountResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  static Future<List<Data>> fetchData(int uid) async {
    var url = "${AppUrls.baseUrl}${AppUrls.getMyDelWalletDetails}/$uid";
    final response = await BaseClientClass.get(url, "");
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Data.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  static Future<List<dynamic>> fetchUsers(int uid) async {
    var url = "${AppUrls.baseUrl}${AppUrls.getMyDelWalletDetails}/$uid";
    final response = await BaseClientClass.get(url, "");
    return json.decode(response.body)['results'];
  }
}
