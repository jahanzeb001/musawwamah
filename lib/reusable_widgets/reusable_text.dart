import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReUsableText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  const ReUsableText({Key? key, required this.text, required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: textStyle),
        const SizedBox(
          width: 3,
        ),
        Text(
          "riyal".tr,
          style: textStyle,
        ),
      ],
    );
  }
}
