import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/spacing/padding.dart';
import '../../../../utils/text_styles/textstyles.dart';

class DeliveryAccountTextFormComponent extends StatelessWidget {
  final TextEditingController textController;
  final String labelText;
  final bool isLabelInCenter;
  final TextStyle labelTextStyle;
  final bool showVerifiedIcons;
  final TextInputType? keyBoardType;

  const DeliveryAccountTextFormComponent(
      {Key? key,
      required this.textController,
      required this.labelText,
      required this.isLabelInCenter,
      this.keyBoardType = TextInputType.text,
      this.showVerifiedIcons = false,
      required this.labelTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      textAlign: TextAlign.center,
      style: onyx718,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        filled: true,
        labelStyle: labelTextStyle,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: isLabelInCenter
            ? Center(
                child: Text(labelText.tr),
              )
            : showVerifiedIcons
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(labelText.tr),
                      gapW6,
                      SvgPicture.asset(
                        Assets.auctionImagesVerified,
                      ),
                    ],
                  )
                : Text(labelText.tr),
        fillColor: cWhiteColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none),
      ),
    );
  }
}

class CustomContainerComponent extends StatelessWidget {
  final String text;
  final Function()? onTapFunction;
  File? image;

  CustomContainerComponent(
      {Key? key, required this.text, required this.onTapFunction, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        padding: padA10,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: cWhiteColor, borderRadius: BorderRadius.circular(10)),
        child: image == null
            ? Text(
                text.tr,
                textAlign: TextAlign.center,
                style: auctionValueTextStyle,
              )
            : Image.file(image!),
      ),
    );
  }
}

class TransferPlacesCheckComponent extends StatelessWidget {
  final String cityName;
  final Function(bool?)? onChangeFunction;
  final bool checkBoxValue;

  const TransferPlacesCheckComponent(
      {Key? key,
      required this.cityName,
      required this.checkBoxValue,
      required this.onChangeFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 22,
          width: 22,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: cCheckBackground),
          child: Checkbox(
            value: checkBoxValue,
            checkColor: cPrimaryColor,
            fillColor: const MaterialStatePropertyAll(cCheckBackground),
            overlayColor: const MaterialStatePropertyAll(cCheckBackground),
            side: const BorderSide(color: cCheckBackground),
            onChanged: onChangeFunction,
          ),
        ),
        gapH5,
        Text(
          cityName.tr,
          style: onyx510,
        ),
      ],
    );
  }
}
