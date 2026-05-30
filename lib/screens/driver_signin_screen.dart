import 'package:flutter/material.dart';
import 'otp_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DriverSigninScreen extends StatefulWidget {
  @override
  _DriverSigninScreenState createState() => _DriverSigninScreenState();
}

class _DriverSigninScreenState extends State<DriverSigninScreen> {

  // 🔹 CONTROLLERS
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // 🔥 API FUNCTION
  Future<bool> registerDriver() async {
    final url = Uri.parse("http://192.168.0.34:5000/api/driver/register");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": nameController.text,
          "phone": phoneController.text,
          "password": passwordController.text,
        }),
      );

      print("STATUS: ${response.statusCode}");
      print("BODY: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final loginResponse = await http.post(
          Uri.parse("http://192.168.0.34:5000/api/driver/login"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "phone": int.tryParse(phoneController.text.trim()),
            "password": passwordController.text.trim(),
          }),
        );

        print("LOGIN STATUS: ${loginResponse.statusCode}");
        print("LOGIN BODY: ${loginResponse.body}");

        if (loginResponse.statusCode == 200) {

          final loginData = jsonDecode(loginResponse.body);

          final prefs = await SharedPreferences.getInstance();

          await prefs.setString(
            'jwt_token',
            loginData['token'],
          );

          print("TOKEN SAVED: ${loginData['token']}");
        }
        return true;

      } else {
        return false;
      }
    } catch (e) {
      print("ERROR: $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFE3C65A),

        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height * 0.01,
            ),
            child: Column(
              children: [

                /// TOP BAR
                Row(
                  children: [

                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),

                    Expanded(
                      child: Text(
                        "Registration",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.05),

                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,

                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05,
                        vertical: height * 0.03,
                      ),

                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: Column(
                        children: [

                          Icon(
                            Icons.assignment_outlined,
                            size: width * 0.16,
                            color: Colors.black54,
                          ),

                          SizedBox(
                            height: height * 0.03,
                          ),

                          /// NAME
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Name",
                              style: TextStyle(
                                fontSize: width * 0.032,
                              ),
                            ),
                          ),

                          SizedBox(height: height * 0.008),

                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: "Enter Name",
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon:
                              const Icon(Icons.person_outline),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          SizedBox(height: height * 0.02),

                          /// PHONE
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Phone Number",
                              style: TextStyle(
                                fontSize: width * 0.032,
                              ),
                            ),
                          ),

                          SizedBox(height: height * 0.008),

                          TextField(
                            controller: phoneController,
                            keyboardType:
                            TextInputType.phone,
                            decoration: InputDecoration(
                              hintText:
                              "Enter Phone Number",
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon:
                              const Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          SizedBox(height: height * 0.02),

                          /// PASSWORD
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Set Password",
                              style: TextStyle(
                                fontSize: width * 0.032,
                              ),
                            ),
                          ),

                          SizedBox(height: height * 0.008),

                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Enter password",
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon:
                              const Icon(Icons.lock),
                              suffixIcon: const Icon(
                                Icons.visibility_off_outlined,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          SizedBox(height: height * 0.025),

                          /// PASSWORD RULES
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(
                              width * 0.03,
                            ),
                            decoration: BoxDecoration(
                              color:
                              const Color(0xFFF2F0D8),
                              borderRadius:
                              BorderRadius.circular(
                                  10),
                            ),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: const [

                                Text(
                                  "Password must contain:",
                                ),

                                SizedBox(height: 6),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      size: 16,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "At least 8 characters",
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      size: 16,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "One uppercase letter",
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      size: 16,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "One lowercase letter",
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      size: 16,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "One number or special character",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: height * 0.03),

                          /// NEXT BUTTON
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style:
                              ElevatedButton.styleFrom(
                                backgroundColor:
                                const Color(
                                    0xFF4E4543),
                                padding:
                                EdgeInsets.symmetric(
                                  vertical:
                                  height * 0.018,
                                ),
                                shape:
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius
                                      .circular(10),
                                ),
                              ),

                              onPressed: () async {
                                // PASTE YOUR CURRENT onPressed CODE HERE EXACTLY
                                bool success = await registerDriver();

                                if (success) {

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OTPScreen(
                                        verificationId: "",
                                        phone: phoneController.text.trim(),
                                      ),
                                    ),
                                  );

                                } else {

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Registration Failed"),
                                    ),
                                  );
                                }
                              },

                              child: Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                  width * 0.04,
                                  fontWeight:
                                  FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}