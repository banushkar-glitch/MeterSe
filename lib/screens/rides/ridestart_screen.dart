import 'package:flutter/material.dart';
import 'ridereview_screen.dart';
class RideStartedScreen extends StatefulWidget {
  const RideStartedScreen({super.key});

  @override
  State<RideStartedScreen> createState() => _RideStartedScreenState();
}

class _RideStartedScreenState extends State<RideStartedScreen> {
  final TextEditingController otp1 = TextEditingController();
  final TextEditingController otp2 = TextEditingController();
  final TextEditingController otp3 = TextEditingController();
  final TextEditingController otp4 = TextEditingController();
  final TextEditingController otp5 = TextEditingController();
  final TextEditingController otp6 = TextEditingController();

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
                      "Ride Started",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      // NOTIFICATION SCREEN
                    },
                    icon: Icon(
                      Icons.notifications_none,
                      size: size.width * 0.065,
                    ),
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.02),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      /// MAP
                      Container(
                        width: double.infinity,
                        height: size.height * 0.23,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/map.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      SizedBox(height: size.height * 0.02),

                      /// CUSTOMER CARD
                      Container(
                        padding: EdgeInsets.all(
                          size.width * 0.03,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(20),
                        ),

                        child: Row(
                          children: [

                            CircleAvatar(
                              radius: size.width * 0.05,
                              backgroundColor:
                              Colors.blue.shade100,
                              child: Icon(
                                Icons.person,
                                color: Colors.blue,
                                size: size.width * 0.06,
                              ),
                            ),

                            SizedBox(
                              width: size.width * 0.03,
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,

                                children: [

                                  Text(
                                    "Rahul",
                                    style: TextStyle(
                                      fontSize:
                                      size.width * 0.035,
                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    "Customer",
                                    style: TextStyle(
                                      fontSize:
                                      size.width * 0.025,
                                    ),
                                  ),

                                  SizedBox(height: 3),

                                  Row(
                                    children: [

                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size:
                                        size.width * 0.04,
                                      ),

                                      SizedBox(width: 3),

                                      Text(
                                        "4.5",
                                        style: TextStyle(
                                          fontSize:
                                          size.width *
                                              0.032,
                                        ),
                                      ),

                                      SizedBox(
                                        width:
                                        size.width * 0.05,
                                      ),

                                      Text(
                                        "8.2 km",
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize:
                                          size.width *
                                              0.04,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                // CHAT SCREEN
                              },
                              icon: const Icon(
                                Icons.chat_bubble_outline,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: size.height * 0.015),

                      /// PICKUP DROP CARD
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.04,
                          vertical: size.height * 0.022,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(16),
                        ),

                        child: Column(
                          children: [

                            Row(
                              children: [

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                    children: [

                                      Text(
                                        "Pick up",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize:
                                          size.width *
                                              0.029,
                                        ),
                                      ),

                                      SizedBox(height: 5),

                                      Row(
                                        children: [

                                          const Icon(
                                            Icons.location_on,
                                            color:
                                            Colors.green,
                                            size: 20,
                                          ),

                                          SizedBox(width: 3),

                                          Flexible(
                                            child: Text(
                                              "Shivaji Nagar",
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                              TextStyle(
                                                fontSize:
                                                size.width *
                                                    0.032,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                    children: [

                                      Text(
                                        "Drop",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize:
                                          size.width *
                                              0.029,
                                        ),
                                      ),

                                      SizedBox(height: 5),

                                      Row(
                                        children: [

                                          const Icon(
                                            Icons.location_on,
                                            color: Colors.red,
                                            size: 20,
                                          ),

                                          SizedBox(width: 3),

                                          Flexible(
                                            child: Text(
                                              "Hinjewadi Phase 1",
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                              TextStyle(
                                                fontSize:
                                                size.width *
                                                    0.032,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 23),

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,

                              children: [

                                Text(
                                  "Distance Left  4.2km",
                                  style: TextStyle(
                                    fontSize:
                                    size.width * 0.032,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                Text(
                                  "Time Left  10 min",
                                  style: TextStyle(
                                    fontSize:
                                    size.width * 0.032,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: size.height * 0.02),

                      /// OTP CARD
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(
                          size.width * 0.04,
                        ),

                        decoration: BoxDecoration(
                          color: const Color(0xFF3F3518),
                          borderRadius:
                          BorderRadius.circular(14),
                        ),

                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            Text(
                              "Customer OTP",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                size.width * 0.032,
                              ),
                            ),

                            SizedBox(height: 12),

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,

                              children: [

                                otpBox(otp1, context),
                                otpBox(otp2, context),
                                otpBox(otp3, context),
                                otpBox(otp4, context),
                                otpBox(otp5, context),
                                otpBox(otp6, context),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: size.height * 0.02),

                      /// CANCEL BUTTON
                      ElevatedButton.icon(
                        onPressed: () {
                          // CANCEL RIDE API
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.red,
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(8),
                          ),
                        ),

                        icon: const Icon(Icons.close),
                        label: const Text("Cancel Ride"),
                      ),

                      SizedBox(height: size.height * 0.02),

                      /// WARNING CARD
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(
                          size.width * 0.03,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(14),
                        ),

                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            const Icon(
                              Icons.info_outline,
                            ),

                            SizedBox(
                              width: size.width * 0.02,
                            ),

                            Expanded(
                              child: Text(
                                "Cancelling rides more than 2 times in a single day may temporarily block your account for 24 hours. Please accept rides responsibly.",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize:
                                  size.width * 0.022,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: size.height * 0.02),
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

  Widget otpBox(
      TextEditingController controller,
      BuildContext context,
      ) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.11,
      height: size.width * 0.14,

      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,

        style: TextStyle(
          fontSize: size.width * 0.05,
          fontWeight: FontWeight.bold,
        ),

        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),

        onChanged: (value) {

          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }

          if (otp1.text.isNotEmpty &&
              otp2.text.isNotEmpty &&
              otp3.text.isNotEmpty &&
              otp4.text.isNotEmpty &&
              otp5.text.isNotEmpty &&
              otp6.text.isNotEmpty) {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RateRideScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}