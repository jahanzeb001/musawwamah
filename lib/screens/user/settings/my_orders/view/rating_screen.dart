import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../../../live_auction/controller/add_rating.dart';
import 'my_orders_screen.dart';

class RatingScreen extends StatefulWidget {
  String sellerid;
  String horseid;
  String sellername;
  String deliveryname;
  RatingScreen(
      {super.key,
      required this.sellerid,
      required this.horseid,
      required this.sellername,
      required this.deliveryname});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  TextEditingController seller = TextEditingController();
  TextEditingController dilaverboy = TextEditingController();
  double rating1 = 0.0;
  double rating2 = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.to(() => MyOrdersScreen());
              },
              child: Icon(Icons.fork_left)),
          title: Text('Rating Dialoug'),
        ),
        body: showRatingDialog(context, '92', '111', 'Alyar', 'M Khalid'));
  }

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
                    setState(() {
                      rating1 = newRating;
                    });
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
                    setState(() {
                      rating2 = newRating;
                    });
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
}
