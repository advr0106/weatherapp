import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';

class WeatherModel {
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey = 'edc2e7d59423ce1113860a21101c0f93';

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentPosition();

    Networking networking = Networking(
        url: '$baseUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networking.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherDataByCity(String cityName) async {
    Networking networking = Networking(
        url: '$baseUrl?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networking.getData();
    return weatherData;
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
