import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

typedef OnChangeValue = void Function(String);

/// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;

  final String? hint;
  final bool? obsecure;
  final double? height;
  final double? width;
  final validator;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final OnChangeValue? onChange;
  final List<TextInputFormatter>? inputFormatter;
  CustomTextField({
    Key? key,
    this.controller,
    this.hint,
    @required this.validator,
    this.obsecure = false,
    this.keyboardType,
    this.height,
    this.width,
    this.onTap,
    this.onChange,
    this.inputFormatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return GetBuilder(builder: (_) {
      return Container(
        height: height ?? 58,
        width: width ?? screenSize.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2),
                  Expanded(
                    child: TextFormField(
                        controller: controller,
                        // validator: validator,
                        obscureText: obsecure!,
                        keyboardType: keyboardType ?? TextInputType.text,
                        onTap: onTap ?? () {},
                        onChanged: onChange ?? (String? value) {},
                        inputFormatters: inputFormatter ?? [],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: hint,
                        ),
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
