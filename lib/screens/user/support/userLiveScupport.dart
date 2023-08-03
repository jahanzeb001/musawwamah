// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:obaiah_mobile_app/Payments/color_manager.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../Payments/theme_controller.dart';
import '../../../reusable_widgets/reusable_appbar.dart';
import '../../../utils/text_styles/textstyles.dart';

class UserliveSupport extends StatefulWidget {
  @override
  State<UserliveSupport> createState() => _UserliveSupportState();
}

class _UserliveSupportState extends State<UserliveSupport> {
  final ScrollController listScrollController = ScrollController();
  TextEditingController _userChat = TextEditingController();
  ThemeController themeController = Get.put(ThemeController());
  List<Map<String, dynamic>> data = [
    {
      'message': 'How we can submit a biding',
      'role': 'user',
      'time': '2023-08-03 17:25:32.636119',
      'isChecked': true
    },
    {
      'message':
          'Go to auction screen and click add bid and then pay some amount',
      'role': 'admin',
      'time': '2023-08-03 17:26:41.741607',
      'isChecked': true
    },
    {
      'message': 'how much we can a bid?',
      'role': 'user',
      'time': '2023-08-03 17:27:48.687614',
      'isChecked': true
    },
    {
      'message': 'you can highest bid for other bidder',
      'role': 'admin',
      'time': '2023-08-03 17:28:56.850373',
      'isChecked': true
    },
    {
      'message': 'Thanks for Your Response',
      'role': 'user',
      'time': '2023-08-03 17:30:01.626679',
      'isChecked': false
    }
  ];
  // final _messageQuery = FirebaseFirestore.instance
  //     .collection(AuthConstants.supportCollectionName)
  //     .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
  //     .collection(AuthConstants.messagesCollectionName)
  //     .orderBy('sendingTime', descending: true)
  //     .snapshots();

  void addDataToList() {
    var currentTimeStamp = DateTime.now().toString();
    Map<String, dynamic> newData = {
      'message': '${_userChat.text}',
      'role': 'user',
      'time': '${DateTime.now()}',
      'isChecked': false,
    };
    data.add(newData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final userliveSupportController = Get.find<UserliveSupportController>();
    TextEditingController userliveSupportController = TextEditingController();
    return Scaffold(
      appBar: ReusableAppBar(
        onPressFunction: () {},
        titleText: "Customer Services",
        textStyle: onyx520,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 8),
                          padding: EdgeInsets.only(top: 30),
                          child: data[index]['role'] == 'admin'
                              ? Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      width: double.infinity,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: cCheckBackground,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          data[index]['message'],
                                          style: TextStyle(
                                              fontFamily: 'Tajawal',
                                              color: cBlackColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child:
                                              data[index]['isChecked'] == true
                                                  ? Icon(MdiIcons.checkAll,
                                                      color: Colors.red)
                                                  : Icon(MdiIcons.checkAll),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(''),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(data[index]['time'])),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              : Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      width: double.infinity,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: cPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          data[index]['message'],
                                          style: TextStyle(
                                              fontFamily: 'Tajawal',
                                              color: cBlackColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(data[index]['time'])),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child:
                                              data[index]['isChecked'] == true
                                                  ? Icon(MdiIcons.checkAll,
                                                      color: Colors.red)
                                                  : Icon(MdiIcons.checkAll),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                        );
                      })),
            ),
            //Message TextField
            Container(
              height: 70,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 7,
                            child: Container(
                              decoration: BoxDecoration(),
                              child: TextFormField(
                                controller: _userChat,
                                textAlignVertical: TextAlignVertical.center,
                                style: const TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: appBarTextColor),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                      borderSide: BorderSide(
                                        width: 5,
                                        color: themeController.isDarkMode
                                            ? ColorUtilities.dark_100
                                            : Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                      borderSide: BorderSide(
                                        width: 3,
                                        color: themeController.isDarkMode
                                            ? ColorUtilities.dark_100
                                            : Colors.white,
                                      ),
                                    ),
                                    hintText: 'Add Reply'.tr,
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        fontFamily: 'Tajawal',
                                        color: themeController.isDarkMode
                                            ? ColorUtilities.white
                                            : black),
                                    prefixIconColor: Colors.black,
                                    isDense: true,
                                    filled: true,
                                    fillColor: themeController.isDarkMode
                                        ? ColorUtilities.dark_100
                                        : white,
                                    isCollapsed: false,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15)),
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: GestureDetector(
                              onTap: () {
                                addDataToList();
                                _userChat.clear();
                                // listScrollController.animateTo(0,
                                //     duration: Duration(milliseconds: 300),
                                //     curve: Curves.easeOut);
                                // userliveSupportController.sendMessageToSupport(
                                //     userDocumentId: FirebaseAuth
                                //         .instance.currentUser!.phoneNumber!,
                                //     message: text);
                                // userliveSupportController.messageController
                                //     .clear();
                              },
                              child: Container(
                                width: double.infinity,
                                height: 53,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    color: themeController.isDarkMode
                                        ? ColorUtilities.dark_100
                                        : white),
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.send)

                                    //   Image(
                                    //     image: AssetImage('assets/sendmessage.png'),
                                    //     height: 20,
                                    //     width: 18,
                                    //     color: themeController.isDarkMode
                                    //         ? ColorUtilities.white
                                    //         : lightprimarycolor,
                                    //   ),
                                    // ),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserResponseContainer extends StatelessWidget {
  ThemeController themeController = Get.find(tag: ThemeController().toString());
  String message;
  DateTime dateTime;

  UserResponseContainer({required this.message, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: MediaQuery.of(context).size.width * 1,
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: themeController.isDarkMode
                  ? Color.fromARGB(255, 250, 245, 245)
                  : Color(0XFF545454).withOpacity(0.5)),
          child: Text(
            message,
            overflow: TextOverflow.ellipsis,
            maxLines: 30,
          ),
        ),
        SizedBox(
          height: 7,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Me ${DateFormat('d-MM-yyyy').format(dateTime)}   ${DateFormat.Hms().format(dateTime)}',
                style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: themeController.isDarkMode ? white : black),
              ),
            ))
      ],
    );
  }
}

class SupportResponseContainer extends StatelessWidget {
  ThemeController themeController = Get.find(tag: ThemeController().toString());
  String message;
  DateTime dateTime;

  SupportResponseContainer({required this.message, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: themeController.isDarkMode
                  ? Color.fromARGB(255, 201, 195, 195)
                  : Color(0XFF545454).withOpacity(0.1)),
          child: Text(
            message,
            overflow: TextOverflow.ellipsis,
            maxLines: 30,
          ),
        ),
        SizedBox(
          height: 7,
        ),
        Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '      Support   ${DateFormat('d-MM-yyyy').format(dateTime)}   ${DateFormat.Hms().format(dateTime)}',
                style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: themeController.isDarkMode ? white : black),
              ),
            ))
      ],
    );
  }
}

class Tickernumberheader extends StatelessWidget {
  String boxtitle;
  String boxdata;

  Tickernumberheader({required this.boxtitle, required this.boxdata});

  ThemeController themeController = Get.find(tag: ThemeController().toString());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          boxtitle,
          style: auctionMediumPrimaryTextStyle,
        ),
        Container(
          height: 44,
          width: 93,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: themeController.isDarkMode
                ? Color.fromARGB(255, 250, 245, 245)
                : lightprimarycolor,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Text(
            boxdata,
            style: auctionMediumPrimaryTextStyle,
          ),
        ),
      ],
    );
  }
}
