import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/routes/app_routes.dart';
import 'package:obaiah_mobile_app/translations/translations.dart';
import 'package:obaiah_mobile_app/utils/constants/constants.dart';
import 'package:obaiah_mobile_app/utils/themes/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'bindings/initializing_dependencies.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'myauth/notifications_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  await NotificationService.intializeServices();
  //** Notification Services */

  String? refreshedToken = await FirebaseMessaging.instance.getToken();
  log(refreshedToken.toString());

  //logout();
  bool isLogged = GetStorage().read('isLogin') ?? false;
  bool areDarkenThem = GetStorage().read("areDarkModeOn") ?? false;
  print("*********************$isLogged");

  print("*********************$areDarkenThem");
  runApp(ObaiahApp(
    isLoggedIn: isLogged,
    isDarkenThem: areDarkenThem,
  ));
}

class ObaiahApp extends StatefulWidget {
  final bool? isLoggedIn;
  final bool? isDarkenThem;
  const ObaiahApp({super.key, this.isLoggedIn, this.isDarkenThem});

  @override
  State<ObaiahApp> createState() => _ObaiahAppState();
}

class _ObaiahAppState extends State<ObaiahApp> {
  final NotificationService notificationService = NotificationService();

  User? uid = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        _handleNotification(message);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNotification(message);
    });
  }

  void _handleNotification(RemoteMessage message) {
    String? payload = message.data['payload'];
    print('Received notification: ${message.notification?.body}');
    print('Payload: $payload');

    // Show the notification using Flutter Local Notifications
    notificationService.showNotification(
      title: message.notification?.title ?? 'Notification',
      body: message.notification?.body ?? 'Empty notification',
      payload: payload,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: Translation(),
        // By Default
        locale: const Locale("en", "US"),
        //To Get Device Locale Get.deviceLocale
        // locale: Get.deviceLocale,
        fallbackLocale: const Locale("en", "US"),
        title: 'Obaiah Mobile App',
        initialBinding: InitializingDependency(),
        debugShowCheckedModeBanner: false,
        theme:
            widget.isDarkenThem == true ? Themes.darkTheme : Themes.lightTheme,
        // darkTheme: Themes.darkTheme,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: uid != null ? homeScreen : onBoardingScreen
        //widget.isLoggedIn! ? homeScreen : onBoardingScreen,
        );
  }
}
