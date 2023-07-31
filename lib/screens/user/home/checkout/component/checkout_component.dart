import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/settings/account/controller/account_controller.dart';

import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../controller/checkout_controller.dart';

class CheckOutTextFormComponent extends StatelessWidget {
  final TextEditingController textController;
  final String labelText;

  const CheckOutTextFormComponent(
      {Key? key, required this.textController, required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontFamily: "Tajawal", fontWeight: FontWeight.w700, fontSize: 14),
      decoration: InputDecoration(
        filled: true,
        labelStyle: const TextStyle(
          fontFamily: "Tajawal",
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: cOnyxColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Center(child: Text(labelText.tr)),
        fillColor: cWhiteColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none),
      ),
    );
  }
}

const tableVerticalSpacer = TableRow(children: [
  gapH10,
  gapH10,
  gapH10,
]);

class RecommendationComponent extends StatefulWidget {
  final String recommendationServiceName;
  final String recommendationServiceValue;

  const RecommendationComponent(
      {Key? key,
      required this.recommendationServiceName,
      required this.recommendationServiceValue})
      : super(key: key);

  @override
  State<RecommendationComponent> createState() =>
      _RecommendationComponentState();
}

class _RecommendationComponentState extends State<RecommendationComponent> {
  @override
  final checkoutController = Get.find<CheckoutController>();
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.recommendationServiceName.tr,
          style: onyx511,
        ),
        gapH6,
        Text(
          widget.recommendationServiceValue == '1'
              ? checkoutController.cityProvinceController.text
              : widget.recommendationServiceValue.tr,
          style: onyx811,
        ),
      ],
    );
  }
}
