import 'package:flutter/material.dart';
import 'map_screen.dart';
import '../slidedrawer/slidebar_screen.dart';
class ReviewUpdateScreen extends StatefulWidget {
  const ReviewUpdateScreen({super.key});

  @override
  State<ReviewUpdateScreen> createState() => _ReviewUpdateScreen();
}

class _ReviewUpdateScreen extends State<ReviewUpdateScreen> {

  final TextEditingController reviewController = TextEditingController();


  int selectedRating = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MapScreen(),
        ),
      );

    });
  }

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  Widget buildStar(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRating = index;
        });
      },
      child: Icon(
        Icons.star,
        color: index <= selectedRating
            ? const Color(0xFFFFD700)
            : Colors.grey.shade400,
        size: 32,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final height = media.size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    onPressed: () {

                    },
                    icon: const Icon(
                      Icons.menu,
                      size: 38,
                      color: Colors.black,
                    ),
                  ),

                  Expanded(
                    child: Text("Ride Completed",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
                      size: 28,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(width: 10),
                ],
              ),
            ),

            /// CONTENT
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFEAEAEA),

                child: Column(
                  children: [

                    const SizedBox(height: 105),

                    /// GREEN TICK
                    Image.asset(
                      "assets/check.png",
                      width: 100,
                      height: 100,
                    ),

                    const SizedBox(height: 20),

                    /// TITLE
                    const Text(
                      "Thank you for your review !",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 22),

                    /// DESCRIPTION
                    const SizedBox(
                      width: 238,
                      child: Text(
                        "Thank you for the rating! 🛺 Your feedback "
                            "has been recorded. Ready for your next booking? "
                            "Keep the meter running and stay online to find "
                            "your next passenger nearby!",

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w300,
                          height: 1.5,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    const Spacer(),
                  ],
                ),
              ),
            ),

            /// FOOTER
            Container(
              width: double.infinity,
              height: 85,
              color: const Color(0xFF3C3A3A),
            ),
          ],
        ),
      ),
    );
  }
}