import 'package:flutter/material.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() =>
      _HelpSupportScreenState();
}

class _HelpSupportScreenState
    extends State<HelpSupportScreen> {

  /////////////////////////////////////////////////////////
  /// QUICK HELP (Backend API Later)
  /////////////////////////////////////////////////////////

  final List<Map<String, String>> quickHelp = [

    {
      "title": "FAQ's",
      "icon": "assets/faq.png",
    },

    {
      "title": "Payments",
      "icon": "assets/payment.png",
    },

    {
      "title": "Trips",
      "icon": "assets/autodocument.png",
    },

    {
      "title": "Account",
      "icon": "assets/account.png",
    },

  ];

  /////////////////////////////////////////////////////////
  /// POPULAR TOPICS (Backend API Later)
  /////////////////////////////////////////////////////////

  final List<Map<String, String>> topics = [

    {
      "title": "Payment Issues",
      "subtitle":
      "Facing issues with payment or refund?"
    },

    {
      "title": "Ride Related Issues",
      "subtitle":
      "Issues during booking, ride, or drop-off?"
    },

    {
      "title": "Account & Profile",
      "subtitle":
      "Update info, change password, or verify account."
    },

    {
      "title": "Promotions & Offers",
      "subtitle":
      "Have questions about offers or discounts?"
    },

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        resizeToAvoidBottomInset: false,

        backgroundColor: Colors.white,

        body: SafeArea(

            child: Column(

              children: [

              //////////////////////////////////////////////////////
              /// HEADER
              //////////////////////////////////////////////////////

              Container(

              height: 99,

              width: double.infinity,

              color: const Color(0xFFFFD329),

              child: Row(

                children: [

                  const SizedBox(width: 12),

                  IconButton(

                    onPressed: () {

                      Navigator.pop(context);

                    },

                    icon: const Icon(
                      Icons.arrow_back,
                      size: 38,
                      color: Colors.black,
                    ),

                  ),

                  const Expanded(

                    child: Text(

                      "Help & Support",

                      textAlign: TextAlign.center,

                      style: TextStyle(

                        fontSize: 20,

                        fontWeight: FontWeight.w400,

                      ),

                    ),

                  ),

                  IconButton(

                    onPressed: () {

                      /// Notification API

                    },

                    icon: const Icon(
                      Icons.notifications_none,
                      size: 38,
                    ),

                  ),

                  const SizedBox(width: 12),

                ],

              ),

            ),

            //////////////////////////////////////////////////////
            /// BODY
            //////////////////////////////////////////////////////

            Expanded(

                child: Container(

                  color: const Color(0xFFEAEAEA),

                  child: Column(

                      children: [

                      const SizedBox(height: 10),

                        CircleAvatar(
                          radius: 50, // Increase avatar size
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            "assets/help.png",
                            width: 70,
                            height: 70,
                            fit: BoxFit.contain,
                          ),
                        ),

                  const SizedBox(height: 12),

                  const Text(

                    "We're here to help you!",

                    style: TextStyle(

                      fontSize: 20,

                      fontWeight: FontWeight.w600,

                    ),

                  ),

                  const SizedBox(height: 4),

                  const Text(

                    "Get support for your queries and concerns.",

                    style: TextStyle(

                      fontSize: 13,

                    ),

                  ),

                  const SizedBox(height: 18),

                  const Padding(

                    padding: EdgeInsets.symmetric(horizontal: 15),

                    child: Align(

                      alignment: Alignment.centerLeft,

                      child: Text(

                        "Quick Help",

                        style: TextStyle(

                          fontSize: 20,

                          fontWeight: FontWeight.w500,

                        ),

                      ),

                    ),

                  ),

                  const SizedBox(height: 12),

                  //////////////////////////////////////////////////////
                  /// QUICK HELP CARDS
                  //////////////////////////////////////////////////////

                  Padding(

                    padding: const EdgeInsets.symmetric(horizontal: 12),

                    child: Row(

                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: List.generate(

                        quickHelp.length,

                            (index) {

                          return InkWell(

                            onTap: () {

                              //////////////////////////////////////////////////
                              /// BACKEND API
                              ///
                              /// FAQ Screen
                              /// Payment Help
                              /// Trips Help
                              /// Account Help
                              //////////////////////////////////////////////////

                            },

                            borderRadius:
                            BorderRadius.circular(10),

                            child: SizedBox(

                              width: 75,

                              child: Column(

                                children: [

                                  Container(

                                    width: 70,
                                    height: 65,

                                    decoration: BoxDecoration(

                                      color: Colors.white,

                                      borderRadius:
                                      BorderRadius.circular(10),

                                    ),

                                    child: Center(

                                      child: Image.asset(

                                        quickHelp[index]["icon"]!,

                                        width: 40,
                                        height: 40,

                                        fit: BoxFit.contain,

                                      ),

                                    ),

                                  ),

                                  const SizedBox(height: 6),

                                  Text(

                                    quickHelp[index]["title"]!,

                                    style: const TextStyle(

                                      fontSize: 14,

                                      fontWeight:
                                      FontWeight.w300,

                                    ),

                                  ),

                                ],

                              ),

                            ),

                          );

                        },

                      ),

                    ),

                  ),

                  const SizedBox(height: 20),

                  //////////////////////////////////////////////////////
                  /// POPULAR TOPICS TITLE
                  //////////////////////////////////////////////////////

                  const Padding(

                    padding:
                    EdgeInsets.symmetric(horizontal: 15),

                    child: Align(

                      alignment: Alignment.centerLeft,

                      child: Text(

                        "Popular Topics",

                        style: TextStyle(

                          fontSize: 20,

                          fontWeight: FontWeight.w500,

                        ),

                      ),

                    ),

                  ),

                  const SizedBox(height: 10),

                    //////////////////////////////////////////////////////
                    /// POPULAR TOPICS LIST
                    //////////////////////////////////////////////////////

                    Expanded(

                      child: ListView.builder(

                        physics: const NeverScrollableScrollPhysics(),

                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),

                        itemCount: topics.length,

                        itemBuilder: (context, index) {

                          return InkWell(

                            onTap: () {

                              ///////////////////////////////////////////
                              /// BACKEND API
                              ///
                              /// Open selected help topic
                              ///
                              /// Pass:
                              /// topics[index]["title"]
                              ///////////////////////////////////////////

                            },

                            child: Container(

                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                              ),

                              decoration: BoxDecoration(

                                border: Border(

                                  bottom: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),

                                ),

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

                                          topics[index]["title"]!,

                                          style: const TextStyle(

                                            fontSize: 13,

                                            fontWeight:
                                            FontWeight.w600,

                                          ),

                                        ),

                                        const SizedBox(height: 4),

                                        Text(

                                          topics[index]["subtitle"]!,

                                          style: const TextStyle(

                                            fontSize: 12,

                                            color: Colors.black54,

                                          ),

                                        ),

                                      ],

                                    ),

                                  ),

                                  const SizedBox(width: 8),

                                  const Icon(

                                    Icons.chevron_right,

                                    size: 22,

                                    color: Colors.black,

                                  ),

                                ],

                              ),

                            ),

                          );

                        },

                      ),

                    ),

                    //////////////////////////////////////////////////////
                    /// STILL NEED HELP CONTAINER
                    //////////////////////////////////////////////////////

                    Container(

                      margin: const EdgeInsets.fromLTRB(
                        20,
                        8,
                        20,
                        12,
                      ),

                      height: 86,

                      decoration: BoxDecoration(

                        color: Colors.white,

                        border: Border.all(
                          color: Colors.black26,
                        ),

                        borderRadius:
                        BorderRadius.circular(5),

                      ),

                      child: Padding(

                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),

                        child: Row(

                          children: [

                            //////////////////////////////////////////////////////
                            /// SUPPORT ICON
                            //////////////////////////////////////////////////////

                            Image.asset(
                              "assets/help.png",
                              width: 33,
                              height: 33,
                              fit: BoxFit.contain,
                            ),

                            const SizedBox(width: 10),

                            //////////////////////////////////////////////////////
                            /// TEXT
                            //////////////////////////////////////////////////////

                            const Expanded(

                              child: Column(

                                crossAxisAlignment:
                                CrossAxisAlignment.start,

                                mainAxisAlignment:
                                MainAxisAlignment.center,

                                children: [

                                  Text(

                                    "Still need help?",

                                    style: TextStyle(

                                      fontSize: 12,

                                      fontWeight:
                                      FontWeight.w600,

                                    ),

                                  ),

                                  SizedBox(height: 2),

                                  Text(

                                    "Support@metersay.com",

                                    style: TextStyle(

                                      fontSize: 8,

                                      color: Colors.black54,

                                    ),

                                  ),

                                  SizedBox(height: 5),

                                  Text(

                                    "Email us",

                                    style: TextStyle(

                                      fontSize: 10,

                                      fontWeight:
                                      FontWeight.w400,

                                    ),

                                  ),

                                ],

                              ),

                            ),

                            //////////////////////////////////////////////////////
                            /// CHAT BUTTON
                            //////////////////////////////////////////////////////

                            SizedBox(

                              width: 112,
                              height: 28,

                              child: ElevatedButton(

                                onPressed: () {

                                  //////////////////////////////////////////////////
                                  /// BACKEND API
                                  ///
                                  /// Open Chat Screen
                                  ///
                                  /// OR
                                  ///
                                  /// Open WhatsApp
                                  ///
                                  /// OR
                                  ///
                                  /// Live Support
                                  //////////////////////////////////////////////////

                                },

                                style: ElevatedButton.styleFrom(

                                  backgroundColor:
                                  const Color(0xFF4C4545),

                                  shape:
                                  RoundedRectangleBorder(

                                    borderRadius:
                                    BorderRadius.circular(5),

                                  ),

                                ),

                                child: const Text(

                                  "Chat with Us",

                                  style: TextStyle(

                                    fontSize: 9,

                                    color: Colors.white,

                                  ),

                                ),

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

                //////////////////////////////////////////////////////
                /// FOOTER
                //////////////////////////////////////////////////////

                Container(

                  width: double.infinity,

                  height: 60,

                  color: const Color(0xFF3C3A3A),

                ),

              ],

            ),

        ),

    );

  }

}