import 'package:obaiah_mobile_app/screens/user/home/auction_listing/model/add_biding_horse_model.dart';
import 'package:obaiah_mobile_app/screens/user/home/home_auction/model/get_bidding_horse_response.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class GetBidingService {
  static Future<dynamic> getBidingHorse() async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.getBidingHorse}";
      var res = await BaseClientClass.post(url, "");

      if (res is http.Response) {
        return getBidingHorseResponseFromJson(res.body);
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
