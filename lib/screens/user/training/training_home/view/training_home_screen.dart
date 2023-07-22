import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/home/home/controller/home_screen_controller.dart';

import '../../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../../reusable_widgets/reusable_search_sorting_component.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/constants/custom_error.dart';
import '../../../../../utils/constants/lists.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/spacing/padding.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../../../home/home/components/home_screen_components.dart';
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
        () => trainingHomeController.loading.value
            ? Center(
                child: CircularProgressIndicator(
                color: cPrimaryColor,
              ))
            : trainingHomeController.error.value != ""
                ? Center(
                    child: Custom_Error(
                        onpressed: () {},
                        error: trainingHomeController.error.value),
                  )
                // : walletPortfolioController.myWalletModel.data?.length == 0
                //     ? Center(
                //         child: NoDataMessage(
                //         message: "No Data Found",
                //       ))
                : Container(
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
                          showDialog(
                              context: context,
                              builder: (context) => FilterDialog(
                                    filterCheckBoxValueList:
                                        Get.find<HomeScreenController>()
                                            .filterCheckBoxValueList,
                                    selectedValueList:
                                        Get.find<HomeScreenController>()
                                            .filterValuesList,
                                  ));
                        }, sortingDialogFunction: () {
                          showDialog(
                              context: context,
                              builder: (context) => const SortingDialog());
                        }),
                      ],
                    ),
                  ),
      ),
    );
  }
}
