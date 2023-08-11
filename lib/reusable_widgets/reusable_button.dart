import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors/colors.dart';

// ignore: must_be_immutable
class PrimaryColorButton extends StatelessWidget {
  final Function()? onPressFunction;
  final String stringText;
  final TextStyle textStyle;
  final double height, width;
  final double radius;
  bool loading;

  PrimaryColorButton(
      {super.key,
      required this.textStyle,
      required this.onPressFunction,
      required this.stringText,
      required this.height,
      required this.width,
      this.loading = false,
      this.radius = 20});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressFunction,
        style: ElevatedButton.styleFrom(
          shadowColor: cPrimaryColor,
          foregroundColor: cPrimaryColor,
          backgroundColor: cPrimaryColor,
          fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 0.0,
        ),
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.black,
              ))
            : Text(stringText.tr, style: textStyle));
  }
}

//<------------------------------------------------------------------------------>

class ReusableButton extends StatelessWidget {
  final Function()? onPressFunction;
  final String stringText;
  bool? loading;

  ReusableButton(
      {super.key,
      required this.onPressFunction,
      required this.stringText,
      this.loading});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressFunction,
        style: ElevatedButton.styleFrom(
          shadowColor: cPrimaryColor,
          foregroundColor: cPrimaryColor,
          fixedSize: Size(Get.size.width, 55),
          side: const BorderSide(color: cBlackColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0.0,
        ),
        child: loading == true
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.black,
              ))
            : Text(stringText.tr,
                style: const TextStyle(
                    fontFamily: "Tajawal",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: cBlackColor)));
  }
}

//<------------------------------------------------------------------------------>

class ReusableOutlineUnfixedButton extends StatelessWidget {
  final Function()? onPressFunction;
  final String stringText;
  final double width, height;
  final double radius;
  bool loading;

  ReusableOutlineUnfixedButton(
      {super.key,
      required this.onPressFunction,
      required this.stringText,
      required this.width,
      required this.radius,
      required this.height,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressFunction,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width, height),
          shadowColor: cPrimaryColor,
          foregroundColor: cPrimaryColor,
          side: const BorderSide(color: cBlackColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 0.0,
        ),
        child: loading
            ? Center(
                child: SizedBox(
                    height: 16,
                    child: CircularProgressIndicator(
                      color: cBlackColor,
                    )))
            : Text(stringText.tr,
                style: const TextStyle(
                    fontFamily: "Tajawal",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: cBlackColor)));
  }
}

//<------------------------------------------------------------------------------>

class ReusableOutlineDefaultButton extends StatelessWidget {
  final Function()? onPressFunction;
  final String stringText;
  final double radius;

  const ReusableOutlineDefaultButton({
    super.key,
    required this.onPressFunction,
    required this.radius,
    required this.stringText,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressFunction,
        style: ElevatedButton.styleFrom(
          side: const BorderSide(color: cBlackColor),
          shadowColor: cPrimaryColor,
          foregroundColor: cPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0.0,
        ),
        child: Text(stringText.tr,
            style: const TextStyle(
                fontFamily: "Tajawal",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: cBlackColor)));
  }
}

//<------------------------------------------------------------------------------>

class ReusableOutlineDefaultStadiumBorderButton extends StatelessWidget {
  final Function()? onPressFunction;
  final String stringText;

  const ReusableOutlineDefaultStadiumBorderButton({
    super.key,
    required this.onPressFunction,
    required this.stringText,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressFunction,
        style: ElevatedButton.styleFrom(
          shadowColor: cPrimaryColor,
          foregroundColor: cPrimaryColor,
          side: const BorderSide(color: cBlackColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 0.0,
        ),
        child: Text(stringText.tr,
            style: const TextStyle(
                fontFamily: "Tajawal",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: cBlackColor)));
  }
}
