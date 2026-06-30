import 'package:flutter/material.dart';
import 'rides/map_screen.dart';
import '../utils/app_text.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() =>
      _SubscriptionScreenState();
}

class _SubscriptionScreenState
    extends State<SubscriptionScreen> {

  String? selectedPlan;

  Widget planButton(
      String title,
      double width,
      ) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedPlan = title;
        });
      },

      child: Container(
        width: width,
        height: 40,

        decoration: BoxDecoration(
          color: selectedPlan == title
              ? const Color(0xFFFFD329)
              : const Color(0xFFCDCDCD),

          border: Border.all(
            color: const Color(0xFF767676),
          ),

          borderRadius: BorderRadius.circular(8),
        ),

        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF1E1E1E),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [

            /// HEADER
            Container(
              height: 99,
              width: double.infinity,
              color: const Color(0xFFFFD329),

              child: Row(
                children: [

                  const SizedBox(width: 15),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      size: 35,
                    ),
                  ),

                   Expanded(
                    child: Text(AppText.getText("SUBSCRIPTION"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                      size: 35,
                    ),
                  ),

                  const SizedBox(width: 15),
                ],
              ),
            ),

            /// BODY
          Expanded(
            child: Container(
              width: double.infinity,
              color: const Color(0xFFEAEAEA),

              child: Column(
                children: [

                  const SizedBox(height: 16),

                   SizedBox(
                    width: 301,
                    child: Text(AppText.getText("Transparent Pricing, No Hidden fees or Commission"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'InriaSerif',
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                        letterSpacing: -0.4,
                        color: Color(0xCC000000), // 80% opacity black
                      ),
                    ),
                  ),

                  const SizedBox(height: 90),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      planButton(
                        "6 hours - 19 Rs/-",
                        152,
                      ),

                      const SizedBox(width: 29),

                      planButton(
                        "12 hours - 29 Rs/-",
                        161,
                      ),
                    ],
                  ),

                  const SizedBox(height: 44),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      planButton(
                        "3 days - 125 Rs/-",
                        154,
                      ),

                      const SizedBox(width: 32),

                      planButton(
                        "7 days - 296 Rs/-",
                        156,
                      ),
                    ],
                  ),

                  const SizedBox(height: 44),

                  Center(
                    child: planButton(
                      "1 month - 1259 Rs/-",
                      174,
                    ),
                  ),

                  const SizedBox(height: 30),



                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,

                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,

                        child: Image.asset(
                          "assets/road1.png",

                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
            /// FOOTER
            Container(
              height: 99,
              width: double.infinity,
              color: const Color(0xFF3C3A3A),

              child: Center(
                child: InkWell(
                  onTap: () {

                    /// API CALL LATER
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 290,
                    height: 50.8,

                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius:
                      BorderRadius.circular(
                        25.3981,
                      ),
                    ),

                    child: Center(
                      child: Text(AppText.getText("Continue"),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
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