import 'package:flutter/material.dart';
import '../settings_screen.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE4C766),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.015,
          ),

          child: Column(
            children: [

              /// 🔹 HEADER
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

                children: [

                  IconButton(
                    onPressed: () {
        Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => SettingsScreen(),
        ),
        );
        },

                    icon: Icon(
                      Icons.arrow_back,
                      size: size.width * 0.09,
                      color: Colors.black,
                    ),
                  ),

                  Text(
                    "Notifications",

                    style: TextStyle(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),

                  Icon(
                    Icons.notifications_none,
                    size: size.width * 0.07,
                    color: Colors.black,
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.01),

              /// 🔹 SUBTITLE
              Text(
                "Stay updated with your latest activity\nand important alerts",

                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: size.width * 0.03,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: size.height * 0.02),

              /// 🔹 MAIN CARD
              Expanded(
                child: Container(
                  width: double.infinity,

                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                    vertical: size.height * 0.015,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),

                    borderRadius:
                    BorderRadius.circular(20),
                  ),

                  child: Column(
                    children: [

                      /// 🔹 TOP BAR
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                        children: [

                          Text(
                            "Today",

                            style: TextStyle(
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          Text(
                            "Mark all as read",

                            style: TextStyle(
                              fontSize: size.width * 0.028,
                              color: Colors.orange,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: size.height * 0.015),

                      /// 🔹 NOTIFICATION LIST
                      Expanded(
                        child: ListView(
                          physics:
                          const BouncingScrollPhysics(),

                          children: const [

                            NotificationTile(
                              title: "Payment Received",
                              subtitle:
                              "You have received 584 for trip to MG Road, Pune",
                              time: "10:30 AM",
                            ),

                            NotificationTile(
                              title: "New Ride Request",
                              subtitle:
                              "New ride request from Swarget to Katraj, Pune",
                              time: "09:15 AM",
                            ),

                            NotificationTile(
                              title: "Document Expiring Soon",
                              subtitle:
                              "Your Driving License will expire on 12 May 2025",
                              time: "Yesterday",
                            ),

                            NotificationTile(
                              title: "Special Offer",
                              subtitle:
                              "Complete 20 rides this week and get extra 300 bonus",
                              time: "2 May 2025",
                            ),

                            NotificationTile(
                              title: "Account Verified",
                              subtitle:
                              "Congratulations! Your account has been successfully verified.",
                              time: "1 May 2025",
                            ),

                            NotificationTile(
                              title: "Weekly Earnings",
                              subtitle:
                              "You earned ₹4,520 this week successfully.",
                              time: "30 Apr 2025",
                            ),

                            NotificationTile(
                              title: "Trip Completed",
                              subtitle:
                              "Your recent ride has been completed successfully.",
                              time: "29 Apr 2025",
                            ),

                            NotificationTile(
                              title: "New Update Available",
                              subtitle:
                              "Update app now for better performance.",
                              time: "28 Apr 2025",
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: size.height * 0.015),

                      /// 🔹 BOTTOM BOX
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.015,
                        ),

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),

                          borderRadius:
                          BorderRadius.circular(12),
                        ),

                        child: Row(
                          children: [

                            Icon(
                              Icons.notifications_active_outlined,
                              size: size.width * 0.08,
                            ),

                            SizedBox(width: size.width * 0.03),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,

                                children: [

                                  Text(
                                    "Enable Push Notifications",

                                    style: TextStyle(
                                      fontSize:
                                      size.width * 0.032,
                                      fontWeight:
                                      FontWeight.w600,
                                    ),
                                  ),

                                  SizedBox(
                                      height:
                                      size.height * 0.003),

                                  Text(
                                    "Get real-time updates and never miss important alerts",

                                    style: TextStyle(
                                      fontSize:
                                      size.width * 0.026,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: size.width * 0.02),

                            ElevatedButton(
                              onPressed: () {},

                              style:
                              ElevatedButton.styleFrom(
                                backgroundColor:
                                const Color(0xFF4A423F),

                                shape:
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                      8),
                                ),

                                padding:
                                EdgeInsets.symmetric(
                                  horizontal:
                                  size.width * 0.03,
                                  vertical:
                                  size.height * 0.012,
                                ),
                              ),

                              child: Text(
                                "Update Now",

                                style: TextStyle(
                                  fontSize:
                                  size.width * 0.025,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

/// 🔹 REUSABLE NOTIFICATION TILE
class NotificationTile extends StatelessWidget {

  final String title;
  final String subtitle;
  final String time;

  const NotificationTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Column(
      children: [

        Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.012,
          ),

          child: Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              /// 🔹 TEXTS
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      title,

                      style: TextStyle(
                        fontSize: size.width * 0.034,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: size.height * 0.004),

                    Text(
                      subtitle,

                      style: TextStyle(
                        fontSize: size.width * 0.029,
                        color: Colors.black87,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: size.width * 0.03),

              /// 🔹 TIME + DOT
              Column(
                children: [

                  Text(
                    time,

                    style: TextStyle(
                      fontSize: size.width * 0.026,
                      color: Colors.black54,
                    ),
                  ),

                  SizedBox(height: size.height * 0.01),

                  CircleAvatar(
                    radius: size.width * 0.012,
                    backgroundColor: Colors.amber,
                  ),
                ],
              ),
            ],
          ),
        ),

        Divider(
          color: Colors.grey.shade400,
          thickness: 1,
        ),
      ],
    );
  }
}