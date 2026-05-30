import 'package:flutter/material.dart';
import 'paymentsubscription_screen.dart';
class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFE3C65A),

      body: SafeArea(
        child: Stack(
          children: [

            /// 🔹 SCROLLABLE CONTENT
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.08,
                ),

                child: Column(
                  children: [

                    SizedBox(height: height * 0.02),

                    /// 🔹 TOP BAR
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: [

                        /// MENU ICON
                        IconButton(
                          onPressed: () {

                            // MENU LOGIC
                          },

                          icon: Icon(
                            Icons.menu,
                            size: width * 0.075,
                            color: Colors.black,
                          ),
                        ),

                        /// NOTIFICATION ICON
                        IconButton(
                          onPressed: () {

                            // NOTIFICATION SCREEN
                          },

                          icon: Icon(
                            Icons.notifications_none,
                            size: width * 0.07,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.015),

                    /// 🔹 WELCOME TEXT
                    Text(
                      "WELCOME ________ !",

                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: height * 0.015),

                    /// 🔹 SUBTITLE
                    Text(
                      "Subscribe below to get rides",

                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontSize: width * 0.04,
                        color: Colors.black87,
                      ),
                    ),

                    SizedBox(height: height * 0.05),

                    /// 🔹 PLAN BUTTONS
                    _planButton(
                      "6 hours - Rs 30",
                      width,
                      height,

                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const PaymentsScreen(),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: height * 0.022),

                    _planButton(
                      "12 hours - Rs 35",
                      width,
                      height,

                          () {},
                    ),

                    SizedBox(height: height * 0.022),

                    _planButton(
                      "18 hours - Rs 40",
                      width,
                      height,

                          () {},
                    ),

                    SizedBox(height: height * 0.022),

                    _planButton(
                      "7 Days - Rs 250",
                      width,
                      height,

                          () {},
                    ),

                    SizedBox(height: height * 0.022),

                    _planButton(
                      "30 Days - Rs 1000",
                      width,
                      height,

                          () {},
                    ),

                    SizedBox(height: height * 0.05),

                    /// 🔹 BOTTOM ROAD IMAGE
                    Image.asset(
                      'assets/Autoride3 1.png',

                      width: width,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: height * 0.03),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 REUSABLE PLAN BUTTON
  Widget _planButton(
      String text,
      double width,
      double height,
      VoidCallback onTap,
      ) {

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,

        minimumSize:
        Size(double.infinity, height * 0.065),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),

        elevation: 4,
      ),

      onPressed: onTap,

      child: Text(
        text,

        style: TextStyle(
          fontSize: width * 0.042,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}