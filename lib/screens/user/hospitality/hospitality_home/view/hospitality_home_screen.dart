import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../../reusable_widgets/reusable_search_sorting_component.dart';
import '../../../../../utils/constants/lists.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/spacing/padding.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../../../home/home/components/home_screen_components.dart';
import '../../../home/home/controller/home_screen_controller.dart';
import '../components/hospitality_home_components.dart';
import '../controller/hospitality_home_controller.dart';

class HospitalityHomeScreen extends StatelessWidget {
  const HospitalityHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hospitalityHomeController = Get.find<HospitalityHomeController>();
    return Scaffold(
      appBar: ReusableAppBar(
          titleText: "quartering",
          textStyle: primary820,
          onPressFunction: () {
            Navigator.pop(context);
          }),
      body: Container(
        height: context.height * 1,
        width: context.width * 1,
        padding: padA10,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: homePageList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 300,
                              crossAxisCount: 2,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 4.0),
                      itemBuilder: (BuildContext context, int index) {
                        return HospitalityGridViewInfoCard(
                            homePageModel: homePageList.elementAt(index));
                      },
                    ),
                  ),
                  gapH100
                ],
              ),
            ),
            ResultSortingComponent(filterDialogFunction: () {
              showDialog(
                  context: context,
                  builder: (context) => FilterDialog(
                        filterCheckBoxValueList:
                            Get.find<HomeScreenController>()
                                .filterCheckBoxValueList,
                        selectedValueList:
                            Get.find<HomeScreenController>().filterValuesList,
                      ));
            }, sortingDialogFunction: () {
              showDialog(
                  context: context,
                  builder: (context) => const SortingDialog());
            }),
          ],
        ),
      ),
    );
  }
}
