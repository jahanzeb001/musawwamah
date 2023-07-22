import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/utils/constants/custom_error.dart';
import 'package:obaiah_mobile_app/utils/constants/no_data_message.dart';
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

                                            if (checkval == '1') {
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
                                            if (checkval == '1') {
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

TextEditingController seller = TextEditingController();
TextEditingController dilaverboy = TextEditingController();
double rating1 = 0.0;
double rating2 = 0.0;
showRatingDialog(
    BuildContext context, sellerid, horseid, sellername, deliveryboyname) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          // title: Text('Obeiah App'),

          content: Container(
        padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text('$sellername',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))),
                  Expanded(
                    flex: 3,
                    child: Image.asset(
                      'assets/images/auction_images/person_image.png',
                      width: 100,
                      height: 100,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.0),
              RatingBar.builder(
                initialRating: rating1,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 40.0,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (newRating) {
                  // setState(() {
                  //   rating1 = newRating;
                  // });
                },
              ),
              SizedBox(height: 10.0),
              //Text('Rating 1: $rating1'),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cWhiteColor),
                child: TextField(
                  controller: seller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: cPrimaryColor,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: cPrimaryColor,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Write Text...",
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text('$deliveryboyname',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))),
                  Expanded(
                    flex: 3,
                    child: Image.asset(
                      'assets/images/auction_images/person_image.png',
                      width: 100,
                      height: 100,
                    ),
                  )
                ],
              ),
              RatingBar.builder(
                initialRating: rating2,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 40.0,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (newRating) {
                  // setState(() {
                  //   rating2 = newRating;
                  // });
                },
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cWhiteColor),
                child: TextField(
                  controller: dilaverboy,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: cPrimaryColor,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: cPrimaryColor,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Write Text...",
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              SizedBox(
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    print("${rating1} --${rating2}--${seller.text}} ");
                    AddRattingRecord.addrating(
                      userId: int.tryParse(sellerid),
                      horseid: int.tryParse(horseid),
                      sellerating: rating1,
                      deliverrating: rating2,
                      sellercomment: seller.text,
                      deleveryboycomment: dilaverboy.text,
                    );
                    // deliverycomment: dilaverboy.text
                  },
                  style: ElevatedButton.styleFrom(
                    shadowColor: cPrimaryColor,
                    foregroundColor: cPrimaryColor,
                    fixedSize: const Size(200, 35),
                    side: const BorderSide(color: cBlackColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0.0,
                  ),
                  child: FittedBox(
                    child: Text('submit', style: homePageGridValue),
                  ),
                ),
              ),
              //Text('Rating 2: $rating2'),
            ],
          ),
        ),
      ));
    },
  );
}

class RatingDialog extends StatefulWidget {
  const RatingDialog({super.key});

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  TextEditingController seller = TextEditingController();
  TextEditingController dilaverboy = TextEditingController();
  double rating1 = 0.0;
  double rating2 = 0.0;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        // title: Text('Obeiah App'),

        content: Container(
      padding: EdgeInsets.all(5),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                // $sellername
                Expanded(
                    flex: 2,
                    child: Text('Ahmed',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    'assets/images/auction_images/person_image.png',
                    width: 100,
                    height: 100,
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            RatingBar.builder(
              initialRating: rating1,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 40.0,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (newRating) {
                // setState(() {
                //   rating1 = newRating;
                // });
              },
            ),
            SizedBox(height: 10.0),
            //Text('Rating 1: $rating1'),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: cWhiteColor),
              child: TextField(
                controller: seller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: cPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: cPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Write Text...",
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                // $deliveryboyname
                Expanded(
                    flex: 2,
                    child: Text('delevery',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    'assets/images/auction_images/person_image.png',
                    width: 100,
                    height: 100,
                  ),
                )
              ],
            ),
            RatingBar.builder(
              initialRating: rating2,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 40.0,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (newRating) {
                // setState(() {
                //   rating2 = newRating;
                // });
              },
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: cWhiteColor),
              child: TextField(
                controller: dilaverboy,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: cPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: cPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Write Text...",
                ),
              ),
            ),
            SizedBox(height: 15.0),
            SizedBox(
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  print("${rating1} --${rating2}--${seller.text}} ");
                  // int.tryParse(sellerid)
                  // int.tryParse(horseid)
                  AddRattingRecord.addrating(
                    userId: 1,
                    horseid: 4,
                    sellerating: rating1,
                    deliverrating: rating2,
                    sellercomment: seller.text,
                    deleveryboycomment: dilaverboy.text,
                  );
                  // deliverycomment: dilaverboy.text
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: cPrimaryColor,
                  foregroundColor: cPrimaryColor,
                  fixedSize: const Size(200, 35),
                  side: const BorderSide(color: cBlackColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0.0,
                ),
                child: FittedBox(
                  child: Text('submit', style: homePageGridValue),
                ),
              ),
            ),
            //Text('Rating 2: $rating2'),
          ],
        ),
      ),
    ));
  }
}
