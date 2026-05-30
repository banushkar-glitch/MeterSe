import 'package:flutter/material.dart';

class MyTripsScreen extends StatefulWidget {
  const MyTripsScreen({super.key});

  @override
  State<MyTripsScreen> createState() => _MyTripsScreenState();
}

class _MyTripsScreenState extends State<MyTripsScreen> {
  String selectedTab = "Today";

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

              SizedBox(height: size.height * 0.015),

              /// HEADER
              Row(
                children: [

                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      size: size.width * 0.07,
                    ),
                  ),

                  Expanded(
                    child: Text(
                      "My Trips",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.05,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none,
                      size: size.width * 0.065,
                    ),
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.05),

              /// TABS
              Container(
                padding: EdgeInsets.all(size.width * 0.01),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = "Today";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.01,
                          ),
                          decoration: BoxDecoration(
                            color: selectedTab == "Today"
                                ? Colors.grey.shade300
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Today",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = "Weekly";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.01,
                          ),
                          decoration: BoxDecoration(
                            color: selectedTab == "Weekly"
                                ? Colors.grey.shade300
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Weekly",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = "Monthly";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.01,
                          ),
                          decoration: BoxDecoration(
                            color: selectedTab == "Monthly"
                                ? Colors.grey.shade300
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Monthly",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.05),

              /// TRIPS LIST
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [

                    if (selectedTab == "Today") ...[
                      tripCard(
                        context,
                        pickup: "Kothrud",
                        drop: "Wakad",
                        date: "27 April",
                        time: "10:15 AM",
                      ),
                      tripCard(
                        context,
                        pickup: "Shivaji Nagar",
                        drop: "Kothrud",
                        date: "27 April",
                        time: "09:20 AM",
                      ),
                    ],

                    if (selectedTab == "Weekly") ...[
                      tripCard(
                        context,
                        pickup: "Mumbai",
                        drop: "Pune",
                        date: "This Week",
                        time: "11:30 AM",
                      ),
                      tripCard(
                        context,
                        pickup: "Nashik",
                        drop: "Pune",
                        date: "This Week",
                        time: "02:00 PM",
                      ),
                    ],

                    if (selectedTab == "Monthly") ...[
                      tripCard(
                        context,
                        pickup: "Nagpur",
                        drop: "Mumbai",
                        date: "This Month",
                        time: "08:45 AM",
                      ),
                      tripCard(
                        context,
                        pickup: "Pune",
                        drop: "Kolhapur",
                        date: "This Month",
                        time: "06:15 PM",
                      ),
                    ],

                    SizedBox(height: size.height * 0.01),

                  ],
                ),
              ),
              /// SUMMARY CARD
              Container(
                padding: EdgeInsets.all(size.width * 0.04),

                decoration: BoxDecoration(
                  color: const Color(0xFF433A37),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Row(
                  children: [

                    Expanded(
                      child: Row(
                        children: [

                          const Icon(
                            Icons.local_taxi,
                            color: Colors.white,
                          ),

                          SizedBox(width: size.width * 0.02),

                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: const [
                              Text(
                                "Total Trips",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                ),
                              ),

                              Text(
                                "12",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight:
                                  FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.white30,
                    ),

                    Expanded(
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [

                          const Icon(
                            Icons.route,
                            color: Colors.white,
                          ),

                          SizedBox(width: size.width * 0.02),

                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: const [

                              Text(
                                "Total Distance",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                ),
                              ),

                              Text(
                                "56 Km",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight:
                                  FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.06),
            ],
          ),
        ),
      ),
    );
  }

  Widget tripCard(
      BuildContext context, {
        required String pickup,
        required String drop,
        required String date,
        required String time,
      }) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        bottom: size.height * 0.012,
      ),

      padding: EdgeInsets.all(size.width * 0.03),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              const Icon(
                Icons.location_on,
                color: Colors.green,
                size: 16,
              ),

              SizedBox(width: size.width * 0.01),

              Expanded(
                child: Text(
                  pickup,
                  style: TextStyle(
                    fontSize: size.width * 0.033,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: size.height * 0.005),

          Row(
            children: [

              const Icon(
                Icons.location_on,
                color: Colors.red,
                size: 16,
              ),

              SizedBox(width: size.width * 0.01),

              Expanded(
                child: Text(
                  drop,
                  style: TextStyle(
                    fontSize: size.width * 0.033,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: size.height * 0.01),

          Row(
            children: [

              Text(
                date,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: size.width * 0.025,
                ),
              ),

              SizedBox(width: size.width * 0.05),

              Text(
                time,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: size.width * 0.025,
                ),
              ),

              const Spacer(),

              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 16,
              ),

              SizedBox(width: size.width * 0.01),

              Text(
                "Completed",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: size.width * 0.025,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}