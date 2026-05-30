import 'package:flutter/material.dart';
import 'login_screen.dart';

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
          builder: (context) => LoginScreen(),
        ),
      );

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFE3C65A),

      body: const Center(
        child: Text(
          "Account Created Successfully ✅",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}