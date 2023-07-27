import 'package:flutter/material.dart';
import 'package:obaiah_mobile_app/screens/user/add_stable_horse/view/add_stable_horse.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_horses_stable/view/modify_horse.dart';

import '../screens/delivery/account/view/delivery_account_screen.dart';
import '../screens/delivery/delivery_confirm_dropoff/view/delivery_confirm_dropoff_screen.dart';
import '../screens/delivery/delivery_confirm_pickup/view/delivery_confirm_pickup_screen.dart';
import '../screens/delivery/my_deliveries/view/my_delivery_screen.dart';
import '../screens/user/add_new_horse/view/add_new_horse_screen.dart';
import '../screens/user/auth/authentication/view/authentication_screen.dart';
import '../screens/user/auth/on_boarding_screen/view/on_boarding_screen.dart';
import '../screens/user/home/auction_listing/view/auction_listing_screen_view.dart';
import '../screens/user/home/checkout/view/checkout_screen.dart';
import '../screens/user/home/favourites/view/favourites_screen.dart';
import '../screens/user/home/home/view/home_screen_view.dart';
import '../screens/user/home/home_auction/view/home_auction_view.dart';
import '../screens/user/home/regular_listing/view/regular_listing_screen.dart';
import '../screens/user/hospitality/hospitality_home/view/hospitality_home_screen.dart';
import '../screens/user/hospitality/hospitality_listing/view/hospitality_listing_screen.dart';
import '../screens/user/live_auction/view/horse_details.dart';
import '../screens/user/live_auction/view/live_auction_screen.dart';
import '../screens/user/profile/view/user_profile_screen.dart';
import '../screens/user/settings/account/view/account_screen.dart';
import '../screens/user/settings/my_horses_stable/view/my_horses_stable_screeen.dart';
import '../screens/user/settings/my_orders/view/my_orders_screen.dart';
import '../screens/user/settings/my_sold_horses/view/my_sold_horses_screen.dart';
import '../screens/user/settings/profile_settings/view/profile_user.dart';
import '../screens/user/settings/settings_preferences/view/setting_preferences_screen.dart';
import '../screens/user/settings/wallet_portfolio/view/wallet_portfolio_screen.dart';
import '../screens/user/training/training_home/view/training_home_screen.dart';
import '../screens/user/training/training_listing/view/training_listing_screen.dart';
import '../utils/constants/constants.dart';
import '../utils/text_styles/textstyles.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case authentication:
        return MaterialPageRoute(
            builder: (context) => const AuthenticationScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreenView());
      case homeAuctionScreen:
        return MaterialPageRoute(builder: (context) => HomeAuctionView());
      case auctionScreen:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => AuctionListingScreenView(
                  horseId: arguments['horseId'],
                  images: List<String>.from(arguments['images']),
                  remainingTime: arguments['remainingTime'],
                  // homePageModel: arguments['homePageModel'],
                ));
      case listingScreen:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => RegularListingScreen(
                  horseId: arguments['horseId'],
                  horseName: arguments['horseName'],
                  // homePageModel: arguments['homePageModel'],
                ));
      case checkoutScreen:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => CheckoutScreen(
                  homeModel: arguments['homePageModel'],
                ));
      case favoritesScreen:
        return MaterialPageRoute(
            builder: (context) => const FavoritesScreenView());
      case addNewHorseScreen:
        return MaterialPageRoute(builder: (context) => AddNewHorseScreen());
      case liveAuction:
        return MaterialPageRoute(builder: (context) => LiveAuctionScreen());
      case horseDetailsScreen:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => HorseDetailsScreen(
                  homeModel: arguments['homePageModel'],
                ));
      case profileUser:
        return MaterialPageRoute(
            builder: (context) => const UserProfileScreen());
      case settingPreferencesScreen:
        return MaterialPageRoute(
            builder: (context) => const SettingPreferencesScreen());
      case walletPortfolioScreen:
        return MaterialPageRoute(builder: (context) => WalletPortfolioScreen());
      case accountScreen:
        return MaterialPageRoute(builder: (context) => const AccountScreen());
      case addStableHorseScreen:
        return MaterialPageRoute(
            builder: (context) => const AddStableHorseScreen());
      case myHorsesStableScreen:
        return MaterialPageRoute(
            builder: (context) => const MyHorsesStableScreen());
      case myOrdersScreen:
        return MaterialPageRoute(builder: (context) => const MyOrdersScreen());
      case mySoldHorsesScreen:
        return MaterialPageRoute(builder: (context) => MySoldHorsesScreen());
      case profileHorsesScreen:
        return MaterialPageRoute(
            builder: (context) => const ProfileHorsesScreen());
      case hospitalityHomeScreen:
        return MaterialPageRoute(
            builder: (context) => const HospitalityHomeScreen());
      case hospitalityListingScreen:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => HospitalityListingScreen(
                  id: arguments['id'],
                  ownername: arguments['ownername'],
                ));
      case trainingHomeScreen:
        return MaterialPageRoute(
            builder: (context) => const TrainingHomeScreen());
      case trainingListingScreen:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => TrainingListingScreen(
                  id: arguments['id'],
                  ownername: arguments['ownername'],
                ));

      case deliveryAccountScreen:
        return MaterialPageRoute(
            builder: (context) => const DeliveryAccountScreen());
      case myDeliveryScreen:
        return MaterialPageRoute(
            builder: (context) => const MyDeliveryScreen());
      case deliveryConfirmPickupScreen:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => DeliveryConfirmPickupScreen(
                  homeModel: arguments['homeModel'],
                  horseId: arguments['horseId'],
                  sellerPhone: arguments['sellerPhone'],
                  index: arguments['index'],
                  aglino: arguments['aglino'],
                ));
      case deliveryConfirmDropOffScreen:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => DeliveryConfirmDropOffScreen(
                  homePageModel: arguments["homeModel"],
                  horseId: arguments['horseId'],
                  purchaserNumber: arguments['purchaserNumber'],
                  aglino: arguments['aglino'],
                ));

      case modifyHorse:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => ModifiyStableHorse(
                  image: arguments['image'],
                  horseId: arguments['horseId'],
                  nameOfHorse: arguments['nameOfHorse'],
                  fathersName: arguments['fathersName'],
                  type: arguments['type'],
                  mothersName: arguments['mothersName'],
                  monthOfBirth: arguments['monthOfBirth'],
                  yearOfBirth: arguments['yearOfBirth'],
                  age: arguments['age'],
                  color: arguments['color'],
                  casuality: arguments['casuality'],
                  originality: arguments['originality'],
                  region: arguments['region'],
                  city: arguments['city'],
                  siteCommision: arguments['siteCommision'],
                  expertOpinionPrice: arguments['expertOpinionPrice'],
                  totalPrice: arguments['totalPrice'],
                  ibanNumber: arguments['ibanNumber'],

                  // homePageModel: arguments["homeModel"],
                ));
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text(
                      "No Route Defined",
                      style: noRouteDefinedTextStyle,
                    ),
                  ),
                ));
    }
  }
}
