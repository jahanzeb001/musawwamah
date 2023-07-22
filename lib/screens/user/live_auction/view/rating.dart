import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../utils/colors/colors.dart';
import '../../../../utils/text_styles/textstyles.dart';
import '../controller/add_rating.dart';

class MyWidget extends StatelessWidget {
  void _showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('Obeiah App'),

          content: RatingDialogContent(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rating Dialog'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Show Rating Dialog'),
          onPressed: () => _showRatingDialog(context),
        ),
      ),
    );
  }
}

class RatingDialogContent extends StatefulWidget {
  @override
  _RatingDialogContentState createState() => _RatingDialogContentState();
}

class _RatingDialogContentState extends State<RatingDialogContent> {
  TextEditingController seller = TextEditingController();
  TextEditingController dilaverboy = TextEditingController();
  double rating1 = 0.0;
  double rating2 = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text('Seller',
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
                borderRadius: BorderRadius.circular(10), color: cPrimaryColor),
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
                  child: Text('Delivery',
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
                borderRadius: BorderRadius.circular(10), color: cPrimaryColor),
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
                  userId: 70,
                  horseid: '70',
                  sellerating: rating1,
                  deliverrating: rating2,
                  sellercomment: seller.text,
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
    );
  }
}
