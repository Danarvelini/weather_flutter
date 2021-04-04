import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

const weatherApiKey = 'e708230e83bde6b84165ad462b7a9fc0';
const openWeatherURL = '';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$weatherApiKey&units=metric');

    var weatherData = await networkHelper.getData();
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
      return "It's 🍦 time";
    } else if (temp > 20) {
      return "Get your summer clothes";
    } else if (temp < 10) {
      return "You'll need 🧣 and 🧤";
    } else {
      return "Get your coat, you never know";
    }
  }
}
