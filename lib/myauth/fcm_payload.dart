import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class FcmPayload {
  static updateUsertoken() async {
    // ignore: unused_local_variable
    String? token = await FirebaseMessaging.instance.getToken();
  }

  ///FCM PAYLOAD
  static sendPushMessage({
    String? appoinmentid,
    String? appoinmentname,
    String? saloonname,
    String? username,
    String? message,
    String? subcriptionid,
  }) async {
    String token = await getToken();

    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'key=AAAANij-7Ag:APA91bG6Ux0RHmtI0RrQgnHWPmzUHq9372bekNIi60B0rulr3Tg3YJEV1_1sGvn3g-_Tomczcd3g8j0v0EwZFm04vhTITLjdpdR5XY7OHR8F4VlaWWxGgRu_riXBnLEk7_o_mA0UMlSb',
      },
      body: jsonEncode(
        <String, dynamic>{
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          "notification": {
            "title": "Obaiah App",
            "android_channel_id": "obaiahapp",
            "body": message ?? " $username",
            // "body": "Your $productname is Expired  $productexpiredate",
          },
          "to": token
        },
      ),
    );
  }
}

Future<String> getToken() async {
  return '';
}
