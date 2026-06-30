import 'package:flutter/material.dart';
import 'dropride_screen.dart';
import '../slidedrawer/reject_slider.dart';
import '../slidedrawer/slidebar_screen.dart';
import '../slidedrawer/rejectbox.dart';
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
                          Icons.menu,
                          size: size.width * 0.07,
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
                                    "PICK UP DETAILS",
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
                                                  "Shivaji Nagar",
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
                                                "0.5 km",
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

                                          SizedBox(
                                            width: 122,
                                            height: 33,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // message api
                                              },

                                              style:
                                              ElevatedButton.styleFrom(
                                                backgroundColor:
                                                Colors.white,
                                                elevation: 0,
                                                shape:
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      9),
                                                ),
                                              ),

                                              child: const Text(
                                                "Message",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),

                                          const SizedBox(height: 8),

                                          SizedBox(
                                            width: 122,
                                            height: 33,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // call api
                                              },

                                              style:
                                              ElevatedButton.styleFrom(
                                                backgroundColor:
                                                Colors.white,
                                                elevation: 0,
                                                shape:
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      9),
                                                ),
                                              ),

                                              child: const Text(
                                                "Call",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 35),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      SizedBox(
                                        width: 43,
                                        height: 50,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          maxLength: 1,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          decoration: const InputDecoration(
                                            counterText: "",
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            if (value.length == 1) {
                                              FocusScope.of(context).nextFocus();
                                            }
                                          },
                                        ),
                                      ),

                                      const SizedBox(width: 8),
                                      SizedBox(
                                        width: 43,
                                        height: 50,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          maxLength: 1,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          decoration: const InputDecoration(
                                            counterText: "",
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            if (value.length == 1) {
                                              FocusScope.of(context).nextFocus();
                                            } else if (value.isEmpty) {
                                              FocusScope.of(context).previousFocus();
                                            }
                                          },
                                        ),
                                      ),

                                      const SizedBox(width: 8),

                                      SizedBox(
                                        width: 43,
                                        height: 50,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          maxLength: 1,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          decoration: const InputDecoration(
                                            counterText: "",
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            if (value.length == 1) {
                                              FocusScope.of(context).nextFocus();
                                            } else if (value.isEmpty) {
                                              FocusScope.of(context).previousFocus();
                                            }
                                          },
                                        ),
                                      ),

                                      const SizedBox(width: 8),

                                      SizedBox(
                                        width: 43,
                                        height: 50,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          maxLength: 1,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          decoration: const InputDecoration(
                                            counterText: "",
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            if (value.isEmpty) {
                                              FocusScope.of(context).previousFocus();
                                            }
                                          },
                                        ),
                                      ),

                                      const SizedBox(width: 17),

                                      SizedBox(
                                        width: 120,
                                        height: 35,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => DropRideScreen(),
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFF43E000),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: const Text(
                                            "Submit",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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