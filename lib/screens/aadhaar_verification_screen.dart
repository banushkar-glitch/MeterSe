import 'package:flutter/material.dart';
import 'document_upload_screen.dart';

class AadhaarVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFE3C65A),

      body: SafeArea(
        child: Stack(
          children: [

            // 🔹 MAIN CONTENT (UNCHANGED)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),

              child: Column(
                children: [

                  SizedBox(height: height * 0.08),

                  // TITLE TEXT
                  Text(
                    "Welcome, Please fill out your\n"
                        "details to activate your account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: height * 0.08),

                  // PAN CARD FIELD
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Pan Card No.",
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  // AADHAAR FIELD
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Adhaar Card no.",
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  // AUTHENTICATE BUTTON
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.1,
                        vertical: height * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () {
                      // 🔥 TODO: Aadhaar API
                    },
                    child: Text(
                      "Authenticate Aadhaar Card",
                      style: TextStyle(fontSize: width * 0.04),
                    ),
                  ),

                  SizedBox(height: height * 0.06),

                  // OTP FIELD
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "OTP",
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  // VERIFY BUTTON
                  TextButton(
                    onPressed: () {
                      print("Verify clicked");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DocumentUploadScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Verify",
                      style: TextStyle(
                        fontSize: width * 0.05,
                        letterSpacing: 2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 🔙 BACK BUTTON (BOTTOM LEFT)
            Positioned(
              bottom: height * 0.02,
              left: width * 0.05,
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}