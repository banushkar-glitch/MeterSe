import 'package:flutter/material.dart';
import 'driver_signin_screen.dart';
import 'login_screen.dart';
import 'language_screen.dart';
import '../utils/app_text.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFD329),

      body: SafeArea(
        child: Column(
          children: [

            //  MAIN CONTENT
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(height: height * 0.12),

                      Container(
                        width: width * 0.55,
                        height: width * 0.55,
                        child: Image.asset(
                          'assets/logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),


                      SizedBox(height: height * 0.08),

                      //  LOGIN BUTTON
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                        child: SizedBox(
                          width: width * 0.6,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: height * 0.02),
                            ),
                            child: Text(
                              AppText.getText("Login"),
                              style: TextStyle(
                                fontSize: width * 0.045,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: height * 0.02),

                      //  CREATE ACCOUNT
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                        child: SizedBox(
                          width: width * 0.6,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DriverSigninScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: height * 0.02),
                            ),
                            child: Text(
                              AppText.getText("Create Account"),
                              style: TextStyle(
                                fontSize: width * 0.045,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //  BOTTOM LEFT BACK BUTTON
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.05,
                bottom: height * 0.02,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LanguageScreen(),
                        ),
                      );

                    },
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