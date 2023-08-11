import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/add_stable_horse/controller/add_stable_horse_controller.dart';

import '../Payments/thanku_controller.dart';
import '../screens/delivery/account/controller/delivery_account_controller.dart';
import '../screens/delivery/delivery_confirm_dropoff/controller/delivery_confirm_dropoff_controller.dart';
import '../screens/delivery/delivery_confirm_pickup/controller/delivery_confirm_pickup_controller.dart';
import '../screens/delivery/delivery_home/controller/delivery_home_controller.dart';
import '../screens/delivery/my_deliveries/controller/my_deliveries_controller.dart';
import '../screens/user/add_new_horse/controller/add_new_horse_controller.dart';
import '../screens/user/auth/authentication/controller/authentication_controller.dart';
import '../screens/user/auth/on_boarding_screen/controller/onBoardingController.dart';
import '../screens/user/home/auction_listing/controller/auction_controller.dart';
import '../screens/user/home/checkout/controller/checkout_controller.dart';
import '../screens/user/home/favourites/controller/favourites_controller.dart';
import '../screens/user/home/home/controller/home_screen_controller.dart';
import '../screens/user/home/home_auction/controller/home_auction_controller.dart';
import '../screens/user/home/home_auction/notification/controller/auction_notification_controller.dart';
import '../screens/user/home/regular_listing/controller/listing_controller.dart';
import '../screens/user/hospitality/hospitality_home/controller/hospitality_home_controller.dart';
import '../screens/user/hospitality/hospitality_listing/controller/hospitality_listing_controller.dart';
import '../screens/user/live_auction/controller/live_auction_controller.dart';
import '../screens/user/profile/controller/profile_user_horses_controller.dart';
import '../screens/user/settings/account/controller/account_controller.dart';
import '../screens/user/settings/my_horses_stable/controller/my_horses_stable_controller.dart';
import '../screens/user/settings/my_orders/controller/my_orders_controller.dart';
import '../screens/user/settings/my_sold_horses/controller/my_sold_horses_controller.dart';
import '../screens/user/settings/profile_settings/controller/profile_controller.dart';
import '../screens/user/settings/settings_preferences/controller/setting_preferences_controller.dart';
import '../screens/user/settings/wallet_portfolio/controller/wallet_portfolio_controller.dart';
import '../screens/user/training/training_home/controller/training_home_controller.dart';
import '../screens/user/training/training_listing/controller/training_listing_controller.dart';
import '../utils/get_storage/get_storage_controller.dart';

class InitializingDependency implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => OnBoardingController(),
      fenix: true,
    );
    Get.lazyPut(
      () => AuthenticationController(),
      fenix: true,
    );
    Get.lazyPut(
      () => GetStorageController(),
      fenix: true,
    );
    Get.lazyPut(
      () => HomeScreenController(),
      fenix: true,
    );
    Get.lazyPut(
      () => FavouritesController(),
      fenix: true,
    );
    Get.lazyPut(
      () => RegularListingController(),
      fenix: true,
    );
    Get.lazyPut(
      () => HomeAuctionController(),
      fenix: true,
    );
    Get.lazyPut(
      () => CheckoutController(),
      fenix: true,
    );
    Get.lazyPut(
      () => AuctionController(),
      fenix: true,
    );

    Get.lazyPut(
      () => AddNewHorseController(),
      fenix: true,
    );
    Get.lazyPut(
      () => LiveAuctionController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ProfileController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SettingPreferencesController(),
      fenix: true,
    );

    Get.lazyPut(
      () => AddStableHorseController(),
      fenix: true,
    );

    Get.lazyPut(
      () => AccountController(),
      fenix: true,
    );
    Get.lazyPut(
      () => MyHorsesStableController(),
      fenix: true,
    );
    Get.lazyPut(
      () => MyOrdersController(),
      fenix: true,
    );
    Get.lazyPut(
      () => MySoldHorsesController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ProfileUserHorsesController(),
      fenix: true,
    );
    Get.lazyPut(
      () => HospitalityHomeController(),
      fenix: true,
    );
    Get.lazyPut(
      () => HospitalityListingController(),
      fenix: true,
    );
    Get.lazyPut(
      () => TrainingHomeController(),
      fenix: true,
    );
    Get.lazyPut(
      () => TrainingListingController(),
      fenix: true,
    );
    Get.lazyPut(
      () => DeliveryHomeController(),
      fenix: true,
    );

    Get.lazyPut(
      () => DeliveryAccountController(),
      fenix: true,
    );
    Get.lazyPut(
      () => MyDeliveriesController(),
      fenix: true,
    );
    Get.lazyPut(
      () => DeliveryConfirmPickUpController(),
      fenix: true,
    );
    Get.lazyPut(
      () => DeliveryConfirmDropOffController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ThankuScreenController(),
      fenix: true,
    );
    Get.lazyPut(
      () => NotificationAuctionController(),
      fenix: true,
    );
    Get.lazyPut(
      () => WalletPortfolioController(),
      fenix: true,
    );
  }
}
