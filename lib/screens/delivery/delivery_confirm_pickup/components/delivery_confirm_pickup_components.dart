import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/colors/colors.dart';
import '../../../../utils/text_styles/textstyles.dart';

class ConfirmPickupAndDropMaxLinesIncreasedTextFormFieldComponent
    extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;

  const ConfirmPickupAndDropMaxLinesIncreasedTextFormFieldComponent(
      {Key? key, required this.textController, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      textAlign: TextAlign.justify,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.text,
      style: auctionValueTextStyle,
      maxLines: 5,
      decoration: InputDecoration(
        hintStyle: const TextStyle(
            fontFamily: "Tajawal",
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: cRomanSilverColor),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        filled: true,
        hintText: hintText.tr,
        fillColor: cWhiteColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none),
      ),
    );
  }
}
