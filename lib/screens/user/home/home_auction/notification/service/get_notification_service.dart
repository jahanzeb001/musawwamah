import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/user/home/auction_listing/model/add_biding_horse_model.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../model/get_notification_response.dart';

class GetNotificationService {
  static Future<dynamic> getNotification(uid) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.getAuctionNotification}/$uid";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        return getNotificationResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

////////////////////////add bid horse

  static Future<dynamic> addBidingHorse(int hid) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.addBidHorse}/$hid";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        return addBidingHorseResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
