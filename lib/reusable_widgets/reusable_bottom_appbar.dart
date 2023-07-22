import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:obaiah_mobile_app/generated/assets.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import '../utils/constants/constants.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomAppBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: cRedColor,
        elevation: 0.0,
        child: Container(
          decoration: const BoxDecoration(
            color: cWhiteColor,
            border: Border(top: BorderSide(width: 1.5, color: cWhiteColor)),
          ),
          height: 80,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CustomBottomAppBarComponent(
                  itemIndex: 4,
                  selectedIndex: selectedIndex,
                  assetName: Assets.bottomAppBarImagesHome,
                  onTapFunction: () {
                    // Get.offAll(() => const HomeScreenView(),
                    //     transition: Transition.fadeIn);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        homeScreen, (Route<dynamic> route) => false);
                  }),
              CustomBottomAppBarComponent(
                  itemIndex: 3,
                  selectedIndex: selectedIndex,
                  assetName: Assets.bottomAppBarImagesAuction,
                  onTapFunction: () {
                    Navigator.pushNamed(
                      context,
                      liveAuction,
                    );
                  }),
              CustomBottomAppBarComponent(
                itemIndex: 2,
                selectedIndex: selectedIndex,
                assetName: Assets.bottomAppBarImagesAdd,
                onTapFunction: () {
                  Navigator.pushNamed(context, addNewHorseScreen);
                },
              ),
              CustomBottomAppBarComponent(
                  itemIndex: 1,
                  selectedIndex: selectedIndex,
                  assetName: Assets.bottomAppBarImagesMore,
                  onTapFunction: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        homeAuctionScreen, (Route<dynamic> route) => false);
                  }),
              CustomBottomAppBarComponent(
                  itemIndex: 0,
                  selectedIndex: selectedIndex,
                  assetName: Assets.bottomAppBarImagesSettings,
                  onTapFunction: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        profileUser, (Route<dynamic> route) => false);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBottomAppBarComponent extends StatelessWidget {
  final int selectedIndex;
  final int itemIndex;
  final String assetName;
  final Function()? onTapFunction;

  const CustomBottomAppBarComponent({
    super.key,
    required this.selectedIndex,
    required this.itemIndex,
    required this.assetName,
    required this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectedIndex == itemIndex ? null : onTapFunction,
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: 55,
        child: SvgPicture.asset(
          assetName,
          height: 24,
          width: 24,
          color: selectedIndex == itemIndex
              ? cPrimaryColor
              : itemIndex == 2
                  ? cPrimaryColor
                  : cRomanSilverColor,
        ),
      ),
    );
  }
}
