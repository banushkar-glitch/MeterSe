import 'package:flutter/material.dart';
import 'helpsupportsettings_screen.dart';
class RideIssuesScreen extends StatelessWidget {
  const RideIssuesScreen({super.key});

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
              horizontal: size.width * 0.035,
              vertical: size.height * 0.012,
            ),

            child: Column(
              children: [

                /// 🔹 TOP BAR
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HelpSupportScreen(),
                          ),
                        );
                      },

                      icon: Icon(
                        Icons.arrow_back,
                        size: size.width * 0.072,
                        color: Colors.black,
                      ),
                    ),

                    Text(
                      "Ride related issues",

                      style: TextStyle(
                        fontSize: size.width * 0.043,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    IconButton(
                      onPressed: () {},

                      icon: Icon(
                        Icons.notifications_none,
                        size: size.width * 0.062,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.008),

                /// 🔹 TOP ICON
                CircleAvatar(
                  radius: size.width * 0.08,
                  backgroundColor: Colors.white,

                  child: Icon(
                    Icons.local_taxi,
                    size: size.width * 0.07,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: size.height * 0.01),

                /// 🔹 TITLE
                Text(
                  "Facing issue with a trip?",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: size.height * 0.003),

                /// 🔹 SUBTITLE
                Text(
                  "We're here to help you with any ride related issues.",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: size.width * 0.022,
                    color: Colors.black54,
                  ),
                ),

                SizedBox(height: size.height * 0.015),

                /// 🔹 SEARCH BAR
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(10),
                  ),

                  child: Row(
                    children: [

                      Icon(
                        Icons.search,
                        size: size.width * 0.05,
                        color: Colors.black54,
                      ),

                      SizedBox(width: size.width * 0.02),

                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText:
                            "Search ride issues...",

                            hintStyle: TextStyle(
                              fontSize:
                              size.width * 0.023,
                              color: Colors.black45,
                            ),

                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.015),

                /// 🔹 SECTION TITLE
                Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    "Common Ride Issues",

                    style: TextStyle(
                      fontSize: size.width * 0.026,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.008),

                /// 🔹 MAIN ISSUES BOX
                Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),

                    borderRadius:
                    BorderRadius.circular(14),

                    border: Border.all(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),

                  child: Column(
                    children: const [

                      RideIssueTile(
                        title:
                        "Wrong Pickup or Drop Location",

                        subtitle:
                        "Wrong Pickup or Drop Location",
                      ),

                      RideIssueTile(
                        title:
                        "Trip Cancelled by User",

                        subtitle:
                        "User cancelled the trip for no valid reason?",
                      ),

                      RideIssueTile(
                        title:
                        "Trip Duration or Distance",

                        subtitle:
                        "Trip duration or distance seems incorrect?",
                      ),

                      RideIssueTile(
                        title:
                        "Fare or Price Issues",

                        subtitle:
                        "Fare is different from what was shown?",
                      ),

                      RideIssueTile(
                        title:
                        "Route Related Issues",

                        subtitle:
                        "Took a different route or route not followed?",
                        isLast: true,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.015),

                /// 🔹 SUPPORT BOX
                Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),

                    borderRadius:
                    BorderRadius.circular(12),

                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),

                  child: Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.01,
                        ),

                        child: Row(
                          children: [

                            Icon(
                              Icons.support_agent,
                              size: size.width * 0.07,
                            ),

                            SizedBox(width: size.width * 0.025),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,

                                children: [

                                  Text(
                                    "Still need help?",

                                    style: TextStyle(
                                      fontSize:
                                      size.width * 0.028,
                                      fontWeight:
                                      FontWeight.w600,
                                    ),
                                  ),

                                  SizedBox(
                                    height:
                                    size.height * 0.002,
                                  ),

                                  Text(
                                    "Our support team is available\n24/7 to assist you",

                                    style: TextStyle(
                                      fontSize:
                                      size.width * 0.02,
                                      color:
                                      Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {},

                              style:
                              ElevatedButton.styleFrom(
                                backgroundColor:
                                const Color(
                                    0xFF4A423F),

                                padding:
                                EdgeInsets.symmetric(
                                  horizontal:
                                  size.width * 0.035,
                                  vertical:
                                  size.height * 0.009,
                                ),

                                shape:
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius
                                      .circular(8),
                                ),
                              ),

                              child: Text(
                                "Chat with Us",

                                style: TextStyle(
                                  fontSize:
                                  size.width * 0.021,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Divider(
                        color: Colors.grey.shade300,
                        height: 1,
                      ),

                      InkWell(
                        onTap: () {},

                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                            vertical: size.height * 0.012,
                          ),

                          child: Row(
                            children: [

                              Icon(
                                Icons.mail_outline,
                                size: size.width * 0.065,
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
                                      "Email us",

                                      style: TextStyle(
                                        fontSize:
                                        size.width *
                                            0.027,
                                        fontWeight:
                                        FontWeight
                                            .w600,
                                      ),
                                    ),

                                    SizedBox(
                                      height:
                                      size.height *
                                          0.002,
                                    ),

                                    Text(
                                      "Support@metersay.com",

                                      style: TextStyle(
                                        fontSize:
                                        size.width *
                                            0.02,
                                        color: Colors
                                            .black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Icon(
                                Icons.arrow_forward_ios,
                                size: size.width * 0.03,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.015),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 🔹 REUSABLE ISSUE TILE
class RideIssueTile extends StatelessWidget {

  final String title;
  final String subtitle;
  final bool isLast;

  const RideIssueTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Column(
      children: [

        InkWell(
          onTap: () {},

          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03,
              vertical: size.height * 0.013,
            ),

            child: Row(
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Text(
                        title,

                        style: TextStyle(
                          fontSize: size.width * 0.025,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.003,
                      ),

                      Text(
                        subtitle,

                        style: TextStyle(
                          fontSize: size.width * 0.02,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: size.width * 0.02),

                Icon(
                  Icons.arrow_forward_ios,
                  size: size.width * 0.03,
                ),
              ],
            ),
          ),
        ),

        if (!isLast)
          Divider(
            color: Colors.grey.shade300,
            height: 1,
          ),
      ],
    );
  }
}