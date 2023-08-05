import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/hospitality/hospitality_home/components/hospitality_sorting_dialogue.dart';
import 'package:obaiah_mobile_app/utils/constants/no_data_message.dart';

import '../../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../../reusable_widgets/reusable_search_sorting_component.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/constants/custom_error.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/spacing/padding.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../../../home/home/controller/home_screen_controller.dart';
import '../components/hospitality_home_components.dart';
import '../controller/hospitality_home_controller.dart';

class HospitalityHomeScreen extends StatefulWidget {
  const HospitalityHomeScreen({Key? key}) : super(key: key);

  @override
  State<HospitalityHomeScreen> createState() => _HospitalityHomeScreenState();
}

class _HospitalityHomeScreenState extends State<HospitalityHomeScreen> {
  final hospitalityHomeController = Get.find<HospitalityHomeController>();
  @override
  void initState() {
    hospitalityHomeController.Hospitalities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
          titleText: "quartering",
          textStyle: primary820,
          onPressFunction: () {
            Navigator.pop(context);
          }),
      body: Obx(
        () => Container(
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
                      child: hospitalityHomeController.loading.value
                          ? Padding(
                              padding: EdgeInsets.only(top: 300, left: 150),
                              child: CircularProgressIndicator(
                                color: cPrimaryColor,
                              ),
                            )
                          : hospitalityHomeController.error.value != ""
                              ? Padding(
                                  padding: EdgeInsets.only(top: 200, left: 100),
                                  child: Custom_Error(
                                      onpressed: () {
                                        hospitalityHomeController
                                            .Hospitalities();
                                      },
                                      error: hospitalityHomeController
                                          .error.value),
                                )
                              : hospitalityHomeController
                                          .myHospitalityModel.data?.length ==
                                      0
                                  ? Padding(
                                      padding:
                                          EdgeInsets.only(top: 200, left: 100),
                                      child: NoDataMessage(
                                        message: "No Data Found",
                                      ),
                                    )
                                  : GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: hospitalityHomeController
                                          .myHospitalityModel.data!.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisExtent: 300,
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 4.0,
                                              mainAxisSpacing: 4.0),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return HospitalityGridViewInfoCard(
                                          homePageModel:
                                              hospitalityHomeController
                                                  .myHospitalityModel.data,
                                          index: index,
                                        );
                                      },
                                    ),
                    ),
                    gapH100
                  ],
                ),
              ),
              ResultSortingComponent(filterDialogFunction: () {
                hospitalityHomeController.getPropertiseList();
                showDialog(
                    context: context,
                    builder: (context) => FilterDialogBox2(
                          filterCheckBoxValueList:
                              Get.find<HomeScreenController>()
                                  .filterCheckBoxValueList,
                          selectedValueList:
                              Get.find<HomeScreenController>().filterValuesList,
                        ));
              }, sortingDialogFunction: () {
                showDialog(
                    context: context,
                    builder: (context) => const SortingDialogBox2());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
