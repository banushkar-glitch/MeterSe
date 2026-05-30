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

    Timer(Duration(seconds: 3), () {
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
      backgroundColor: Color(0xFFE3C65A),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //  BIG ANIMATION GIF
            Expanded(
              flex: 7,
              child: Center(
                child: Image.asset(
                  'assets/animation1.gif',   // oUR GIF
                  width: width * 0.75,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            //  TAGLINE TEXT
            Expanded(
              flex: 3,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                  child: Text(
                    "APNA METER,\nAPNI KAMAI!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: width * 0.08,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
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