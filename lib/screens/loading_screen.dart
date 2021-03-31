import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    getLocation();
    print('initState called');
  }

  void deactivate() {
    super.deactivate();
    print('deactivate called');
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    getData();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$weatherApiKey'));
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      double temperature = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];

      print('Temperature: $temperature');
      print('Condition: $condition');
      print('CityName: $cityName');
    } else {
      print(response.statusCode);
    }
  }

  void somethingThatExpectsLessThan10(int n) {
    //this is a throw example
    if (n > 10) {
      throw 'n is greater than 10, n should be less than 10';
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
