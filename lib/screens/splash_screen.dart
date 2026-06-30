import 'package:flutter/material.dart';
import 'dart:async';
import 'language_screen.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LanguageScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFD329),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //  BIG ANIMATION GIF
            Expanded(
              flex: 18,
              child: Center(
                child: Image.asset(
                  'assets/animation3.gif',   // oUR GIF
                  width: width * 1.4,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            //  TAGLINE TEXT
        SizedBox(
          height: height * 0.20,
          child: Transform.translate(
            offset: Offset(0, -120), // increase to move text more up
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: Text(
                  "APNA METER,\nAPNI KAMAI!",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'InriaSerif',
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    letterSpacing: -0.4,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
        ),
          ],
        ),
      ),
    );
  }
}