import 'package:flutter/material.dart';
import 'aadhaar_verification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId;
  final String phone;

  OTPScreen({required this.verificationId, required this.phone});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  final List<TextEditingController> controllers =
  List.generate(6, (index) => TextEditingController());

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE3C65A),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
          ),

          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: size.height * 0.02),

                /// TOP BAR
                Row(
                  children: [

                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: size.width * 0.07,
                        color: Colors.black,
                      ),
                    ),

                    Expanded(
                      child: Text(
                        "Welcome Back!!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        // TODO Notification Screen
                      },
                      icon: Icon(
                        Icons.notifications_none,
                        size: size.width * 0.065,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.02),

                /// OTP ICON
                CircleAvatar(
                  radius: size.width * 0.08,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.verified_user_outlined,
                    size: size.width * 0.09,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: size.height * 0.015),

                Text(
                  "Verify Otp",
                  style: TextStyle(
                    fontSize: size.width * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: size.height * 0.01),

                Text(
                  "Enter your 6 digit code sent to your\nregister phone number",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.width * 0.03,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: size.height * 0.04),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter OTP",
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.02),

                /// OTP BOXES
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: size.width * 0.12,
                      height: size.width * 0.12,

                      child: TextField(
                        style: TextStyle(
                          fontSize: size.width * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        controller: controllers[index],
                        keyboardType:
                        TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,

                        decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          fillColor: Colors.white,

                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(
                                10),
                            borderSide:
                            BorderSide.none,
                          ),

                          enabledBorder:
                          OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(
                                10),
                            borderSide:
                            BorderSide.none,
                          ),
                        ),

                        onChanged: (value) {
                          if (value.length == 1 &&
                              index < 5) {
                            FocusScope.of(context)
                                .nextFocus();
                          }
                        },
                      ),
                    );
                  }),
                ),

                SizedBox(height: size.height * 0.03),

                Align(
                  alignment: Alignment.centerLeft,
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO Resend OTP
                    },

                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(20),
                      ),
                    ),

                    child: const Text("Resend"),
                  ),
                ),

                SizedBox(height: size.height * 0.15),

                /// VERIFY BUTTON
                SizedBox(
                  width: double.infinity,
                  height: size.height * 0.055,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(0xFF5B5555),

                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                            10),
                      ),
                    ),

                    onPressed: () async {

                      String otp =
                      controllers
                          .map((c) => c.text)
                          .join();

                      if (otp.length != 6) {
                        ScaffoldMessenger.of(
                            context)
                            .showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Enter valid 6-digit OTP"),
                          ),
                        );
                        return;
                      }

                      if (otp == "123456") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AadhaarVerificationScreen(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(
                            context)
                            .showSnackBar(
                          const SnackBar(
                            content:
                            Text("Invalid OTP"),
                          ),
                        );
                      }
                    },

                    child: Text(
                      "Verify OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:
                        size.width * 0.035,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}