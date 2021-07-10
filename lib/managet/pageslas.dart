import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blog/home.dart';
import 'package:blog/managet/getsate.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Loding extends StatefulWidget {
  @override
  _LodingState createState() => _LodingState();
}

class _LodingState extends State<Loding> {
  @override
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SplashScreen(
      seconds: 5,
      photoSize: 120,
      navigateAfterSeconds: Home(),
      image: Image.asset(
        'assets/logo1.png',
        height: 500,
        width: 500,
      ),
      backgroundColor: Colors.white,
      loaderColor: Colors.redAccent,
      loadingText: Text(
        'Stream News',
        style: TextStyle(
          fontFamily: "Raleway",
          fontSize: 17,
          fontWeight: FontWeight.w900,
          color: Colors.orange,
        ),
      ),
      useLoader: true,
    ));
  }
}
