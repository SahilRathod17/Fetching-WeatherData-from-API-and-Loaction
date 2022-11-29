import 'package:rain/Services/location.dart';
import 'package:rain/Services/networking.dart';

const apiKey = ''; //use your own API Key

class WeatherModel {
  Future<dynamic> getCityWeather(String CityName) async {
    network net = network(
        'https://api.openweathermap.org/data/2.5/weather?q=$CityName&appid=$apiKey&units=metric');
    var WeatherData = await net.getData();

    return WeatherData;
  }

  Future<dynamic> getWeatherLocation() async {
    Location location = Location();
    await location.getCurrentLoaction();

    network net = network(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var WeatherData = await net.getData();

    return WeatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
