import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'reviewupdated_screen.dart';
import '../slidedrawer/slidebar_screen.dart';
class RateRideScreen extends StatefulWidget {
  const RateRideScreen({super.key});

  @override
  State<RateRideScreen> createState() => _RateRideScreenState();
}

class _RateRideScreenState extends State<RateRideScreen> {

  final TextEditingController reviewController = TextEditingController();


  int selectedRating = 0;

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
                width: double.infinity,
                height: 99,
                color: const Color(0xFFFFD329),

                child: Row(
                  children: [

                    const SizedBox(width: 10),

                    IconButton(
                      onPressed: () {

                        /// MENU API

                      },
                      icon: const Icon(
                        Icons.menu,
                        size: 38,
                        color: Colors.black,
                      ),
                    ),

                    const Expanded(
                      child: Text(
                        "RIDE COMPLETED",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
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
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(width: 10),
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

                      const SizedBox(height: 8),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {

                            /// SKIP API
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MapScreen(),
                              ),
                            );

                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              color: Color(0xFF3C3A3A),
                            ),
                          ),
                        ),
                      ),

                      Image.asset(
                        "assets/check.png",
                        width: 100,
                        height: 100,
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        "Ride Completed!",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 3),

                      const Text(
                        "How was your experience?",
                        style: TextStyle(
                          fontSize: 9,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Container(
                        width: 342,
                        height: 140,

                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(30),
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/map.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(height: 1),

                      const Text(
                        "Rate your Experience",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "Your feedback helps us improve",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: List.generate(
                          5,
                              (index) {
                            return IconButton(
                              onPressed: () {
                                setState(() {
                                  selectedRating =
                                      index + 1;
                                });
                              },
                              icon: Icon(
                                Icons.star,
                                size: 38, // increase star size
                                color:
                                index < selectedRating
                                    ? Colors.amber
                                    : Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),

                      const Text(
                        "Write a review (optional)",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// REVIEW TEXTBOX
                      Container(
                        width: 359,
                        height: 60,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),

                        child: TextField(
                          controller: reviewController,

                          decoration: const InputDecoration(
                            hintText: "Enter your review",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// SUBMIT BUTTON
                      Container(
                        width: 359,
                        height: 40,

                        decoration: BoxDecoration(
                          color: const Color(0xFFFFEA08),
                          borderRadius: BorderRadius.circular(5),
                        ),

                        child: InkWell(
                          onTap: () {

                            /// API CALL LATER
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReviewUpdateScreen(),
                              ),
                            );

                            print(selectedRating);
                            print(reviewController.text);

                          },

                          child: const Center(
                            child: Text(
                              "Submit Review",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
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