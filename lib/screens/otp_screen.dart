import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../utils/app_text.dart';
import 'document_upload_screen.dart';
class OTPScreen extends StatefulWidget {
  final String verificationId;
  final String phone;

  OTPScreen({required this.verificationId, required this.phone});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  TextEditingController otpController =
  TextEditingController();



  @override
  void dispose() {

    otpController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),



      bottomNavigationBar: Container(
        height: 99,
        width: double.infinity,
        color: const Color(0xFF3C3A3A),

        child: Center(
          child: SizedBox(
            width: 290,
            height: 51,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD9D9D9),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),

              onPressed: () async {

                String otp = otpController.text;

                if (otp.length != 6) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        AppText.getText("Enter valid 6-digit OTP"),
                      ),
                    ),
                  );
                  return;
                }

                if (otp == "123456") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DocumentUploadScreen(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                      content: Text("Invalid OTP"),
                    ),
                  );
                }
              },

              child:Text(AppText.getText
                ("Verify"),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(

          child: SingleChildScrollView(
            child: Column(
              children: [



                /// TOP BAR
                Container(
                  height: 99,
                  width: double.infinity,
                  color: const Color(0xFFFFD329),

                  child: Row(
                    children: [

                      const SizedBox(width: 10),

                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 35,
                          color: Colors.black,
                        ),
                      ),

                       Expanded(
                        child: Text(AppText.getText
                          ("Registration"),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Geologica',
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            letterSpacing: 0,
                          ),
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none,
                          size: 28,
                          color: Colors.black,
                        ),
                      ),

                    ],
                  ),
                ),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 36,
              ),
              child: Column(
                children: [

                SizedBox(height: size.height * 0.08),

                /// OTP ICON
                CircleAvatar(
                  radius: size.width * 0.10,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.verified_user_outlined,
                    size: size.width * 0.10,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: size.height * 0.020),

                Text(AppText.getText(
                  "Verify OTP"),
                  style: TextStyle(
                    fontSize: size.width * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                Text(AppText.getText(
                  "Enter your 6 digit code sent to your registered phone number."),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: size.height * 0.04),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppText.getText("Enter OTP"),
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.02),

                /// OTP BOXES
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: otpController,
                  keyboardType: TextInputType.number,

                  animationType: AnimationType.fade,

                  textStyle: TextStyle(
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),

                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),

                    fieldHeight: 55,
                    fieldWidth: 48,

                    activeColor: Colors.white,
                    selectedColor: Colors.white,
                    inactiveColor: Colors.white,

                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                  ),

                  enableActiveFill: true,

                  onChanged: (value) {
                    if (value.length == 6) {
                      FocusScope.of(context).unfocus();
                    }
                  },
                ),

                SizedBox(height: size.height * 0.03),

                  Center(
                    child: SizedBox(
                      width: 103,
                      height: 35,
                      child: OutlinedButton(
                        onPressed: () {
                          // TODO Resend OTP
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xFFD9D9D9),
                          side: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.5),
                          ),
                        ),
                        child:Text(AppText.getText("Resend"),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inria Serif',
                          ),
                        ),
                      ),
                    ),
                  ),

                SizedBox(height: size.height * 0.15),

                /// VERIFY BUTTON

                  ],
                ), // inner Column
            ), // Container
              ], // outer Column children
            ), // outer Column
          ), // SingleChildScrollView
      ), // SafeArea
    );
  }
}