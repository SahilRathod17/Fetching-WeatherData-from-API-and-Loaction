// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rain/Screens/loaction_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rain/Services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    getLoactionData();
  }

  void getLoactionData() async {
    try {
      var weatherData = await WeatherModel().getWeatherLocation();
      Navigator.push(context, MaterialPageRoute(builder: ((context) {
        return LoactionScreen(
          weatherLoaction: weatherData,
        );
      })));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
