import 'dart:developer';

import 'package:obaiah_mobile_app/screens/user/home/auction_listing/model/add_biding_horse_model.dart';
import 'package:obaiah_mobile_app/screens/user/home/auction_listing/model/add_insurance_model.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class AuctionListingService {
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

  /////////////////////add bidd

  static Future<dynamic> addBid(int hid, int uid, int amount) async {
    Map data = {
      "horseId": hid,
      "userId": uid,
      "amount": amount,
      "status": true
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.addBid}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        log(res.body);
        return res.body;
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  //////////////////add insurance
  static Future<dynamic> addInsurance(int amount, int uid) async {
    Map data = {"amount": amount, "userId": uid, "source": ''};
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.addInsurance}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return addInsuranceResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
