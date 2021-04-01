import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

const weatherApiKey = 'e708230e83bde6b84165ad462b7a9fc0';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
    print('initState called');
  }

  void deactivate() {
    super.deactivate();
    print('deactivate called');
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$weatherApiKey');

    var weatherData = await networkHelper.getData();
  }

  void somethingThatExpectsLessThan10(int n) {
    //this is a throw example
    if (n > 10) {
      throw 'n is greater than 10, n should be less than 10';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
