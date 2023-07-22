import 'package:http/http.dart' as http;
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';

import '../../services/get_my_wallet_response.dart';

class GetMyWalletService {
  static Future<dynamic> getMydeleveryWallet(int uid) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.getMyDelWalletDetails}/$uid";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        return getMyWalletResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
