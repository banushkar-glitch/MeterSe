import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'forgotpassword_screen.dart';
import '../screens/rides/map_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // 🔹 CONTROLLERS
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // 🔥 LOGIN API FUNCTION
  Future<void> loginDriver() async {

    final url = Uri.parse("http://192.168.0.34:5000/api/driver/login");

    try {

      // ✅ PRINT BEFORE API CALL
      print("PHONE SENT: ${usernameController.text.trim()}");
      print("PASSWORD SENT: ${passwordController.text.trim()}");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "phone": usernameController.text.trim(),
          "password": passwordController.text.trim(),
        }),
      );

      // 🔍 DEBUG RESPONSE
      print("API CALLED");
      print("STATUS: ${response.statusCode}");
      print("BODY: ${response.body}");

      if (response.statusCode == 200) {

        final responseData = jsonDecode(response.body);
        if (responseData['token'] != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('jwt_token', responseData['token']);
          print("TOKEN SAVED: ${responseData['token']}");
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login Successful")),
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapScreen()),
        );

      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid Credentials")),
        );
      }

    } catch (e) {
      print("ERROR: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Server Error")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFE3C65A),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.05),

          child: Column(
            children: [

              SizedBox(height: height * 0.08),

              // LOGO
              Image.asset('assets/logo.png', width: width * 0.5),

              SizedBox(height: height * 0.05),

              // TITLE
              Text(
                "Driver Login",
                style: TextStyle(
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: height * 0.04),

              // USERNAME
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Enter Phone Number",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

              SizedBox(height: height * 0.025),

              // PASSWORD
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

              SizedBox(height: height * 0.03),

              // LOGIN BUTTON
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(double.infinity, height * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {

                  // 🔥 CALL LOGIN API
                  loginDriver();

                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: width * 0.045),
                ),
              ),

              SizedBox(height: height * 0.02),

              GestureDetector(
                onTap: () {

                  // Navigate to Forgot Password Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen(),
                    ),
                  );

                },
                child: Text(
                  "Forgot Password..?",
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}