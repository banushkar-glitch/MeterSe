import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/splash_screen.dart';
import 'screens/settings/logout/logoutsettings_screen.dart';
import 'screens/rides/map_screen.dart';

import 'screens/paymentsubscription_screen.dart';
import 'screens/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/driver_details_screen.dart';
import 'screens/document_upload_screen.dart';
import 'screens/rides/welcome_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DriverApp());
}



  ///direct autologin sathi logic taklai
class AppStartScreen extends StatefulWidget {
  @override
  State<AppStartScreen> createState() => _AppStartScreenState();
}

class _AppStartScreenState extends State<AppStartScreen> {

  bool? isLoggedIn;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {

    final prefs = await SharedPreferences.getInstance();

    setState(() {
      isLoggedIn =
          prefs.getBool('isLoggedIn') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (isLoggedIn == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return isLoggedIn!
        ? const MapScreen()
        : SplashScreen();
  }
}
///ends here

class DriverApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppStartScreen(),
    );
  }
}