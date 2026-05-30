import 'package:flutter/material.dart';
import 'resetforgotpass_screen.dart';
import 'login_screen.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {

  final TextEditingController phoneController =
  TextEditingController();

  final List<TextEditingController> otpControllers =
  List.generate(
    6,
        (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFE4C766),

      body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior:
            ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
          ),

          child: Column(
            children: [

              SizedBox(height: size.height * 0.02),

              /// 🔹 HEADER
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children:  [

                  IconButton(
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );

                    },

                    icon: Icon(
                      Icons.arrow_back,
                      size: size.width * 0.09,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Icon(
                    Icons.notifications_none,
                    size: 30,
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.025),

              /// 🔹 TOP ICON
              Column(
                children: const [

                  CircleAvatar(
                    radius: 42,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.lock_reset,
                      size: 45,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Forgot your password?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Enter your register phone number",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.025),

              /// 🔹 CARD

                  Container(
                  width: double.infinity,

                  padding: EdgeInsets.all(
                    size.width * 0.05,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius:
                    BorderRadius.circular(20),
                  ),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      /// RESET VIA
                      const Text(
                        "Reset via",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      /// PHONE OPTION
                      Row(
                        children: const [

                          CircleAvatar(
                            radius: 28,
                            backgroundColor:
                            Colors.white,
                            child: Icon(
                              Icons.phone,
                              size: 28,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(width: 20),

                          Text(
                            "Phone Number",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                              FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: size.height * 0.03,
                      ),

                      Divider(
                        color: Colors.grey.shade400,
                      ),

                      SizedBox(
                        height: size.height * 0.03,
                      ),

                      /// PHONE LABEL
                      const Text(
                        "Phone Number",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                          FontWeight.w500,
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.015,
                      ),

                      /// PHONE FIELD
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                          borderRadius:
                          BorderRadius.circular(14),
                        ),

                        child: Row(
                          children: [

                            /// COUNTRY CODE
                            Container(
                              padding:
                              EdgeInsets.symmetric(
                                horizontal:
                                size.width * 0.03,
                                vertical:
                                size.height * 0.02,
                              ),

                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color:
                                    Colors.grey.shade400,
                                  ),
                                ),
                              ),

                              child: Row(
                                children: const [

                                  Text(
                                    "🇮🇳",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),

                                  SizedBox(width: 5),

                                  Text(
                                    "+91",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /// NUMBER INPUT
                            Expanded(
                              child: TextField(
                                controller:
                                phoneController,

                                keyboardType:
                                TextInputType.phone,

                                decoration:
                                const InputDecoration(
                                  hintText:
                                  "Enter phone number",
                                  border:
                                  InputBorder.none,
                                  contentPadding:
                                  EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.04,
                      ),

                      /// OTP LABEL
                      /// OTP + SEND OTP
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                        children: [

                          const Text(
                            "Enter OTP",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                              FontWeight.w500,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {

                              print("Send OTP Clicked");

                            },

                            child: const Text(
                              "Send OTP",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      /// OTP BOXES
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                        children: List.generate(
                          6,
                              (index) => SizedBox(
                            width: size.width * 0.11,

                            child: TextField(
                              controller: otpControllers[index],

                              keyboardType: TextInputType.number,

                              textAlign: TextAlign.center,

                              maxLength: 1,

                              decoration: InputDecoration(
                                counterText: "",

                                filled: true,
                                fillColor: Colors.white,

                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(12),

                                  borderSide: BorderSide(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),

                              onChanged: (value) {

                                // ✅ MOVE TO NEXT BOX
                                if (value.isNotEmpty && index < 5) {
                                  FocusScope.of(context).nextFocus();
                                }

                                // ✅ MOVE BACK TO PREVIOUS BOX
                                if (value.isEmpty && index > 0) {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


              SizedBox(height: size.height * 0.03),

              /// 🔹 BUTTON
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const ResetForgotPassScreen(),
                      ),
                    );

                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color(0xFF4A423F),

                    padding: EdgeInsets.symmetric(
                      vertical:
                      size.height * 0.02,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(16),
                    ),
                  ),

                  child: const Text(
                    "Verify OTP",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
       ),
      ),
    );
  }
}

/// 🔹 OTP BOX REUSABLE
class OTPBox extends StatelessWidget {

  final TextEditingController controller;

  const OTPBox({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.11,

      child: TextField(
        controller: controller,

        keyboardType: TextInputType.number,

        textAlign: TextAlign.center,

        maxLength: 1,

        decoration: InputDecoration(
          counterText: "",

          filled: true,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(12),

            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ),
    );
  }
}