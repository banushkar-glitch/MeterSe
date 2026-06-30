import 'package:flutter/material.dart';
import '../subscription_screen.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [

            /// HEADER
            Container(
              width: double.infinity,
              height: 99,
              color: const Color(0xFFFFD329),

              child: const Center(
                child: Text(
                  "Welcome To METERSAY!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            /// BODY
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFEAEAEA),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 17),

                    Expanded(
                      child: Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 16,
                            ),
                            child: Text(
                              "Namaste and Welcome! 🙏\n"
                                  "Thank you for joining us. You are\n"
                                  "the heartbeat of the city's daily\n"
                                  "commute. With your profile\n"
                                  "now active, finding local\n"
                                  "passengers just got easier. Start\n"
                                  "driving, keep the meter running,\n"
                                  "and let's grow together!",
                              style: TextStyle(
                                fontFamily: 'Geologica',
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          const Spacer(),

                          SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              "assets/rickshaw_road.png",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// FOOTER
            Container(
              width: double.infinity,
              height: 99,
              color: const Color(0xFF3C3A3A),


                child: Center(
                  child: InkWell(
                  onTap: () {

                    // NEXT SCREEN NAVIGATION
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubscriptionScreen(),
                      ),
                    );


                  },
                child: Container(
                  width: 290,
                  height: 50.8,

                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(
                      25.3981,
                    ),
                  ),

                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}