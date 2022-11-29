// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes
import 'package:rain/Screens/city_screen.dart';
import 'package:rain/Services/weather.dart';
import 'package:rain/constants.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class LoactionScreen extends StatefulWidget {
  final weatherLoaction;
  LoactionScreen({this.weatherLoaction});
  @override
  State<LoactionScreen> createState() => _LoactionScreenState();
}

class _LoactionScreenState extends State<LoactionScreen> {
  WeatherModel wm = WeatherModel();
  var Temperature;
  var weatherIcon;
  var CityName;
  var weatherText;
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherLoaction);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        Temperature = 0;
        weatherIcon = '❗';
        CityName = 'your location';
        weatherText = 'Unable to get weather';
        return;
      } else {
        double temp = weatherData['main']['temp'];
        Temperature = temp.toInt();
        // print(Temperature);
        var Condition = weatherData['weather'][0]['id'];
        // print(Condition);
        CityName = weatherData['name'];
        // print(CityName);
        weatherIcon = wm.getWeatherIcon(Condition);
        weatherText = wm.getMessage(Temperature);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/loaction.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.dstATop),
        ),
      ),
      constraints: BoxConstraints.expand(),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton(
                onPressed: () async {
                  var weatherData = await WeatherModel().getWeatherLocation();
                  updateUI(weatherData);
                },
                child: Icon(
                  Icons.near_me,
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
              TextButton(
                onPressed: () async {
                  var typedName = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CityScreen();
                      },
                    ),
                  );
                  if (typedName != null) {
                    var cityWeather = await wm.getCityWeather(typedName);
                    updateUI(cityWeather);
                  }
                },
                child: Icon(
                  Icons.location_city,
                  size: 50.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                DefaultTextStyle(
                  style: kTempTextStyle,
                  child: Text(
                    '$Temperature°',
                    style: kTempTextStyle,
                  ),
                ),
                DefaultTextStyle(
                  style: kConditionTextStyle,
                  child: Text(
                    weatherIcon,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: DefaultTextStyle(
              style: kMessageTextStyle,
              child: Text(
                '$weatherText in $CityName',
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
