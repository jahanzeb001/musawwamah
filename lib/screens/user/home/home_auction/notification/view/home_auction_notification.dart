import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../../../utils/colors/colors.dart';
import '../../../../../../utils/constants/custom_error.dart';
import '../../../../../../utils/constants/no_data_message.dart';
import '../../../../../../utils/spacing/gaps.dart';
import '../../../../../../utils/spacing/padding.dart';
import '../../../../../../utils/text_styles/textstyles.dart';
import '../components/notification_components.dart';
import '../controller/auction_notification_controller.dart';

class HomeAuctionNotification extends StatefulWidget {
  const HomeAuctionNotification({super.key});

  @override
  State<HomeAuctionNotification> createState() =>
      _HomeAuctionNotificationState();
}

class _HomeAuctionNotificationState extends State<HomeAuctionNotification> {
  NotificationAuctionController notificationController =
      Get.find<NotificationAuctionController>();

  @override
  void initState() {
    super.initState();
    notificationController.getNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableAppBar(
          onPressFunction: () {},
          titleText: "Notification",
          textStyle: onyx520,
        ),
        body: Obx(
          () => notificationController.loading.value
              ? Center(
                  child: CircularProgressIndicator(
                  color: cPrimaryColor,
                ))
              : notificationController.error.value != ""
                  ? Center(
                      child: Custom_Error(
                          onpressed: () {
                            notificationController.getNotification();
                            ;
                          },
                          error: notificationController.error.value),
                    )
                  : notificationController.getNotificationModel.data == null
                      ? Center(
                          child: Center(
                              child: NoDataMessage(
                          message: "No Data Found",
                        )))
                      : SingleChildScrollView(
                          child: Container(
                            padding: padA10,
                            child: ListView.separated(
                              itemCount: notificationController
                                  .getNotificationModel.data!.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder:
                                  (BuildContext context, int index) => gapH20,
                              itemBuilder: (context, index) {
                                return OperationHistoryTile(
                                    title: notificationController
                                        .getNotificationModel
                                        .data![index]
                                        .title,
                                    description: notificationController
                                        .getNotificationModel
                                        .data![index]
                                        .description);
                              },
                            ),
                          ),
                        ),
        ));
  }
}
