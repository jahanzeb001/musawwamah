import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/utils/constants/custom_error.dart';
import 'package:obaiah_mobile_app/utils/constants/no_data_message.dart';
import '../../../../../Payments/thanku_controller.dart';
import '../../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../../../live_auction/controller/add_rating.dart';
import '../components/my_order_components.dart';
import '../controller/my_orders_controller.dart';
import 'rating_screen.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final myOrdersController = Get.find<MyOrdersController>();

  @override
  void initState() {
    myOrdersController.loadData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableAppBar(
            titleText: "my purchases",
            onPressFunction: () {
              Navigator.pop(context);
            },
            textStyle: black718),
        body: SafeArea(
          child: Obx(() => myOrdersController.loading.value
              ? Center(
                  child: CircularProgressIndicator(
                  color: cPrimaryColor,
                ))
              : myOrdersController.error.value != ""
                  ? Center(
                      child: Custom_Error(
                          onpressed: () {
                            myOrdersController
                                .getMyPurchase(myOrdersController.uid!);
                          },
                          error: myOrdersController.error.value))
                  : myOrdersController.myPurchaseModel.data!.length == 0
                      ? Center(
                          child: NoDataMessage(
                          message: "No Data Found",
                        ))
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
                                      myOrdersController.changeView();
                                    },
                                    icon: myOrdersController.showInGrid.value
                                        ? const Icon(Icons.list)
                                        : const Icon(Icons.grid_view_rounded),
                                    color: cBlackColor,
                                  ),
                                ),
                                gapH10,
                                Flexible(
                                  child: myOrdersController.showInGrid.value
                                      ? GridView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: myOrdersController
                                              .myPurchaseModel.data!.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  mainAxisExtent: 380,
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 4.0,
                                                  mainAxisSpacing: 4.0),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            var checkval = myOrdersController
                                                .myPurchaseModel
                                                .data![index]
                                                .isReviewed;
                                            var sellername = myOrdersController
                                                .myPurchaseModel
                                                .data![index]
                                                .sellername;

                                            var deliveryname =
                                                myOrdersController
                                                    .myPurchaseModel
                                                    .data![index]
                                                    .deliveryboyname;
                                            var sellerid = myOrdersController
                                                .myPurchaseModel
                                                .data![index]
                                                .sellerId;
                                            var horseid = myOrdersController
                                                .myPurchaseModel
                                                .data![index]
                                                .horseId;

                                            if (checkval == '6') {
                                              Future.microtask(
                                                () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        RatingScreen(
                                                            sellerid: sellerid
                                                                .toString(),
                                                            horseid: horseid
                                                                .toString(),
                                                            sellername:
                                                                sellername,
                                                            deliveryname:
                                                                deliveryname),
                                                  ),
                                                ),
                                              );
                                              //Get.off(RatingScreen());
                                              // WidgetsBinding.instance
                                              //     .addPostFrameCallback((_) {
                                              //   showRatingDialog(
                                              //       context,
                                              //       sellerid,
                                              //       horseid,
                                              //       sellername,
                                              //       deliveryname);
                                              // });
                                            }

                                            return MyOrdersGridViewInfoCard(
                                                homePageModel:
                                                    myOrdersController
                                                        .myPurchaseModel
                                                        .data![index]);
                                          },
                                        )
                                      : ListView.separated(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: myOrdersController
                                              .myPurchaseModel.data!.length,
                                          separatorBuilder:
                                              (BuildContext context,
                                                      int index) =>
                                                  gapH15,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            var checkval = myOrdersController
                                                .myPurchaseModel
                                                .data![index]
                                                .isReviewed;
                                            var sellername = myOrdersController
                                                .myPurchaseModel
                                                .data![index]
                                                .sellername;

                                            var deliveryname =
                                                myOrdersController
                                                    .myPurchaseModel
                                                    .data![index]
                                                    .deliveryboyname;
                                            var sellerid = myOrdersController
                                                .myPurchaseModel
                                                .data![index]
                                                .sellerId;
                                            var horseid = myOrdersController
                                                .myPurchaseModel
                                                .data![index]
                                                .horseId;
                                            if (checkval == '6') {
                                              Future.microtask(
                                                () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        RatingScreen(
                                                            sellerid:
                                                                '92'.toString(),
                                                            horseid: '1111'
                                                                .toString(),
                                                            sellername: 'Alyar',
                                                            deliveryname:
                                                                'M Khalid'),
                                                  ),
                                                ),
                                              );
                                            }
                                            return MyOrderListViewInfoCard(
                                                homePageModel:
                                                    myOrdersController
                                                        .myPurchaseModel
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
