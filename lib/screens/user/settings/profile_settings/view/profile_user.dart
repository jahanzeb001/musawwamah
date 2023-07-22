import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_bottom_appbar.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/reusable_button.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/spacing/padding.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../../../../delivery/delivery_home/view/delivery_home_screen.dart';
import '../../wallet_portfolio/controller/wallet_portfolio_controller.dart';
import '../components/profile_components.dart';
import '../controller/profile_controller.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final walletPortfolioController = Get.find<WalletPortfolioController>();
  String userbalance = '';
  void initState() {
    walletPortfolioController.getUserId();
    final box = GetStorage();

    setState(() {
      userbalance = box.read('accbal').toString();
      log(userbalance);
    });
    // TODO: implement initState
    super.initState();
    //walletPortfolioController.getMyWallet(walletPortfolioController.userId!);
  }

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr),
        titleTextStyle: black718,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: padA10,
        height: context.height * 1,
        width: context.width * 1,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              gapH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(() {
                    return CupertinoSwitch(
                      value: profileController.isDeliveryBoyMode.value,
                      onChanged: (value) {
                        profileController.toggleUseAndDeliveryBoy(
                            toggleValue: value);
                      },
                      thumbColor: profileController.isDeliveryBoyMode.value
                          ? cWhiteColor
                          : cBlackColor,
                      activeColor: cPrimaryColor,
                      trackColor: cWhiteColor,
                    );
                  }),
                  gapW10,
                  Text(
                    "delivery boy mode".tr,
                  )
                ],
              ),
              gapH20,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ProfileOptionWidget(
                      onTapFunction: () {
                        Navigator.pushNamed(context, accountScreen);
                      },
                      assetName: Assets.profileImagesAccountPerson,
                      text: "my account and my data",
                    ),
                  ),
                  gapW30,
                  Expanded(
                    child: ProfileOptionWidget(
                      onTapFunction: () {
                        Navigator.pushNamed(context, myHorsesStableScreen);
                      },
                      assetName: Assets.profileImagesStable,
                      text: "stable",
                    ),
                  ),
                ],
              ),
              gapH30,
              BalanceReceipt(
                  headerText: "your balance is",
                  valueText: userbalance,
                  assetName: Assets.profileImagesMyWallet,
                  containerText: "my wallet"),
              gapH30,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ProfileOptionWidget(
                      onTapFunction: () {
                        Navigator.pushNamed(context, myOrdersScreen);
                      },
                      assetName: Assets.profileImagesMyPurchases,
                      text: "my purchases",
                    ),
                  ),
                  gapW30,
                  Expanded(
                    child: ProfileOptionWidget(
                      onTapFunction: () {
                        Navigator.pushNamed(context, mySoldHorsesScreen);
                      },
                      assetName: Assets.profileImagesMySales,
                      text: "my sales",
                    ),
                  ),
                ],
              ),
              gapH30,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ProfileOptionWidget(
                      onTapFunction: () {
                        Navigator.pushNamed(context, settingPreferencesScreen);
                      },
                      assetName: Assets.profileImagesSettings,
                      text: "settings",
                    ),
                  ),
                  gapW30,
                  Expanded(
                    child: ProfileOptionWidget(
                      onTapFunction: () {},
                      assetName: Assets.profileImagesHelp,
                      text: "help",
                    ),
                  ),
                ],
              ),
              gapH30,
              ProfileOptionWidget(
                onTapFunction: () {
                  Navigator.pushNamed(context, favoritesScreen);
                },
                needIcon: true,
                text: "favourites",
              ),
              gapH30,
              Obx(() => profileController.isDeliveryBoyMode.value
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        gapH30,
                        PrimaryColorButton(
                          height: 60,
                          width: context.width,
                          stringText: "manipulative control panel",
                          textStyle: onyx816,
                          onPressFunction: () {
                            Get.to(() => DeliveryHomeScreen());
                          },
                        ),
                        gapH30,
                      ],
                    )
                  : const SizedBox.shrink())
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(selectedIndex: 0),
    );
  }
}
