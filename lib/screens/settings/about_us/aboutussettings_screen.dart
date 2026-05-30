import 'package:flutter/material.dart';
import '../settings_screen.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

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
                      "About Us",

                      style: TextStyle(
                        fontSize: size.width * 0.05,
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

                SizedBox(height: size.height * 0.01),

                /// 🔹 LOGO
                Container(
                  width: size.width * 0.30,
                  height: size.width * 0.30,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),

                  child: ClipOval(
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.012),

                /// 🔹 TAGLINE
                Text(
                  "Driven by Trust. Powered by Technology.",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: size.width * 0.032,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: size.height * 0.02),

                /// 🔹 MAIN CAqRD
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: size.height * 0.65,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                    vertical: size.height * 0.03,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),

                    borderRadius:
                    BorderRadius.circular(20),
                  ),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      buildSection(
                        title: "Who We Are",

                        content:
                        "Metersay is a technology-driven platform connecting riders with professional drivers for safe and affordable journeys.",

                        size: size,
                      ),

                      buildDivider(),

                      buildSection(
                        title: "Our Mission",

                        content:
                        "To make every ride comfortable and accessible while creating opportunities for drivers.",

                        size: size,
                      ),

                      buildDivider(),

                      buildSection(
                        title: "Our Vision",

                        content:
                        "To become the most trusted mobility platform for smarter city travel.",

                        size: size,
                      ),

                      buildDivider(),

                      buildSection(
                        title: "Our Values",

                        content:
                        "Safety, transparency, trust and customer satisfaction are our top priorities.",

                        size: size,
                      ),

                      SizedBox(height: size.height * 0.02),

                      /// 🔹 SUPPORT BOX
                      Container(
                        width: double.infinity,

                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.014,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius:
                          BorderRadius.circular(14),

                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),

                        child: Row(
                          children: [

                            Icon(
                              Icons.support_agent,
                              size: size.width * 0.07,
                              color: Colors.black,
                            ),

                            SizedBox(width: size.width * 0.025),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,

                                children: [

                                  Text(
                                    "We're here for you!",

                                    style: TextStyle(
                                      fontSize:
                                      size.width * 0.03,

                                      fontWeight:
                                      FontWeight.w700,

                                      color: Colors.black,
                                    ),
                                  ),

                                  SizedBox(height: 2),

                                  Text(
                                    "support@metersay.com",

                                    style: TextStyle(
                                      fontSize:
                                      size.width * 0.023,

                                      color: Colors.black87,
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
                                const Color(0xFF4A423F),

                                padding:
                                EdgeInsets.symmetric(
                                  horizontal:
                                  size.width * 0.03,

                                  vertical:
                                  size.height * 0.01,
                                ),

                                shape:
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                      10),
                                ),
                              ),

                              child: Text(
                                "Contact",

                                style: TextStyle(
                                  fontSize:
                                  size.width * 0.022,

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

                SizedBox(height: size.height * 0.015),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 SECTION
  Widget buildSection({
    required String title,
    required String content,
    required Size size,
  }) {

    return Padding(
      padding: EdgeInsets.only(
        bottom: size.height * 0.012,
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Text(
            title,

            style: TextStyle(
              fontSize: size.width * 0.038,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),

          SizedBox(height: size.height * 0.005),

          Text(
            content,

            style: TextStyle(
              fontSize: size.width * 0.027,
              height: 1.35,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 DIVIDER
  /// 🔹 DIVIDER
  Widget buildDivider() {

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),

      child: Divider(
        color: Colors.grey.shade400,
        thickness: 1,
      ),
    );
  }
}