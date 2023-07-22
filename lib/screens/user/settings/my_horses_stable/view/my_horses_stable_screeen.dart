import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_horses_stable/components/my_horses_stable_components.dart';
import 'package:obaiah_mobile_app/utils/constants/constants.dart';
import 'package:obaiah_mobile_app/utils/constants/custom_error.dart';
import 'package:obaiah_mobile_app/utils/constants/no_data_message.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import '../../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../controller/my_horses_stable_controller.dart';

class MyHorsesStableScreen extends StatefulWidget {
  const MyHorsesStableScreen({Key? key}) : super(key: key);

  @override
  State<MyHorsesStableScreen> createState() => _MyHorsesStableScreenState();
}

class _MyHorsesStableScreenState extends State<MyHorsesStableScreen> {
  final myHorsesStableController = Get.find<MyHorsesStableController>();

  @override
  void initState() {
    myHorsesStableController.loadData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
          titleText: "stable",
          onPressFunction: () {
            Navigator.pop(context);
          },
          textStyle: black718),
      body: SafeArea(
          child: Obx(() => myHorsesStableController.loading.value
                  ? Center(
                      child: CircularProgressIndicator(
                      color: cPrimaryColor,
                    ))
                  : myHorsesStableController.error.value != ""
                      ? Center(
                          child: Custom_Error(
                              onpressed: () {
                                myHorsesStableController.getStableHorse(
                                    myHorsesStableController.uid);
                              },
                              error: myHorsesStableController.error.value),
                        )
                      : myHorsesStableController
                                  .stableHorseModel.data!.length ==
                              0
                          ? Center(
                              child: NoDataMessage(message: "No Data Found"))
                          : Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              height: context.height * 1,
                              width: context.width * 1,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: IconButton(
                                        onPressed: () {
                                          myHorsesStableController.changeView();
                                        },
                                        icon: Obx(() => myHorsesStableController
                                                .showInGrid.value
                                            ? const Icon(Icons.list)
                                            : const Icon(
                                                Icons.grid_view_rounded)),
                                        color: cBlackColor,
                                      ),
                                    ),
                                    gapH10,
                                    Flexible(
                                      child: myHorsesStableController
                                              .showInGrid.value
                                          ? GridView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  myHorsesStableController
                                                      .stableHorseModel
                                                      .data!
                                                      .length,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      mainAxisExtent: 300,
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 4.0,
                                                      mainAxisSpacing: 4.0),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return MyHorsesStableGridViewInfoCard(
                                                  homePageModel:
                                                      myHorsesStableController
                                                          .stableHorseModel
                                                          .data![index],
                                                );
                                              },
                                            )
                                          : ListView.separated(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  myHorsesStableController
                                                      .stableHorseModel
                                                      .data!
                                                      .length,
                                              separatorBuilder:
                                                  (BuildContext context,
                                                          int index) =>
                                                      gapH15,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return MyHorsesStableListViewInfoCard(
                                                  homePageModel:
                                                      myHorsesStableController
                                                          .stableHorseModel
                                                          .data![index],
                                                );
                                              },
                                            ),
                                    ),
                                    gapH20,
                                  ],
                                ),
                              ),
                            )
              // child: Obx(() => myHorsesStableController.loading.value
              //     ? Center(
              //         child: CircularProgressIndicator(
              //         color: cPrimaryColor,
              //       ))
              //     : myHorsesStableController.error.value != ""
              //         ? Center(
              //             child: Custom_Error(
              //                 onpressed: () {
              //                   myHorsesStableController
              //                       .getStableHorse(myHorsesStableController.uid);
              //                 },
              //                 error: myHorsesStableController.error.value),
              //           )
              //         : myHorsesStableController.stableHorseModel.data!.length == 0
              //             ? Center(
              //                 child: NoDataMessage(
              //                 message: "No Data Found",
              //               ))
              //             : Container(
              //                 padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              //                 height: context.height * 1,
              //                 width: context.width * 1,
              //                 child: SingleChildScrollView(
              //                   child: Column(
              //                     mainAxisSize: MainAxisSize.min,
              //                     children: [
              //                       Align(
              //                         alignment: Alignment.centerLeft,
              //                         child: IconButton(
              //                           onPressed: () {
              //                             myHorsesStableController.changeView();
              //                           },
              //                           icon: Obx(() => myHorsesStableController
              //                                   .showInGrid.value
              //                               ? const Icon(Icons.list)
              //                               : const Icon(Icons.grid_view_rounded)),
              //                           color: cBlackColor,
              //                         ),
              //                       ),
              //                       gapH10,
              //                       Flexible(
              //                         child: myHorsesStableController
              //                                 .showInGrid.value
              //                             ? GridView.builder(
              //                                 physics:
              //                                     const NeverScrollableScrollPhysics(),
              //                                 shrinkWrap: true,
              //                                 itemCount: myHorsesStableController
              //                                     .stableHorseModel.data!.length,
              //                                 gridDelegate:
              //                                     const SliverGridDelegateWithFixedCrossAxisCount(
              //                                         mainAxisExtent: 300,
              //                                         crossAxisCount: 2,
              //                                         crossAxisSpacing: 4.0,
              //                                         mainAxisSpacing: 4.0),
              //                                 itemBuilder: (BuildContext context,
              //                                     int index) {
              //                                   return MyHorsesStableGridViewInfoCard(
              //                                     homePageModel:
              //                                         myHorsesStableController
              //                                             .stableHorseModel
              //                                             .data![index],
              //                                   );
              //                                 },
              //                               )
              //                             : ListView.separated(
              //                                 physics:
              //                                     const NeverScrollableScrollPhysics(),
              //                                 shrinkWrap: true,
              //                                 itemCount: myHorsesStableController
              //                                     .stableHorseModel.data!.length,
              //                                 separatorBuilder:
              //                                     (BuildContext context,
              //                                             int index) =>
              //                                         gapH15,
              //                                 itemBuilder: (BuildContext context,
              //                                     int index) {
              //                                   return MyHorsesStableListViewInfoCard(
              //                                     homePageModel:
              //                                         myHorsesStableController
              //                                             .stableHorseModel
              //                                             .data![index],
              //                                   );
              //                                 },
              //                               ),
              //                       ),
              //                       gapH20,
              //                     ],
              //                   ),
              //                 ),
              //               )
              )),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                log("Floating Button Pressed");
                Navigator.pushNamed(context, addStableHorseScreen);
              },
              icon: Container(
                padding: const EdgeInsets.all(2),
                height: 35,
                width: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: cPrimaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.add,
                  color: cBlackColor,
                ),
              )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
