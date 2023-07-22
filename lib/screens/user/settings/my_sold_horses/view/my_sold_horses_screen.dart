import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/utils/constants/custom_error.dart';
import 'package:obaiah_mobile_app/utils/constants/no_data_message.dart';

import '../../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../components/my_sold_horses_components.dart';
import '../controller/my_sold_horses_controller.dart';

class MySoldHorsesScreen extends StatefulWidget {
  MySoldHorsesScreen({Key? key}) : super(key: key);

  @override
  State<MySoldHorsesScreen> createState() => _MySoldHorsesScreenState();
}

class _MySoldHorsesScreenState extends State<MySoldHorsesScreen> {
  final mySoldHorsesController = Get.find<MySoldHorsesController>();
  @override
  void initState() {
    mySoldHorsesController.loadData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableAppBar(
            titleText: "my sales",
            onPressFunction: () {
              Navigator.pop(context);
            },
            textStyle: black718),
        body: Obx(
          () => mySoldHorsesController.loadingSoldHorse.value
              ? Center(
                  child: CircularProgressIndicator(
                  color: cPrimaryColor,
                ))
              : mySoldHorsesController.error.value != ""
                  ? Center(
                      child: Custom_Error(
                          onpressed: () {
                            mySoldHorsesController
                                .getMySales(mySoldHorsesController.uid!);
                          },
                          error: mySoldHorsesController.error.value),
                    )
                  : mySoldHorsesController.soldHorseModel.data!.length == 0
                      ? Center(
                          child: NoDataMessage(
                          message: "No Data Found",
                        ))
                      : SafeArea(
                          child: Container(
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
                                      mySoldHorsesController.changeView();
                                    },
                                    icon: mySoldHorsesController
                                            .showInGrid.value
                                        ? const Icon(Icons.list)
                                        : const Icon(Icons.grid_view_rounded),
                                    color: cBlackColor,
                                  ),
                                ),
                                gapH10,
                                Flexible(
                                  child: mySoldHorsesController.showInGrid.value
                                      ? GridView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: mySoldHorsesController
                                              .soldHorseModel.data!.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  mainAxisExtent: 380,
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 4.0,
                                                  mainAxisSpacing: 4.0),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return MySoldHorsesGridViewInfoCard(
                                                homePageModel:
                                                    mySoldHorsesController
                                                        .soldHorseModel
                                                        .data![index]);
                                          },
                                        )
                                      : ListView.separated(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: mySoldHorsesController
                                              .soldHorseModel.data!.length,
                                          separatorBuilder:
                                              (BuildContext context,
                                                      int index) =>
                                                  gapH15,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return MySoldHorsesListViewInfoCard(
                                                homePageModel:
                                                    mySoldHorsesController
                                                        .soldHorseModel
                                                        .data![index]);
                                          },
                                        ),
                                ),
                                gapH20,
                              ],
                            ),
                          ),
                        )),
        ));
  }
}
