import 'package:http/http.dart' as http;
import 'package:obaiah_mobile_app/screens/user/auth/authentication/model/login_model.dart';
import 'package:obaiah_mobile_app/screens/user/auth/authentication/model/signup_model.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';

class AuthService {
  static Future<dynamic> signup(String phone) async {
    Map data = {"mobile_number": phone};
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.signup}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return signUpResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  ///////////////login

  static Future<dynamic> login(String phone) async {
    Map data = {"mobile_number": phone};
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.login}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return loginResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
