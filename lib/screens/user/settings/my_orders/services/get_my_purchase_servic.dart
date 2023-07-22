import 'package:http/http.dart' as http;
import 'package:obaiah_mobile_app/screens/user/settings/my_orders/model/get_my_purchase_response.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';

class GetMyPurchaseService {
  static Future<dynamic> getMyPurchase(int uid) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.getMyPurchase}/$uid";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        return getMyPurchasResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
