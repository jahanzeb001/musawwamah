import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/delivery/my_deliveries/controller/my_deliveries_controller.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/constants/custom_error.dart';
import 'package:obaiah_mobile_app/utils/constants/no_data_message.dart';

import '../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../utils/spacing/gaps.dart';
import '../../../../utils/text_styles/textstyles.dart';
import '../components/my_deliveries_components.dart';

class MyDeliveryScreen extends StatefulWidget {
  const MyDeliveryScreen({Key? key}) : super(key: key);

  @override
  State<MyDeliveryScreen> createState() => _MyDeliveryScreenState();
}

class _MyDeliveryScreenState extends State<MyDeliveryScreen> {
  final myDeliveryController = Get.find<MyDeliveriesController>();
  @override
  void initState() {
    myDeliveryController.loadData();
    // TODO: implement initState
    super.initState();
  }

  Future<void> _refreshData() async {
    // Simulate an API call or any other data-fetching process
    await Future.delayed(Duration(seconds: 2));

    myDeliveryController.loadData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
          titleText: "my connections",
          onPressFunction: () {
            Navigator.pop(context);
          },
          textStyle: black718),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SafeArea(
            child: Obx(() => myDeliveryController.loading.value
                ? Center(
                    child: CircularProgressIndicator(
                    color: cPrimaryColor,
                  ))
                : myDeliveryController.error.value != ""
                    ? Center(
                        child: Custom_Error(
                            onpressed: () {
                              myDeliveryController.getMyConnection(
                                  myDeliveryController.deliveryAccountId!);
                            },
                            error: myDeliveryController.error.value),
                      )
                    : myDeliveryController.myCoonectionsModel.data?.length == 0
                        ? Center(child: NoDataMessage(message: "No Data Found"))
                        : Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: context.height * 1,
                            width: context.width * 1,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  gapH10,
                                  Flexible(
                                    child: ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: myDeliveryController
                                          .myCoonectionsModel.data!.length,
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              gapH15,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return MyDeliveriesListViewInfoCard(
                                          homePageModel: myDeliveryController
                                              .myCoonectionsModel.data![index],
                                          index: index,
                                          loading1: myDeliveryController
                                              .loading2.value,
                                          loading: myDeliveryController
                                              .loading3.value,
                                        );
                                      },
                                    ),
                                  ),
                                  gapH20,
                                ],
                              ),
                            ),
                          ))),
      ),
    );
  }
}
