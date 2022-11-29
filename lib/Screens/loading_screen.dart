// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rain/Screens/loaction_screen.dart';
import 'package:rain/Services/location.dart';
import 'package:rain/Services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'ae9750393458a8e0cc968a82434a7ca4';

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
    Location location = Location();
    await location.getCurrentLoaction();
    latitude = location.latitude;
    longitude = location.longitude;

    try {
      network net = network(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

      var WeatherData = await net.getData();

      // var temperature = decodedData['main']['temp'];
      // print(temperature);
      // var condition = decodedData['weather'][0]['id'];
      // print(condition);
      // var name = decodedData['name'];
      // print(name);

      Navigator.push(context, MaterialPageRoute(builder: ((context) {
        return LoactionScreen();
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
