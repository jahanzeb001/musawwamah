import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../generated/assets.dart';
import '../utils/colors/colors.dart';
import '../utils/spacing/gaps.dart';

class ResultSortingComponent extends StatelessWidget {
  final Function()? filterDialogFunction, sortingDialogFunction;

  const ResultSortingComponent(
      {Key? key,
      required this.filterDialogFunction,
      required this.sortingDialogFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            width: 120,
            decoration: BoxDecoration(boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black54,
                blurRadius: 15.0,
                spreadRadius: 10,
                offset: Offset(
                  2.0, // Move to right 7.0 horizontally
                  15.0, //Move to Bottom
                ),
              )
            ], color: cWhiteColor, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Filtering Widget
                Expanded(
                    child: IconButton(
                        onPressed: filterDialogFunction,
                        icon:
                            SvgPicture.asset(Assets.searchFilterImagesFilter))),
                const VerticalDivider(color: cOnyxColor, thickness: 2),
                //Sorting Widget
                Expanded(
                    child: IconButton(
                        onPressed: sortingDialogFunction,
                        icon: SvgPicture.asset(
                            Assets.searchFilterImagesShuffle))),
              ],
            ),
          ),
          gapH10,
        ],
      ),
    );
  }
}
