import 'package:obaiah_mobile_app/screens/delivery/delivery_home/model/delivery_account_response.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class MyDeliveryAccountService {
  static Future<dynamic> mydeliveryAccount(int uid) async {
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
}
