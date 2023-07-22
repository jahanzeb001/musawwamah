import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
  initializeDateFormatting("ar_SA").then((_) {
    DateTime currentTime = DateTime.now().toUtc().add(Duration(hours: 3)); // Adjust for Saudi Arabia time zone
    String formattedTime = DateFormat('HH:mm:ss', 'en_PK').format(currentTime);
    print(formattedTime);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String timeString = "12:34:56";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parse Time String"),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ElevatedButton(onPressed: (){
      parseTime();
      }, child: Text("Click")),
      // Text(
      //   "Parsed Time: ${formattedTime}",
      // ),
      ],
    ),)
    ,
    );
  }

  void parseTime() {
    DateTime currentTime = DateTime.now();
    String formattedTime = DateFormat('HH:mm:ss', 'ar_SA').format(currentTime);
    print(formattedTime);
  }

// String parseTimeString(String timeString) {
//   List<String> parts = timeString.split(':');
//
//   int hours = int.parse(parts[0]);
//   int minutes = int.parse(parts[1]);
//   int seconds = int.parse(parts[2]);
//
//   Duration duration = Duration(hours: hours, minutes: minutes, seconds: seconds);
//
//   return duration.toString();
// }
}
