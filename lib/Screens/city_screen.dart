// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rain/constants.dart';

// ignore: use_key_in_widget_constructors
class CityScreen extends StatefulWidget {
  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? CityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/city2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  // ignore: prefer_const_constructors
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    CityName = value;
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter City Name',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 25.0,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, CityName);
                },
                // ignore: prefer_const_constructors
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
