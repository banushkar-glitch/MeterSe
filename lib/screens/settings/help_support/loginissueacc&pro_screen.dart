import 'package:flutter/material.dart';

class LoginIssuesScreen extends StatefulWidget {
  const LoginIssuesScreen({super.key});

  @override
  State<LoginIssuesScreen> createState() =>
      _LoginIssuesScreenState();
}

class _LoginIssuesScreenState
    extends State<LoginIssuesScreen> {

  final TextEditingController searchController =
  TextEditingController();

  final List<Map<String, String>> issues = [

    {
      "title": "Unable to Login",
      "subtitle": "I can't login to my account."
    },

    {
      "title": "Forgot Password",
      "subtitle":
      "I forgot my password"
    },

    {
      "title": "Didn't Receive OTP",
      "subtitle":
      "I didn't receive the OTP on my mobile number."
    },

    {
      "title": "OTP Not Working",
      "subtitle":
      "The OTP I received isn't working."
    },

    {
      "title": "Account Locked",
      "subtitle":
      "My account has been locked."
    },

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,

      body: SafeArea(

        child: Column(

          children: [

            //////////////////////////////////////////////////////
            /// HEADER
            //////////////////////////////////////////////////////

            Container(

              width: double.infinity,
              height: 99,
              color: const Color(0xFFFFD329),

              child: Row(

                children: [

                  const SizedBox(width: 10),

                  IconButton(

                    onPressed: () {

                      /// BACK

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

                      "Login Issues",

                      textAlign: TextAlign.center,

                      style: TextStyle(

                        fontSize: 20,

                        fontWeight: FontWeight.w400,

                      ),

                    ),

                  ),

                  IconButton(

                    onPressed: () {

                      /// NOTIFICATION API

                    },

                    icon: const Icon(
                      Icons.notifications_none,
                      size: 38,
                    ),

                  ),

                  const SizedBox(width: 10),

                ],

              ),

            ),

            //////////////////////////////////////////////////////
            /// FIXED TOP CONTENT
            //////////////////////////////////////////////////////

            Container(

              color: const Color(0xFFEAEAEA),

              padding: const EdgeInsets.fromLTRB(
                18,
                20,
                18,
                15,
              ),

              child: Column(

                children: [

                  const Text(

                    "Facing login issues?",

                    style: TextStyle(

                      fontSize: 20,

                      fontWeight: FontWeight.w500,

                    ),

                  ),

                  const SizedBox(height: 8),

                  const SizedBox(

                    width: 300,

                    child: Text(

                      "We're here to help you get back to your account.",

                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontSize: 12,
                      ),

                    ),

                  ),

                  const SizedBox(height: 15),

                  //////////////////////////////////////////////////////
                  /// SEARCH BAR
                  //////////////////////////////////////////////////////

                  SizedBox(

                    height: 40,

                    child: TextField(

                      controller: searchController,

                      onChanged: (value) {

                        /// SEARCH API

                      },

                      decoration: InputDecoration(

                        hintText:
                        "Search login issues...",

                        hintStyle: const TextStyle(
                          fontSize: 11,
                        ),

                        prefixIcon: const Padding(

                          padding: EdgeInsets.only(left: 8),

                          child: Icon(
                            Icons.search,
                            size: 28,
                            color: Colors.black,
                          ),

                        ),

                        prefixIconConstraints:
                        const BoxConstraints(
                          minWidth: 48,
                        ),

                        contentPadding:
                        const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 8,
                        ),

                        filled: true,

                        fillColor: Colors.white,

                        border: OutlineInputBorder(

                          borderRadius:
                          BorderRadius.circular(10),

                        ),

                        enabledBorder:
                        OutlineInputBorder(

                          borderRadius:
                          BorderRadius.circular(10),

                          borderSide: BorderSide(
                            color: Colors.black26,
                          ),

                        ),

                      ),

                    ),

                  ),

                ],

              ),

            ),

            //////////////////////////////////////////////////////
            /// ONLY THIS SECTION SCROLLS
            //////////////////////////////////////////////////////

            Expanded(

              child: Container(

                color: const Color(0xFFEAEAEA),

                child: ListView(

                  padding: const EdgeInsets.fromLTRB(
                    18,
                    0,
                    18,
                    0,
                  ),

                  children: [

                    const SizedBox(height: 8),

                    const Text(

                      "Common Login Issues",

                      style: TextStyle(

                        fontSize: 13,

                        fontWeight: FontWeight.w700,

                      ),

                    ),

                    const SizedBox(height: 10),

                    //////////////////////////////////////////////////////
                    /// ISSUES LIST
                    //////////////////////////////////////////////////////

                    ...List.generate(

                      issues.length,

                          (index) {

                        return InkWell(

                          onTap: () {

                            //////////////////////////////////////////
                            /// BACKEND API
                            ///
                            /// Open selected help page
                            ///
                            /// Pass:
                            /// issues[index]["title"]
                            //////////////////////////////////////////

                          },

                          child: Container(

                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                            ),

                            decoration: BoxDecoration(

                              border: Border(

                                bottom: BorderSide(
                                  color: Colors.grey.shade300,
                                ),

                              ),

                            ),

                            child: Row(

                              children: [

                                Expanded(

                                  child: Column(

                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                    children: [

                                      Text(

                                        issues[index]["title"]!,

                                        style: const TextStyle(

                                          fontSize: 12,

                                          fontWeight:
                                          FontWeight.w700,

                                        ),

                                      ),

                                      const SizedBox(height: 5),

                                      Text(

                                        issues[index]["subtitle"]!,

                                        style: const TextStyle(

                                          fontSize: 12,

                                          color: Colors.black54,

                                        ),

                                      ),

                                    ],

                                  ),

                                ),

                                IconButton(

                                  onPressed: () {

                                    ////////////////////////////////////
                                    /// BACKEND API
                                    ///
                                    /// Same action as tile click
                                    ////////////////////////////////////

                                  },

                                  icon: const Icon(

                                    Icons.chevron_right,

                                    color: Colors.black,

                                    size: 24,

                                  ),

                                ),

                              ],

                            ),

                          ),

                        );

                      },

                    ),

                    const SizedBox(height: 18),

                    //////////////////////////////////////////////////////
                    /// STILL NEED HELP
                    //////////////////////////////////////////////////////

                    Container(

                      height: 86,

                      decoration: BoxDecoration(

                        color: Colors.white,

                        border: Border.all(
                          color: Colors.black26,
                        ),

                        borderRadius:
                        BorderRadius.circular(5),

                      ),

                      child: Column(

                        children: [

                          Expanded(

                            child: Padding(

                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),

                              child: Row(

                                children: [

                                  Image.asset(

                                    "assets/help.png",

                                    width: 32,
                                    height: 32,

                                    fit: BoxFit.contain,

                                  ),

                                  const SizedBox(width: 12),

                                  const Expanded(

                                    child: Column(

                                      mainAxisAlignment:
                                      MainAxisAlignment.center,

                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,

                                      children: [

                                        Text(

                                          "Still need help?",

                                          style: TextStyle(

                                            fontSize: 12,

                                            fontWeight:
                                            FontWeight.w700,

                                          ),

                                        ),

                                      ],

                                    ),

                                  ),

                                  SizedBox(

                                    width: 112,

                                    height: 28,

                                    child: ElevatedButton(

                                      onPressed: () {

                                        ////////////////////////////////////
                                        /// BACKEND API
                                        ///
                                        /// Open Chat Support
                                        ////////////////////////////////////

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

                          const SizedBox(height: 0),

                          Divider(
                            height: 1,
                            color: Colors.grey.shade300,
                          ),

                          const SizedBox(height: 0),

                          InkWell(

                            onTap: () {

                              ////////////////////////////////////
                              /// BACKEND API
                              ///
                              /// Launch Email
                              ////////////////////////////////////

                            },

                            child: Padding(

                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),

                              child: Row(

                                children: [

                                  Image.asset(

                                    "assets/message.png",


                                    width: 32,
                                    height: 32,

                                  ),

                                  const SizedBox(width: 12),

                                  const Column(

                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                    children: [

                                      Text(

                                        "Email us",

                                        style: TextStyle(

                                          fontSize: 10,

                                          fontWeight:
                                          FontWeight.w500,

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

                                    ],

                                  ),

                                  const Spacer(),

                                  const Icon(

                                    Icons.chevron_right,

                                    size: 20,

                                  ),

                                ],

                              ),

                            ),

                          ),

                        ],

                      ),

                    ),

                    const SizedBox(height: 20),

                  ],

                ),

              ),

            ),

            //////////////////////////////////////////////////////
            /// FIXED FOOTER
            //////////////////////////////////////////////////////

            Container(

              width: double.infinity,

              height: 99,

              color: const Color(0xFF3C3A3A),

            ),

          ],

        ),

      ),

    );

  }

}