import 'package:obaiah_mobile_app/screens/delivery/my_deliveries/models/reject_connection_model.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class DeliverConformPivkupService {
  ////////////////////////horse ot match
  static Future<dynamic> horseDidnotMatch(
      int deliveryPersonId, int horseId) async {
    Map data = {"horseId": 92, "deliveryPersonId": deliveryPersonId};
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.horsenotmatch}/$horseId";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        print('our response  ${res.body.toString()}');
        return rejectonnectionResponseFromJson(res.body);
      } else {
        return rejectonnectionResponseFromJson(res.body);
      }
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> customerRefusedToReceived(
      int deliveryPersonId, int horseId) async {
    Map data = {"horseId": 92, "deliveryPersonId": deliveryPersonId};
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.refusebycustomer}/$horseId";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        print(res.body.toString());
        return res;
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
