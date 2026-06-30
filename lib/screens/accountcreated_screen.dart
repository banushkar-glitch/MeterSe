import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'rides/map_screen.dart';
import '../utils/app_text.dart';
import 'rides/welcome_screen.dart';
class AccountCreated extends StatefulWidget {
  @override
  State<AccountCreated> createState() => _AccountCreatedState();
}

class _AccountCreatedState extends State<AccountCreated> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
        ),
      );

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFE3C65A),

      body: Center(
        child: Text(AppText.getText(
          "Account Created Successfully ✅"),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}