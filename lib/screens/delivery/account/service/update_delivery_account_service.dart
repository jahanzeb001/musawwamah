import 'package:obaiah_mobile_app/screens/delivery/account/model/update_delivery_account_model.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class UpdateDeliveryAccountService {
  static Future<dynamic> updateUser2(
      {int? userId,
      String? fullname,
      String? region,
      dynamic cityOrProvince,
      String? idNumber,
      String? idPhotoFront,
      String? idPhotoBack,
      String? mobileNumber,
      String? bankName,
      String? ibanNumber,
      List<String>? ordersAcceptanceRegionList}) async {
    Map data = {
      "userId": userId,
      "fullname": fullname,
      "region": region,
      "city_or_province": cityOrProvince,
      "id_number": idNumber,
      "id_photo_front": idPhotoFront,
      "id_photo_back": idPhotoBack,
      "mobile_number": mobileNumber,
      "bank_name": bankName,
      "iban_number": ibanNumber,
      "ordersAcceptanceRegionList": ordersAcceptanceRegionList,
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.updateProfile}/$userId";
      var res = await BaseClientClass.put(url, data);

      if (res is http.Response) {
        return updateDeliveryAccountResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
