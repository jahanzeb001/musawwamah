import 'package:obaiah_mobile_app/screens/delivery/delivery_confirm_dropoff/models/confirm_drop_off_model.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class ConfirmDropOffService {
  static Future<dynamic> confirmDropOff(
      {int? horseId,
      String? horseImageFromRight,
      String? horseImageFromLeft,
      String? horseFrontView,
      String? notesImage,
      String? horseBackView,
      String? horseVideo,
      String? signature,
      String? notes}) async {
    Map data = {
      "horseId": horseId,
      "horseImageFromRight": horseImageFromRight,
      "horseImageFromLeft": horseImageFromLeft,
      "horseFrontView": horseFrontView,
      "notesImage": notesImage,
      "horseBackView": horseBackView,
      "horseVideo": horseVideo,
      "notes": notes,
      "signature": signature
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.confirmDropOff}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return confirmDropOffResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
