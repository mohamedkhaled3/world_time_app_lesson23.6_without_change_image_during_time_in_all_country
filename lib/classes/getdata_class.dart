import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class AllCountries {
 late DateTime realDatetime;
  String flag;
  String countryName;
  String link;
  AllCountries(
      {required this.flag, required this.countryName, required this.link});
  late String timeNow;
  late String timeZone;
  // use getData() in loading page & location page
  getData() async {
    try {
      Response receivedDataFromAPI =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$link"));
      Map receivedData = jsonDecode(receivedDataFromAPI.body);
      // print(receivedData["utc_offset"]); // map {key (string)  , value (string) }
      // print(receivedData["datetime"]);   //receivedData["datetime"] is string
      String datetime = receivedData["utc_datetime"];
      // print(datetime); //2022-10-08T11:48:34.900268+00:00
      String offset = receivedData["utc_offset"];
      // print(offset); //+02:00
      // we need to convert string  into datetime  for datetime
      realDatetime = DateTime.parse(datetime);
      // print(realDatetime); //2022-10-08 11:48:34.900Z && print(realDatetime.hour); // 11
      //we need to convert string  into int for offset
      // 1:- error method

      // ERROE IS : FormatException: +02:00
      // int intOffset = int.parse(offset);
      // print(intOffset);

      // 2 :- right method  +02:00 we need only +02 to can be int
      // remark final index  مش معايا 😂😂 وبس كده
      //  compiler see and write 😂😂 +2 = 2 & -2 = -2

      offset = offset.substring(0, 3);
      int intOffset = int.parse(offset);
      // print(intOffset); //2

      // finally make duration to add dataTime to duaration
      Duration spanOfTime = Duration(
        hours: intOffset,
      );
      // print(spanOfTime); //2:00:00.000000
      // add dataTime to duaration
      DateTime realTime = realDatetime.add(spanOfTime);
      // print(realTime); //2022-10-08 13:48:34.900Z
      // convert time from 2022-10-08 00:42:52.918Z to 12:52 AM or {06:42 pm}😂😂😂

      /// important that use in another screen
      timeNow = DateFormat('hh:mm a').format(realTime);
      // print(DateFormat('hh:mm a').format(realTime)); // 01:48 PM by using package of time "intl" ❤❤👀👀

      timeZone = receivedData["timezone"];
      // print(receivedData["timezone"]); // Africa/Cairo ❤❤👀👀

      // // thoes code belong to loading only
      // // Navigator.pushNamed(context, '/home');
      // // use pushReplacementNamed to remove first page from stack and
      // // data see outomatically in any page by using this code 🎁🎁🎁 inside page
      // Navigator.pushReplacementNamed(context, '/home', arguments: {
      //   "timeNow": "$timeNow",
      //   "location": "$timeZone",
      //   "changeImageDuringTimeMorningOrNight": "$changeImageDuringTimeMorningOrNight"
      // });
    } catch (e) {
      print("ERROE IS : $e");
    }
  }
}
