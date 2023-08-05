import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/home/home/controller/home_screen_controller.dart';
import 'package:obaiah_mobile_app/screens/user/training/training_home/components/sorting_dialogue.dart';
import 'package:obaiah_mobile_app/utils/constants/no_data_message.dart';

import '../../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../../reusable_widgets/reusable_search_sorting_component.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/constants/custom_error.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/spacing/padding.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../components/training_home_components.dart';
import '../controller/training_home_controller.dart';

class TrainingHomeScreen extends StatefulWidget {
  const TrainingHomeScreen({Key? key}) : super(key: key);

  @override
  State<TrainingHomeScreen> createState() => _TrainingHomeScreenState();
}

class _TrainingHomeScreenState extends State<TrainingHomeScreen> {
  TrainingHomeController traningController = Get.put(TrainingHomeController());
  @override
  void initState() {
    traningController.getMyTraning();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final trainingHomeController = Get.find<TrainingHomeController>();
    return Scaffold(
      appBar: ReusableAppBar(
          titleText: "training",
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
                      child: trainingHomeController.loading.value
                          ? Padding(
                              padding: EdgeInsets.only(top: 300, left: 150),
                              child: CircularProgressIndicator(
                                color: cPrimaryColor,
                              ),
                            )
                          : trainingHomeController.error.value != ""
                              ? Padding(
                                  padding: EdgeInsets.only(top: 200, left: 100),
                                  child: Custom_Error(
                                      onpressed: () {
                                        trainingHomeController.getMyTraning();
                                      },
                                      error:
                                          trainingHomeController.error.value),
                                )
                              : trainingHomeController
                                          .myTraningModel.data?.length ==
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
                                      itemCount: traningController
                                          .myTraningModel.data!.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisExtent: 350,
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 4.0,
                                              mainAxisSpacing: 4.0),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return TrainingGridViewInfoCard(
                                          homePageModel: trainingHomeController
                                              .myTraningModel.data,
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
                traningController.getPropertiseList();
                showDialog(
                    context: context,
                    builder: (context) => FilterDialogBox(
                          filterCheckBoxValueList:
                              Get.find<HomeScreenController>()
                                  .filterCheckBoxValueList,
                          selectedValueList:
                              Get.find<HomeScreenController>().filterValuesList,
                        ));
              }, sortingDialogFunction: () {
                showDialog(
                    context: context,
                    builder: (context) => const SortingDialogBox());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
