import 'package:flutter/material.dart';
import '../settings_screen.dart';
import 'paymentissuehelpsupport_screen.dart';
import 'riderelatedissuehelpsupport_screen.dart';
import 'accountprofile_screen.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE4C766),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.012,
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

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
                            builder: (context) =>
                                SettingsScreen(),
                          ),
                        );
                      },

                      icon: Icon(
                        Icons.arrow_back,
                        size: size.width * 0.075,
                        color: Colors.black,
                      ),
                    ),

                    Text(
                      "Help & Support",

                      style: TextStyle(
                        fontSize: size.width * 0.052,
                        fontWeight: FontWeight.w700,
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

                SizedBox(height: size.height * 0.015),

                /// 🔹 TOP ICON
                Center(
                  child: Container(
                    width: size.width * 0.22,
                    height: size.width * 0.22,

                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),

                    child: Icon(
                      Icons.support_agent,
                      size: size.width * 0.11,
                      color: Colors.black,
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.015),

                /// 🔹 TITLE
                Center(
                  child: Column(
                    children: [

                      Text(
                        "We're here to help you!",

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 3),

                      Text(
                        "Get support for your queries and concerns.",

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.025),

                /// 🔹 QUICK HELP
                Text(
                  "Quick Help",

                  style: TextStyle(
                    fontSize: size.width * 0.055,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: size.height * 0.015),

                /// 🔹 QUICK HELP GRID
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    quickHelpBox(
                      context,
                      icon: Icons.fact_check_outlined,
                      title: "FAQ’s",

                      onTap: () {},
                    ),

                    quickHelpBox(
                      context,
                      icon: Icons.payment,
                      title: "Payments",

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const PaymentIssuesScreen(),
                          ),
                        );
                      },
                    ),

                    quickHelpBox(
                      context,
                      icon: Icons.directions_car,
                      title: "Trips",

                      onTap: () {},
                    ),

                    quickHelpBox(
                      context,
                      icon: Icons.account_circle,
                      title: "Account",

                      onTap: () {},
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.025),

                /// 🔹 POPULAR TOPICS
                Text(
                  "Popular Topics",

                  style: TextStyle(
                    fontSize: size.width * 0.052,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: size.height * 0.015),

                /// 🔹 MAIN CARD
                Container(
                  width: double.infinity,

                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.035,
                    vertical: size.height * 0.018,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),

                    borderRadius:
                    BorderRadius.circular(20),
                  ),

                  child: Column(
                    children: [

                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const PaymentIssuesScreen(),
                            ),
                          );
                        },

                        child: topicTile(
                          title: "Payment Issues",
                          subtitle:
                          "Facing issues with payment or refund?",
                        ),
                      ),

                      divider(),

                      InkWell(
                        onTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const RideIssuesScreen(),
                            ),
                          );
                        },

                        child: topicTile(
                          title: "Ride Related Issues",
                          subtitle:
                          "Issues during booking, ride, or drop-off?",
                        ),
                      ),

                      divider(),


            InkWell(
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const AccountProfileHelpScreen(),
                  ),
                );
              },
                        child: topicTile(
                        title: "Account & Profile",
                        subtitle:
                        "Update info, change password, or verify account.",
                      ),
            ),
                      divider(),

                      topicTile(
                        title: "Promotions & Offers",
                        subtitle:
                        "Have questions about offers or discounts?",
                      ),

                      SizedBox(height: size.height * 0.02),

                      /// 🔹 SUPPORT BOX
                      Container(
                        width: double.infinity,

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),

                          borderRadius:
                          BorderRadius.circular(14),

                          color: Colors.white,
                        ),

                        child: Column(
                          children: [

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                size.width * 0.03,
                                vertical:
                                size.height * 0.014,
                              ),

                              child: Row(
                                children: [

                                  Icon(
                                    Icons.support_agent,
                                    size: size.width * 0.075,
                                    color: Colors.black,
                                  ),

                                  SizedBox(
                                      width:
                                      size.width * 0.025),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,

                                      children: [

                                        Text(
                                          "Still need help?",

                                          style: TextStyle(
                                            fontSize:
                                            size.width *
                                                0.034,

                                            fontWeight:
                                            FontWeight
                                                .w700,
                                          ),
                                        ),

                                        SizedBox(height: 2),

                                        Text(
                                          "Our support team is available\n24/7 to assist you",

                                          style: TextStyle(
                                            fontSize:
                                            size.width *
                                                0.024,

                                            color:
                                            Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  ElevatedButton(
                                    onPressed: () {},

                                    style:
                                    ElevatedButton
                                        .styleFrom(
                                      backgroundColor:
                                      const Color(
                                          0xFF4A423F),

                                      padding:
                                      EdgeInsets.symmetric(
                                        horizontal:
                                        size.width *
                                            0.035,

                                        vertical:
                                        size.height *
                                            0.01,
                                      ),

                                      shape:
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            10),
                                      ),
                                    ),

                                    child: Text(
                                      "Chat",

                                      style: TextStyle(
                                        fontSize:
                                        size.width *
                                            0.022,

                                        color:
                                        Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Divider(
                              color: Colors.grey.shade400,
                              height: 1,
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                size.width * 0.03,
                                vertical:
                                size.height * 0.014,
                              ),

                              child: Row(
                                children: [

                                  Icon(
                                    Icons.mail_outline,
                                    size: size.width * 0.07,
                                    color: Colors.black,
                                  ),

                                  SizedBox(
                                      width:
                                      size.width * 0.025),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,

                                      children: [

                                        Text(
                                          "Email us",

                                          style: TextStyle(
                                            fontSize:
                                            size.width *
                                                0.032,

                                            fontWeight:
                                            FontWeight
                                                .w700,
                                          ),
                                        ),

                                        SizedBox(height: 2),

                                        Text(
                                          "Support@metersay.com",

                                          style: TextStyle(
                                            fontSize:
                                            size.width *
                                                0.023,

                                            color:
                                            Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Icon(
                                    Icons.chevron_right,
                                    size: size.width * 0.06,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
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
      ),
    );
  }

  /// 🔹 QUICK HELP BOX
  Widget quickHelpBox(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
      }) {

    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(16),

      child: Container(
        width: size.width * 0.20,
        height: size.width * 0.20,

        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),

          borderRadius:
          BorderRadius.circular(16),
        ),

        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            Icon(
              icon,
              size: size.width * 0.07,
              color: Colors.black,
            ),

            SizedBox(height: size.height * 0.006),

            Text(
              title,

              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: size.width * 0.028,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 TOPIC TILE
  Widget topicTile({
    required String title,
    required String subtitle,
  }) {

    return Builder(
      builder: (context) {

        final size = MediaQuery.of(context).size;

        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.01,
          ),

          child: Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      title,

                      style: TextStyle(
                        fontSize: size.width * 0.037,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: 3),

                    Text(
                      subtitle,

                      style: TextStyle(
                        fontSize: size.width * 0.028,
                        color: Colors.black87,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: size.width * 0.02),

              Icon(
                Icons.chevron_right,
                size: size.width * 0.06,
                color: Colors.black,
              ),
            ],
          ),
        );
      },
    );
  }

  /// 🔹 DIVIDER
  Widget divider() {
    return Divider(
      color: Colors.grey.shade400,
      thickness: 1,
    );
  }
}