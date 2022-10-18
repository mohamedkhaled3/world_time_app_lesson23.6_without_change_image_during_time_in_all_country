// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:world_time_app/classes/getdata_class.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //////////////////////////////////////////////////////////////////////////dart
  // we use late if use summary condition (condition) ? true : false
  ////🌹🌹
  String changeImageDuringTimeMorningOrNight =
      (DateTime.now().hour > 5 && DateTime.now().hour < 18)
          ? "day.png"
          : "night.png";

  getDataOfLoadingPage() async {
    // info. about Time 🤷‍♀️🤷‍♀️ we use it again in location but with another named variable
    AllCountries oneCountry = AllCountries(countryName: "...jj",flag: "...j",link: "Africa/Cairo");
  
    await oneCountry.getData(); // remark we should use await && async fun..
    // Navigator.pushNamed(context, '/home');
    // use pushReplacementNamed to remove first page from stack and
    // data see outomatically in any page by using this code 🎁🎁🎁 inside page
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "timeNow": "${oneCountry.timeNow}",
      "location": "${oneCountry.timeZone}",
      ////🌹🌹
      "changeImageDuringTimeMorningOrNight":
          "$changeImageDuringTimeMorningOrNight"
    });
  }

//called once when your app is starting for the first time
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataOfLoadingPage();
  }
  //////////////////////////////////////////////////////////////////////////flutter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: Color.fromARGB(146, 12, 16, 49),
              size: 160.0,
            ),
          ],
        ),
      ),
    );
  }
}
