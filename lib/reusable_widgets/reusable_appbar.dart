import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final Function()? onPressFunction;
  final TextStyle textStyle;

  const ReusableAppBar({
    Key? key,
    required this.textStyle,
    required this.titleText,
    required this.onPressFunction,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(40);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            gapH7,
            Text(titleText.tr),
          ],
        ),
        titleTextStyle: textStyle,
        centerTitle: true,
        backgroundColor: Colors.transparent,

        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: cBlackColor,
            size: 25,
          ),
        ));
  }
}
