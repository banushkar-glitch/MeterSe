import 'package:flutter/material.dart';
import '../settings_screen.dart';
class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE4C766),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.015,
          ),

          child: Column(
            children: [

              /// 🔹 HEADER
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

                children: [

                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
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
                    "Log Out",
                    style: TextStyle(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  Icon(
                    Icons.notifications_none,
                    size: size.width * 0.08,
                    color: Colors.black,
                  ),
                ],
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
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {

                    /// 🔥 LOGOUT LOGIC HERE

                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color(0xFF4A423F),

                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(16),
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

              SizedBox(height: size.height * 0.03),

              /// 🔹 CANCEL BUTTON
              SizedBox(
                width: double.infinity,

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

              const Spacer(),

              /// 🔹 FOOTER
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,

                children: [

                  Icon(
                    Icons.security,
                    size: size.width * 0.07,
                    color: Colors.black,
                  ),

                  SizedBox(width: size.width * 0.02),

                  Text(
                    "Your data is always safe with us.",
                    style: TextStyle(
                      fontSize: size.width * 0.038,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}