import 'package:flutter/material.dart';

class TryCatch extends StatefulWidget {
  @override
  _TryCatchState createState() => _TryCatchState();
}

class _TryCatchState extends State<TryCatch> {
  @override
  Widget build(BuildContext context) {
    String myMargin = 'dwa';
    double myMarginAsDouble;
    try {
      myMarginAsDouble = double.parse(myMargin);
    } catch (e) {
      print(e);
    }
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(myMarginAsDouble ?? 30.0),
        color: Colors.red,
      ),
    );
  }
}
