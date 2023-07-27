import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors/colors.dart';
import '../utils/constants/lists.dart';

class ReusableBankDropDownFormField extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  ReusableBankDropDownFormField({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cWhiteColor, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cWhiteColor, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: cWhiteColor, width: 1),
          ),
          border: InputBorder.none,
          filled: true,
          isDense: true,
          fillColor: cWhiteColor,
          labelStyle: const TextStyle(
            fontFamily: "Tajawal",
            fontWeight: FontWeight.w700,
            fontSize: 9,
            color: cOnyxColor,
          ),
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text("bank".tr),
        ),
        style: TextStyle(
            color: cOnyxColor,
            fontFamily: "Tajawal",
            fontWeight: FontWeight.w700,
            fontSize: 14),
        isExpanded: true,
        borderRadius: BorderRadius.circular(10),
        icon: Visibility(visible: false, child: Icon(Icons.add)),
        validator: (value) => value == null ? "اختر بنكًا" : null,
        dropdownColor: Colors.white,
        value: banksListArabic[0],
        onChanged: (String? newValue) {
          controller?.text = newValue!;
        },
        items: banksListArabic.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
      ),
    );
  }
}

class ReusableRegionDropDownFormField extends StatelessWidget {
  final FloatingLabelAlignment labelAlignment;
  final double radius;
  TextEditingController? controller = TextEditingController();

  ReusableRegionDropDownFormField(
      {Key? key,
      this.labelAlignment = FloatingLabelAlignment.start,
      this.radius = 15,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cWhiteColor, width: 1),
            borderRadius: BorderRadius.circular(radius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cWhiteColor, width: 1),
            borderRadius: BorderRadius.circular(radius),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: cWhiteColor, width: 1),
          ),
          border: InputBorder.none,
          filled: true,
          isDense: true,
          fillColor: cWhiteColor,
          labelStyle: const TextStyle(
            fontFamily: "Tajawal",
            fontWeight: FontWeight.w700,
            fontSize: 9,
            color: cOnyxColor,
          ),
          floatingLabelAlignment: labelAlignment,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text("region".tr),
        ),
        style: TextStyle(
            color: cOnyxColor,
            fontFamily: "Tajawal",
            fontWeight: FontWeight.w700,
            fontSize: 14),
        isExpanded: true,
        borderRadius: BorderRadius.circular(radius),
        icon: Visibility(visible: false, child: Icon(Icons.add)),
        validator: (value) => value == null ? "حدد منطقة" : null,
        dropdownColor: Colors.white,
        value: citiesListArabic[0],
        onChanged: (String? newValue) {
          log('$newValue');
          controller?.text = newValue!;
        },
        items: citiesListArabic.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
      ),
    );
  }
}
