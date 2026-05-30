import 'package:flutter/material.dart';
import '../settings_screen.dart';
import 'helpsupportsettings_screen.dart';

class PromotionsOffersScreen extends StatelessWidget {
  const PromotionsOffersScreen({super.key});

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
              vertical: size.height * 0.01,
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
                            builder: (context) =>
                                HelpSupportScreen(),
                          ),
                        );
                      },

                      icon: Icon(
                        Icons.arrow_back,
                        size: size.width * 0.07,
                        color: Colors.black,
                      ),
                    ),

                    Text(
                      "Promotions & Offers",

                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),

                    Icon(
                      Icons.notifications_none,
                      size: size.width * 0.06,
                      color: Colors.black,
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.01),

                /// 🔹 TOP ICON
                Container(
                  width: size.width * 0.16,
                  height: size.width * 0.16,

                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),

                  child: Icon(
                    Icons.local_offer_outlined,
                    size: size.width * 0.08,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: size.height * 0.012),

                /// 🔹 TITLE
                Text(
                  "Have questions about offers?",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: size.height * 0.004),

                Text(
                  "Find answers to all your questions related to\npromotions and offers.",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: size.width * 0.022,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),

                SizedBox(height: size.height * 0.018),

                /// 🔹 SEARCH BAR
                Container(
                  width: double.infinity,

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
                        size: size.width * 0.055,
                        color: Colors.black54,
                      ),

                      SizedBox(width: size.width * 0.02),

                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText:
                            "Search promotions and offers issues",

                            hintStyle: TextStyle(
                              fontSize:
                              size.width * 0.022,
                            ),

                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.018),

                /// 🔹 MAIN WHITE CARD
                Container(
                  width: double.infinity,

                  constraints: BoxConstraints(
                    minHeight: size.height * 0.5,
                  ),

                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.height * 0.015,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),

                    borderRadius:
                    BorderRadius.circular(18),
                  ),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      /// 🔹 SECTION TITLE
                      Text(
                        "Common Promotions & Offers Issues",

                        style: TextStyle(
                          fontSize: size.width * 0.026,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: size.height * 0.012),

                      /// 🔹 ISSUE LIST
                      issueTile(
                        size,
                        title: "Promo Code Not Working",
                        subtitle:
                        "Facing issues while applying promo code?",
                      ),

                      divider(),

                      issueTile(
                        size,
                        title: "Offer Not Received",
                        subtitle:
                        "Didn't receive the offer or bonus?",
                      ),

                      divider(),

                      issueTile(
                        size,
                        title: "Offer Validity & Expiry",
                        subtitle:
                        "Check offer validity and expiry related issues",
                      ),

                      divider(),

                      issueTile(
                        size,
                        title: "Missed Bonus or Incentive",
                        subtitle:
                        "Didn't receive your expected bonus or incentive?",
                      ),

                      divider(),

                      issueTile(
                        size,
                        title: "Incorrect Bonus Amount",
                        subtitle:
                        "Received lower bonus than expected?",
                      ),

                      SizedBox(height: size.height * 0.02),

                      /// 🔹 SUPPORT BOX
                      Container(
                        width: double.infinity,

                        padding: EdgeInsets.symmetric(
                          horizontal:
                          size.width * 0.025,

                          vertical:
                          size.height * 0.01,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius:
                          BorderRadius.circular(12),

                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),

                        child: Column(
                          children: [

                            Row(
                              children: [

                                Icon(
                                  Icons.support_agent,
                                  size: size.width * 0.055,
                                  color: Colors.black,
                                ),

                                SizedBox(
                                  width:
                                  size.width * 0.02,
                                ),

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
                                              0.023,

                                          fontWeight:
                                          FontWeight
                                              .w700,
                                        ),
                                      ),

                                      Text(
                                        "Our support team is available\n24/7 to assist you",

                                        style: TextStyle(
                                          fontSize:
                                          size.width *
                                              0.017,

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
                                          0.03,

                                      vertical:
                                      size.height *
                                          0.008,
                                    ),

                                    shape:
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          8),
                                    ),
                                  ),

                                  child: Text(
                                    "Chat with Us",

                                    style: TextStyle(
                                      fontSize:
                                      size.width *
                                          0.018,

                                      color:
                                      Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Divider(
                              color: Colors.grey.shade400,
                            ),

                            Row(
                              children: [

                                Icon(
                                  Icons.email_outlined,
                                  size: size.width * 0.05,
                                  color: Colors.black,
                                ),

                                SizedBox(
                                  width:
                                  size.width * 0.02,
                                ),

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
                                              0.022,

                                          fontWeight:
                                          FontWeight
                                              .w600,
                                        ),
                                      ),

                                      Text(
                                        "Support@metersay.com",

                                        style: TextStyle(
                                          fontSize:
                                          size.width *
                                              0.017,

                                          color:
                                          Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Icon(
                                  Icons.chevron_right,
                                  size: size.width * 0.05,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ],
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

  /// 🔹 ISSUE TILE
  Widget issueTile(
      Size size, {
        required String title,
        required String subtitle,
      }) {

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.006,
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
                    fontSize: size.width * 0.023,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 2),

                Text(
                  subtitle,

                  style: TextStyle(
                    fontSize: size.width * 0.017,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: size.width * 0.015),

          Icon(
            Icons.chevron_right,
            size: size.width * 0.045,
            color: Colors.black,
          ),
        ],
      ),
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