import 'package:http/http.dart' as http;
import 'package:obaiah_mobile_app/screens/user/settings/my_sold_horses/model/get_my_sales_response.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';

class GetMySalesService {
  static Future<dynamic> getMySales(int uid) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.getMySales}/$uid";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        return getMySalesResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
