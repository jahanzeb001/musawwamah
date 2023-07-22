import 'package:obaiah_mobile_app/screens/user/home/checkout/model/buy_horse_response.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class ChackOutService {
  ///////////////////////////////////////add to fav
  static Future<dynamic> buyHorse(int purchaserId, int sellerId, int horseId,
      String pickupAdd, String deliveryAdd) async {
    Map data = {
      "purchaserId": purchaserId,
      "sellerId": sellerId,
      "horseId": horseId,
      "pickupAddress": pickupAdd,
      "deliveryAddress": deliveryAdd
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.buyHorse}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return buyHorseResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
