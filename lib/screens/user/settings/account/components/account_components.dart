import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/utils/text_styles/textstyles.dart';

import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/spacing/padding.dart';

class AccountTextFormComponent extends StatelessWidget {
  final TextEditingController textController;
  final String labelText;
  final bool isLabelInCenter;
  final TextStyle labelTextStyle;
  final TextInputType? keyBoardType;

  const AccountTextFormComponent(
      {Key? key,
      required this.textController,
      required this.labelText,
      this.keyBoardType = TextInputType.text,
      required this.isLabelInCenter,
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
            ? Center(child: Text(labelText.tr))
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
            : Image.file(
                image!,
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
