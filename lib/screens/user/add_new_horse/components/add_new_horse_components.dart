import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';

import '../../../../utils/text_styles/textstyles.dart';

class TwoWidgetsAlignComponent extends StatelessWidget {
  final Widget passedWidget;
  final String text;

  const TwoWidgetsAlignComponent(
      {Key? key, required this.passedWidget, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cWhiteColor,
            ),
            child: passedWidget,
          ),
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Text(
              text.tr,
              style: onyx410,
            )),
      ]),
    );
  }
}

class ThreeWidgetsAlignComponent extends StatelessWidget {
  final Widget passedWidget;
  final String topText;
  final String bottomText;

  const ThreeWidgetsAlignComponent(
      {Key? key,
      required this.passedWidget,
      required this.topText,
      required this.bottomText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cWhiteColor,
            ),
            child: passedWidget,
          ),
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Text(
              topText.tr,
              style: onyx410,
            )),
        Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              bottomText.tr,
              style: onyx405,
            )),
      ]),
    );
  }
}

class SelectContainerComponent extends StatelessWidget {
  final bool isChecked;
  final String text;
  final Function()? onTapFunction;

  const SelectContainerComponent(
      {Key? key,
      required this.isChecked,
      required this.text,
      required this.onTapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isChecked ? cPrimaryColor : cWhiteColor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text.tr,
          style: isChecked ? homePageGridHeading : homePageGridValue,
        ),
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
        height: 100,
        width: 120,
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

class MediaButton extends StatelessWidget {
  final String text;
  final Function()? onPressFunction;

  const MediaButton(
      {Key? key, required this.text, required this.onPressFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressFunction,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(120, 30),
            backgroundColor: cPrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: FittedBox(child: Text(text.tr, style: homePageGridValue)));
  }
}

class AddHorseRadioButton extends StatelessWidget {
  final void Function(dynamic)? onChangeFunction;
  final dynamic groupValue;
  final dynamic value;

  const AddHorseRadioButton(
      {Key? key,
      required this.onChangeFunction,
      required this.groupValue,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Radio(
        value: value,
        groupValue: groupValue,
        fillColor: const MaterialStatePropertyAll(cOnyxColor),
        focusColor: cScaffoldBackground,
        splashRadius: 10,
        visualDensity: VisualDensity.compact,
        onChanged: onChangeFunction);
  }
}

class TextFormCustomColorComponent extends StatelessWidget {
  final TextEditingController textController;
  final Color? fillColor;
  final TextInputType? keyboardType;
  void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  TextFormCustomColorComponent(
      {Key? key,
      required this.keyboardType,
      required this.textController,
      required this.fillColor,
      this.inputFormatters,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      inputFormatters: inputFormatters,
      textAlign: TextAlign.center,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: const TextStyle(
          fontFamily: "Tajawal", fontWeight: FontWeight.w700, fontSize: 14),
      decoration: InputDecoration(
        filled: true,
        labelStyle: const TextStyle(
          fontFamily: "Tajawal",
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: cOnyxColor,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        fillColor: fillColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none),
      ),
    );
  }
}

class NewHorseTextFormWithoutLabelComponent extends StatelessWidget {
  final TextEditingController textController;

  const NewHorseTextFormWithoutLabelComponent({
    Key? key,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontFamily: "Tajawal", fontWeight: FontWeight.w700, fontSize: 14),
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        fillColor: cWhiteColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none),
      ),
    );
  }
}

class NewHorseSimpleTextFormFieldComponent extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  void Function(String)? onChanged;
  NewHorseSimpleTextFormFieldComponent(
      {Key? key,
      required this.textController,
      required this.hintText,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.number,
      style: onyx516,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintStyle: onyx516,
        contentPadding: EdgeInsets.zero,
        filled: true,
        hintText: hintText,
        fillColor: cWhiteColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none),
      ),
    );
  }
}

class NewHorseMaxLinesIncreasedTextFormFieldComponent extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;

  const NewHorseMaxLinesIncreasedTextFormFieldComponent(
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
      maxLines: 20,
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

class DaySelectContainer extends StatelessWidget {
  final bool isChecked;
  final String text;
  final Function()? onTapFunction;

  const DaySelectContainer(
      {Key? key,
      required this.isChecked,
      required this.text,
      required this.onTapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isChecked ? cPrimaryColor : cWhiteColor,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text.tr,
              style: isChecked ? onyx716 : onyx416,
            ),
            Text(
              "days".tr,
              style: isChecked ? onyx716 : onyx416,
            ),
          ],
        ),
      ),
    );
  }
}
