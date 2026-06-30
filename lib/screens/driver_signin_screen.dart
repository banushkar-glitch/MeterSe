import 'package:flutter/material.dart';
import 'otp_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widget/meter_loader.dart';
import '../utils/app_text.dart';

class DriverSigninScreen extends StatefulWidget {
  @override
  _DriverSigninScreenState createState() => _DriverSigninScreenState();
}

class _DriverSigninScreenState extends State<DriverSigninScreen> {

  // 🔹 CONTROLLERS
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool _isPasswordVisible = false;

  // 🔥 API FUNCTION
  Future<bool> registerDriver() async {
    final url = Uri.parse("http://10.95.155.50:5000/api/driver/register");

    setState(() {
      isLoading = true;
    });

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
          Uri.parse("http://10.95.155.50:5000/api/driver/login"),
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
        setState(() {
          isLoading = false;
        });
        return true;

      } else {
        setState(() {
          isLoading = false;
        });
        return false;
      }
    } catch (e) {

      setState(() {
        isLoading = false;
      });

      print("ERROR: $e");
      return false;
    }
  }

  Widget buildRule(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration customDecoration({
    required String hint,
    required IconData icon,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,

      hintStyle: const TextStyle(
        color: Colors.black54,
        fontSize: 15,
      ),

      prefixIcon: Icon(
        icon,
        color: Colors.black45,
      ),

      suffixIcon: suffix,

      filled: true,
      fillColor: Colors.white,

      contentPadding: const EdgeInsets.symmetric(
        vertical: 18,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(.15),
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.black26,
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFEAEAEA),

      bottomNavigationBar: Container(
        height: 100,
        color: const Color(0xFF3C3A3A),
        child: Center(
          child: SizedBox(
            width: 290,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD9D9D9),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              onPressed: () async {
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
                }
              },
              child: Text(AppText.getText("Submit"),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),


      body: Stack(
        children: [

          SafeArea(
          child: Padding(
            padding: EdgeInsets.zero,
            child: Column(
              children: [

                /// TOP BAR
                Container(
                  height: 100,
                  width: double.infinity,
                  margin: EdgeInsets.zero,
                  color: const Color(0xFFFFD329),
                  child: SafeArea(
                    child: Row(
                      children: [

                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),

                        Expanded(
                          child: Text(
                            AppText.getText("Registration"),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
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
                ),


                Expanded(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.zero,

                      padding: const EdgeInsets.only(
                        left: 36,
                        right: 36,
                        top: 20,
                      ),

                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(0),
                      ),

                      child: Column(
                        children: [

                          Container(
                            height: 75,
                            width: 75,
                            child: const Icon(
                              Icons.assignment_ind_outlined,
                              size: 58,
                              color: Colors.black54,
                            ),
                          ),

                          const SizedBox(height: 5),

                          /// NAME
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(AppText.getText
                              ("Name"),
                              style: TextStyle(
                                fontSize: width * 0.032,
                              ),
                            ),
                          ),

                          SizedBox(height: height * 0.008),

                          TextField(
                            controller: nameController,
                            decoration: customDecoration(
                              hint: AppText.getText("Enter Name"),
                              icon: Icons.person_outline,
                            ),
                          ),

                          SizedBox(height: height * 0.02),

                          /// PHONE
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(AppText.getText
                              ("Phone Number"),
                              style: TextStyle(
                                fontSize: width * 0.032,
                              ),
                            ),
                          ),

                          SizedBox(height: height * 0.008),

                          TextField(
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            decoration: customDecoration(
                              hint: AppText.getText("Enter Phone Number"),
                              icon: Icons.phone_outlined,
                            ),
                          ),

                          SizedBox(height: height * 0.02),

                          /// PASSWORD
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(AppText.getText
                              ("Set Password"),
                              style: TextStyle(
                                fontSize: width * 0.032,
                              ),
                            ),
                          ),

                          SizedBox(height: height * 0.008),

                          TextField(
                            controller: passwordController,
                            obscureText: !_isPasswordVisible,
                            decoration: customDecoration(
                              hint: AppText.getText("Enter Password"),
                              icon: Icons.lock_outline,
                              suffix: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black45,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.025),

                          /// PASSWORD RULES
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: 12,
                              top: 12,
                              bottom: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFCE8),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.black12,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                const Text(
                                  "Password must contain:",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                buildRule("At least 8 characters"),
                                buildRule("One uppercase letter"),
                                buildRule("One lowercase letter"),
                                buildRule("One number or special character"),
                              ],
                            ),
                          ),

                          SizedBox(height: height * 0),

                          /// NEXT BUTTON

                        ],
                      ),
                    ),

                ),
              ],
            ),
          ),
        ),
        if (isLoading)
    Container(
      color: Colors.black.withOpacity(0.4),
      child: Center(
        child: Image.asset(
          "assets/loading_rickshaw.gif",
          width: 200,
          height: 200,
        ),
      ),
    ),

    ],
    ),
    );
  }
}