import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
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
    print(location.latitude);
    print(location.longitude);
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
