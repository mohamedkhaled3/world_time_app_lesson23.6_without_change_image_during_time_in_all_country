// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ///////////////////////////////////////////////dart
  //🌹🌹
  String changeImageDuringTimeMorningOrNight =
      (DateTime.now().hour > 5 && DateTime.now().hour < 18)
          ? "day.png"
          : "night.png";

  // الحته الصايعه 😂😂 1
  Map receivedDataFromLoadingScreen = {}; // Empty
  ///////////////////////////////////////////////flutter
  @override
  Widget build(BuildContext context) {
    //🎁🎁🎁 recieved data from loading page "receivedDataFromLoadingScreen 🎁🎁🎁"
    // الحته الصايعه 😂😂 2
    //  receivedDataFromLoadingScreen = ModalRoute.of(context)!.settings.arguments as Map;
    // ( الحته الصايعه 😂😂 شرح ) first time is empty "true" and after setstate function is not empty "false"
    receivedDataFromLoadingScreen = (receivedDataFromLoadingScreen.isEmpty)
        ? ModalRoute.of(context)!.settings.arguments as Map
        : receivedDataFromLoadingScreen;

    //🎁🎁🎁{ "timeNow": "$timeNow", "location": "$timeZone" , "receivedDataFromLoadingScreen": "(day.png) && (night.png)"}
    return Scaffold(
      // remark always when use AppBar there exist 👈 refer to pop if we use Navigator.pop(context, {DATA}) so we
      appBar: AppBar(
        title: Text("home"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 55, 53, 63),
          image: DecorationImage(
              image: AssetImage(
                  "assets/${receivedDataFromLoadingScreen["changeImageDuringTimeMorningOrNight"]}"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  // 🎉🎉 result is received data from page2 "(end point) location🎉🎉"
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  print(result); // ?🎉🎉 { "timeNow": "...", "location": "..."}
                  setState(() {
                    // we use "result" here to update the screen
                    if (result == null) {
                      receivedDataFromLoadingScreen = {
                        "timeNow" :"❤❤❤",
                        "location":"please choose location 🤚",
                        ////🌹🌹
                        "changeImageDuringTimeMorningOrNight":
                            "$changeImageDuringTimeMorningOrNight"
                      };
                    } else {
                      receivedDataFromLoadingScreen = {
                        "timeNow": result["timeNow"],
                        "location": result["location"],
                        ////🌹🌹
                        "changeImageDuringTimeMorningOrNight":
                            "$changeImageDuringTimeMorningOrNight"
                      };
                    }
                    // print(receivedDataFromLoadingScreen); //{timeNow: 11:25 PM, location: Tunis}
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 255, 129, 129),
                  size: 24.0,
                ),
                label: Text(
                  "Edit Location",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(146, 90, 104, 223)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(22)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Container(
                color: Color.fromARGB(111, 0, 0, 0),
                padding: EdgeInsets.all(22),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${receivedDataFromLoadingScreen["timeNow"]}", /////////////////////////////////////
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "${receivedDataFromLoadingScreen["location"]}",
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
