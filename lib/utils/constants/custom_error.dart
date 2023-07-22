import 'package:flutter/material.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';
import 'package:obaiah_mobile_app/utils/text_styles/textstyles.dart';

class Custom_Error extends StatelessWidget {
  Custom_Error({super.key, required this.onpressed, required this.error});

  final Function onpressed;
  String error;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            onpressed();
          },
          icon: Icon(
            Icons.refresh,
            size: 40,
            color: cPrimaryColor,
          ),
        ),
        gapH12,
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: cPrimaryColor),
          child: Padding(
            padding: pad61,
            child: Text(
              error,
              style: homePageOnyxGridPrice.copyWith(
                  fontSize: 14, color: cCheckBackground),
            ),
          ),
        )
      ],
    );
  }
}
