import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/colors/colors.dart';

class OnBoardingWidgets extends StatelessWidget {
  final int index;

  const OnBoardingWidgets({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: MediaQuery.of(context).orientation == Orientation.portrait
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      child: Container(
        alignment: Alignment.topCenter,
        height: context.isPortrait ? 200 : 100,
        width: context.width * 1,
        child: Text(
          "all about horses, buying, selling and bidding".tr,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 38, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}

class ProgressIdentifierComponent extends StatelessWidget {
  final int selectedIndex, itemIndex;

  const ProgressIdentifierComponent(
      {Key? key, required this.itemIndex, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,
      height: 3,
      decoration: BoxDecoration(
        color: selectedIndex == itemIndex ? cPrimaryColor : cGhostWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  final Offset offset;
  final Function()? arabicFunction, englishFunction;

  const MyMenu(
      {required this.arabicFunction,
      required this.englishFunction,
      this.offset = const Offset(0, 0),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: PopupMenuButton<int>(
        offset: offset,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        )),
        itemBuilder: (context) => [
          PopupMenuItem<int>(
            value: 0,
            onTap: arabicFunction,
            child: Text(
              'arabic'.tr,
            ),
          ),
          PopupMenuItem<int>(
              value: 1,
              onTap: englishFunction,
              child: Text(
                'english'.tr,
              )),
        ],
        child: Container(
          alignment: Alignment.center,
          height: 35,
          width: 27,
          decoration: BoxDecoration(
              border: Border.all(color: cPrimaryColor),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            "language".tr,
            style: const TextStyle(
                fontFamily: "Tajawal",
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
