import 'package:flutter/material.dart';
import 'helpsupportsettings_screen.dart';
import 'loginissueacc&pro_screen.dart';
class AccountProfileHelpScreen extends StatelessWidget {
  const AccountProfileHelpScreen({super.key});

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
                      "Account & Profile",

                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),

                    Icon(
                      Icons.notifications_none,
                      size: size.width * 0.065,
                      color: Colors.black,
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.01),

                /// 🔹 PROFILE ICON
                Container(
                  width: size.width * 0.16,
                  height: size.width * 0.16,

                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),

                  child: Icon(
                    Icons.account_circle,
                    size: size.width * 0.09,
                    color: Colors.blue,
                  ),
                ),

                SizedBox(height: size.height * 0.012),

                /// 🔹 TITLE

                Text(
                  "Account & Profile Help",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: size.height * 0.003),

                Text(
                  "Find solutions for issues related to your account and profile.",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: size.width * 0.022,
                    color: Colors.black87,
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
                            "Search account and profile issues...",

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

                SizedBox(height: size.height * 0.016),

                /// 🔹 MAIN WHITE CARD
                Container(
                  width: double.infinity,

                  constraints: BoxConstraints(
                    minHeight: size.height * 0.48,
                  ),

                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.height * 0.016,
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
                        "Common Account Issues",

                        style: TextStyle(
                          fontSize: size.width * 0.027,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: size.height * 0.012),

                      /// 🔹 ISSUE TILES
                  GestureDetector(
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                           LoginIssuesScreen(),
                        ),
                      );
                    },
                     child: issueTile(
                        size,
                        title: "Login Issues",
                        subtitle:
                        "Unable to login to your account?",
                      ),
                  ),
                      divider(),

                      issueTile(
                        size,
                        title: "Mobile Number update",
                        subtitle:
                        "Need to change your registered mobile number?",
                      ),

                      divider(),

                      issueTile(
                        size,
                        title: "Email Address update",
                        subtitle:
                        "Need to change your registered email address?",
                      ),

                      divider(),

                      issueTile(
                        size,
                        title: "Profile Information",
                        subtitle:
                        "Update your name, profile picture or other details.",
                      ),

                      divider(),

                      issueTile(
                        size,
                        title: "Account Deactivation",
                        subtitle:
                        "Temporarily or permanently deactivate your account.",
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