import 'package:flutter/material.dart';
import 'ridestart_screen.dart';
class RideAcceptedScreen extends StatefulWidget {
  const RideAcceptedScreen({super.key});

  @override
  State<RideAcceptedScreen> createState() =>
      _RideAcceptedScreenState();
}

class _RideAcceptedScreenState
    extends State<RideAcceptedScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE4CB61),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
          ),
          child: Column(
            children: [

              SizedBox(height: size.height * 0.01),

              /// HEADER
              Row(
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        size: size.width * 0.07,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Text(
                      "Ride Accepted",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      // notification
                    },
                    icon: Icon(
                      Icons.notifications_none,
                      size: size.width * 0.065,
                    ),
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.015),

              Expanded(
                child: SingleChildScrollView(
                  physics:
                  const BouncingScrollPhysics(),
                  child: Column(
                    children: [

                      /// MAP CARD
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: size.height * 0.30,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.circular(25),
                          ),
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(25),
                            child: Image.network(
                              "https://maps.gstatic.com/tactile/basepage/pegman_sherlock.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                          height: size.height * 0.005),

                      /// CUSTOMER CARD
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.04,
                  ),

                  child: Container(
                    padding: EdgeInsets.all(size.width * 0.03),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                        child: Row(
                          children: [

                            CircleAvatar(
                              radius:
                              size.width * 0.05,
                              child: const Icon(
                                  Icons.person),
                            ),

                            SizedBox(
                                width:
                                size.width * 0.03),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: [

                                  Text(
                                    "Rahul",
                                    style: TextStyle(
                                      fontWeight:
                                      FontWeight
                                          .bold,
                                      fontSize:
                                      size.width *
                                          0.035,
                                    ),
                                  ),

                                  Text(
                                    "Customer",
                                    style: TextStyle(
                                      fontSize:
                                      size.width *
                                          0.028,
                                    ),
                                  ),

                                  Row(
                                    children: [

                                      const Icon(
                                        Icons.star,
                                        color: Colors
                                            .orange,
                                        size: 16,
                                      ),

                                      SizedBox(
                                          width: 4),

                                      const Text(
                                          "4.5"),

                                      SizedBox(
                                          width:
                                          size.width *
                                              0.05),

                                      const Text(
                                          "8.2 km"),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                // chat
                              },
                              icon: const Icon(
                                  Icons.chat_bubble_outline),
                            ),
                          ],
                        ),
                      ),
                ),
                      SizedBox(
                          height: size.height * 0.015),

                      /// PICKUP DROP CARD
                      Container(
                        padding: EdgeInsets.all(
                            size.width * 0.03),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [

                            Row(
                              children: [

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: const [

                                      Text("Pick up"),

                                      SizedBox(
                                          height: 5),

                                      Text(
                                        "Shivaji Nagar",
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: const [

                                      Text("Drop"),

                                      SizedBox(
                                          height: 5),

                                      Text(
                                        "Hinjewadi Phase 1",
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                                height:
                                size.height * 0.02),

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: const [

                                Text(
                                    "Distance Left"),

                                Text("4.2 km"),

                                Text("Time Left"),

                                Text("10 min"),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                          height: size.height * 0.05),

                      /// ARRIVED BUTTON
                      SizedBox(
                        width: size.width * 0.8,
                        height: size.height * 0.065,
                        child: ElevatedButton(
                          onPressed: () {
                            // backend later
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RideStartedScreen(),
                              ),
                            );
                          },
                          style:
                          ElevatedButton.styleFrom(
                            backgroundColor:
                            const Color(
                                0xFF8CE63B),
                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius
                                  .circular(35),
                            ),
                          ),
                          child: Text(
                            "Arrived At Location",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:
                              size.width * 0.04,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                          height: size.height * 0.001),

                      /// CANCEL BUTTON
                      TextButton.icon(
                        onPressed: () {
                          // cancel ride
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                        label: const Text(
                          "Cancel Ride",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),

                      SizedBox(
                          height: size.height * 0.02),

                      /// WARNING CARD
                      Container(
                        padding: EdgeInsets.all(
                            size.width * 0.03),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(15),
                        ),
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [

                            const Icon(
                              Icons.info_outline,
                              color: Colors.black54,
                            ),

                            SizedBox(
                                width:
                                size.width * 0.03),

                            Expanded(
                              child: Text(
                                "Canceling rides more than 2 times in a single day may temporarily block your account for 24 hours. Please accept rides responsibly.",
                                style: TextStyle(
                                  fontSize:
                                  size.width *
                                      0.025,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                          height: size.height * 0.005),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}