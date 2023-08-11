import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Payments/color_manager.dart';
import '../../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../../utils/colors/colors.dart';

import '../../../../../utils/text_styles/textstyles.dart';
import 'screen_short.dart';

class PurchaserReceipts extends StatefulWidget {
  String aliganceno;
  String purchasername;
  String address;
  String sellername;
  String customerphone;
  String horsepprice;
  String dileverycharges;
  String total;

  PurchaserReceipts({
    super.key,
    required this.aliganceno,
    required this.purchasername,
    required this.address,
    required this.sellername,
    required this.customerphone,
    required this.horsepprice,
    required this.dileverycharges,
    required this.total,
  });

  @override
  State<PurchaserReceipts> createState() => _PurchaserReceiptsState();
}

class _PurchaserReceiptsState extends State<PurchaserReceipts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableAppBar(
          titleText: "Receipt",
          onPressFunction: () {},
          textStyle: onyx520,
        ),
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          height: context.height * 1,
          width: context.width * 1,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Confirmed".tr,
                    style: const TextStyle(
                        fontFamily: "Tajawal",
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
                Container(
                  child: Text(
                    '# ${widget.aliganceno}',
                    style: homePageHeading,
                  ),
                ),
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      'assets/images/app_icon/obaiah_icon.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: context.width * 1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            BillTabularComponent(
                              name: 'Purchaser Name'.tr,
                              value: '${widget.purchasername}',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            BillTabularComponent(
                              name: 'Address'.tr,
                              value: '${widget.address}',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            BillTabularComponent(
                              name: 'Seller Name'.tr,
                              value: '${widget.sellername}',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            BillTabularComponent(
                              name: 'Customer Phone'.tr,
                              value: '${widget.customerphone}',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            BillTabularComponent(
                              name: 'Horse Price'.tr,
                              value: '${widget.total}',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            BillTabularComponent(
                              name: 'Delivery Charge'.tr,
                              value: '${widget.dileverycharges}',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            BillTabularComponent(
                              name: 'Total Price'.tr,
                              value: '${int.parse(widget.total) + 10}',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    String? path = await NativeScreenshot.takeScreenshot();

                    if (path != null) {
                      Get.snackbar('success'.tr, 'imageissaved'.tr);
                    }
                    //  Get.to(()=>ReceipentScreen());
                  },
                  child: Container(
                      height: 35,
                      width: 200,
                      decoration: BoxDecoration(
                          //
                          color: cPrimaryColor,
                          borderRadius: BorderRadius.circular(7)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.download, color: white),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () async {
                              String? path =
                                  await NativeScreenshot.takeScreenshot();

                              if (path != null) {
                                Get.snackbar('success'.tr, 'imageissaved'.tr);
                              }
                              // Get.to(()=>ReceipentScreen());
                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  'download'.tr,
                                  style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                      color: white),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
              ]),
        )));
  }
}

class BillTabularComponent extends StatelessWidget {
  final String name, value;

  const BillTabularComponent({
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Directionality(
        textDirection: TextDirection.ltr,
        child: Text(
          name,
          style: homePageHeading,
        ),
      ),
      const SizedBox(
        width: 50,
      ),
      const Spacer(),
      Text(
        value,
        softWrap: true,
        style: homePageValue,
      ),
    ]);
  }
}

class TotalPaymentComponent extends StatelessWidget {
  final String name, price;

  const TotalPaymentComponent({
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      const Spacer(),
      Text(
        name,
        style: const TextStyle(
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: textColor),
      ),
      const SizedBox(
        width: 7,
      ),
      Text(
        price,
        softWrap: true,
        style: const TextStyle(
            fontFamily: 'Tajawal',
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            overflow: TextOverflow.ellipsis),
      ),
    ]);
  }
}
