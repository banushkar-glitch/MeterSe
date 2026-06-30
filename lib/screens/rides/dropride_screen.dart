import 'package:flutter/material.dart';
import 'ridestart_screen.dart';
import '../slidedrawer/reject_slider.dart';
import '../slidedrawer/slidebar_screen.dart';
import '../slidedrawer/rejectbox.dart';
import 'ridereview_screen.dart';


class DropRideScreen extends StatefulWidget {
  const DropRideScreen({super.key});

  @override
  State<DropRideScreen> createState() =>
      _DropRideScreen();
}

class _DropRideScreen
    extends State<DropRideScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: DrawerMenu(),
      backgroundColor: const Color(0xFFEAEAEA),

      body: Stack(
        children: [

          SafeArea(

            child: Column(
              children: [

                //----------------------------------
                // HEADER
                //----------------------------------
                Container(
                  height: 99,
                  width: double.infinity,
                  color: const Color(0xFFFFD329),

                  child: Row(
                    children: [

                      const SizedBox(width: 10),

                      IconButton(
                        onPressed: () {

                        },
                        icon: Icon(
                          size: size.width * 0.07,
                          Icons.menu,
                          color: Colors.black,
                        ),
                      ),

                      const Expanded(
                        child: Text(
                          "Active Ride",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Geologica',
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            letterSpacing: 0,
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

                SizedBox(height: size.height * 0.0),

                Expanded(
                  child: SingleChildScrollView(
                    physics:
                    const BouncingScrollPhysics(),
                    child: Column(
                      children: [

                        /// MAP CARD
                        GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            height: size.height * 0.45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(0),
                            ),
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.circular(0),
                              child: Image.network(
                                "https://maps.gstatic.com/tactile/basepage/pegman_sherlock.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                            height: size.height * 0.0),

                        /// CUSTOMER CARD
                        Center(
                          child: Container(
                            width: 365,
                            height: 230,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(24),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),

                              child: Column(
                                children: [

                                  const Text(
                                    "DROP OFF DETAILS",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),

                                  const SizedBox(height: 25),

                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      CircleAvatar(
                                        radius: 28,
                                        backgroundImage:
                                        AssetImage("assets/images/user.png"),
                                      ),

                                      const SizedBox(width: 12),

                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: const [

                                            Text(
                                              "Neha",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),

                                            SizedBox(height: 8),

                                            Row(
                                              children: [

                                                Icon(
                                                  Icons.location_on,
                                                  size: 20,
                                                ),

                                                SizedBox(width: 4),

                                                Text(
                                                  "Hinjewadi Phase 1",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),

                                            SizedBox(height: 6),

                                            Padding(
                                              padding:
                                              EdgeInsets.only(left: 24),
                                              child: Text(
                                                "8.5 km",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Column(
                                        children: [



                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 25),

                                  Center(
                                    child: SizedBox(
                                      width: 300, // reduce width here
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // ARRIVED API HERE
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => RateRideScreen(),
                                            ),
                                          );

                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFF7ED321),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text(
                                          "Drop Off Passenger",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        /// bttom contaier BUTTON
                        Container(
                          width: double.infinity,
                          height: 99,
                          color: const Color(0xFF3C3A3A),

                          child: Center(
                            child: Container(
                              width: 359,
                              height: 59,

                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),

                              child: Row(
                                children: [

                                  const Icon(
                                    Icons.error_outline,
                                    size: 26,
                                    color: Colors.black,
                                  ),

                                  const SizedBox(width: 8),

                                  Expanded(
                                    child: Text(
                                      "Canceling rides more than 2 times in a single day may temporarily block your account for 24 hours. Please accept rides responsibly to maintain smooth service for customers.",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),

                                  GestureDetector(
                                    onTap: () {
                                      // CANCEL RIDE API HERE
                                    },
                                    child: const Text(
                                      "Cancel Ride",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: size.height * 0.005,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}