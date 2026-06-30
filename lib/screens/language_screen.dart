import 'package:flutter/material.dart';
import 'package:metersaydriver_app/screens/home_screen.dart';
import '../utils/app_text.dart';
class LanguageScreen extends StatelessWidget {
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

            SizedBox(height: height * 0.12),

            Container(
              width: width * 0.55,
              height: width * 0.55,
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: height * 0.07),


            // 🔹 LANGUAGE BUTTON FUNCTION
            _langButton(context, "ENGLISH", width, height),
            SizedBox(height: height * 0.03),

            _langButton(context, "हिंदी", width, height),
            SizedBox(height: height * 0.03),

            _langButton(context, "मराठी", width, height),

          ],
        ),
      ),
    );
  }

  // 🔥 BUTTON WIDGET
  Widget _langButton(BuildContext context, String text, double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[300],
            foregroundColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 5,
          ),
          onPressed: () {

            // 🔥 TODO: SAVE LANGUAGE (API / LOCAL STORAGE)
            print("Selected Language: $text");
            // 👉 GO TO HOME SCREEN
              AppText.selectedLanguage = text;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: width * 0.05,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}