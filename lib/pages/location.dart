// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:world_time_app/classes/getdata_class.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  ///////////////////////////////////////////////////dart
 List<AllCountries> allCountries = [
    AllCountries(link: 'Africa/Cairo', countryName: 'Egypt - Cairo', flag: 'egypt.png'),
    AllCountries(link: 'Africa/Tunis', countryName: 'Tunisia - Tunis', flag: 'tunisia.png'),
    AllCountries(link: 'Africa/Algiers',countryName: 'Algeria - Algiers', flag: 'algeria.png'),
    AllCountries(link: 'Australia/Sydney', countryName: 'Australia - Sydney', flag: 'australia.png'),
    AllCountries(link: 'America/Toronto', countryName: 'Canada - Toronto',flag: 'canada.png'),
    AllCountries(link: 'Asia/Riyadh', countryName: 'Saudi Arabia - Riyadh', flag: 'sa.png'),
];
  //////////////////////////////////////////////////flutter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 191, 199),
      appBar: AppBar(
        automaticallyImplyLeading: false, // to delete row "👈" to force user choose any option 
        backgroundColor: Color.fromARGB(146, 12, 16, 49),
        title: Text(
          "Choose Location",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount:
              allCountries.length, // loop for list with index 0 then 1 then..
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(7.0),
              child: Card(
                child: ListTile(
                  onTap: () async {
                    // 🤷‍♀️🤷‍♀️ we use it again in loading but with another named variable
                    AllCountries clickedCountry = allCountries[index];
                    await clickedCountry
                        .getData(); // remark we should use await && async fun..

                    //🎉🎉
                    Navigator.pop(context, {
                      "timeNow": "${clickedCountry.timeNow}",
                      "location": "${clickedCountry.timeZone}",
                    });
                  },
                  title: Text(
                    "${allCountries[index].countryName}",
                    style: TextStyle(fontSize: 22),
                  ),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/${allCountries[index].flag}"),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
