import 'package:flutter/material.dart';
import '../settings_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../home_screen.dart';
class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(


      body: SafeArea(


          child: Column(
            children: [

              /// 🔹 HEADER
              Container(

                width: double.infinity,
                height: 99,
                color: const Color(0xFFFFD329),

                child: Row(

                  children: [

                    const SizedBox(width: 10),

                    IconButton(

                      onPressed: () {

                        /// BACK

                        Navigator.pop(context);

                      },

                      icon: const Icon(
                        Icons.arrow_back,
                        size: 38,
                        color: Colors.black,
                      ),

                    ),

                    const Expanded(

                      child: Text(

                        "Account & Profile",

                        textAlign: TextAlign.center,

                        style: TextStyle(

                          fontSize: 20,

                          fontWeight: FontWeight.w400,

                        ),

                      ),

                    ),

                    IconButton(

                      onPressed: () {

                        /// NOTIFICATION API

                      },

                      icon: const Icon(
                        Icons.notifications_none,
                        size: 38,
                      ),

                    ),

                    const SizedBox(width: 10),

                  ],

                ),

              ),

              SizedBox(height: size.height * 0.04),

              /// 🔹 ICON
              Container(
                width: size.width * 0.22,
                height: size.width * 0.22,

                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),

                child: Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: size.width * 0.12,
                ),
              ),

              SizedBox(height: size.height * 0.025),

              /// 🔹 TITLE
              Text(
                "Log Out",
                style: TextStyle(
                  fontSize: size.width * 0.08,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: size.height * 0.04),

              /// 🔹 MESSAGE
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.08,
                ),

                child: Text(
                  "Are you sure you want to log out?\nYou'll need to log in again to access your account.",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.08),

              /// 🔹 LOGOUT BUTTON
              Center(
                child: SizedBox(
                  width: 300, // Change this value as needed

                child: ElevatedButton(

                  onPressed: () async{

                    /// 🔥 LOGOUT LOGIC HERE
                    final prefs =
                        await SharedPreferences.getInstance();

                    await prefs.remove('jwt_token');
                    await prefs.setBool('isLoggedIn', false);

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>HomeScreen(),
                      ),
                          (route) => false,
                    );

                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color(0xFF4A423F),

                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                  ),

                  child: Text(
                    "Yes, Log Out",
                    style: TextStyle(
                      fontSize: size.width * 0.06,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
      ),

              SizedBox(height: size.height * 0.03),

              /// 🔹 CANCEL BUTTON
        Center(
          child: SizedBox(
            width: 170,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,

                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(16),
                    ),
                  ),

                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: size.width * 0.06,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
        ),

              const Spacer(),



              Container(

                width: double.infinity,

                height: 99,

                color: const Color(0xFF3C3A3A),

              ),
            ],
          ),

      ),
    );
  }
}