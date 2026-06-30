import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() =>
      _TermsConditionsScreenState();
}

class _TermsConditionsScreenState
    extends State<TermsConditionsScreen> {

  bool agree = false;

  ///==========================
  /// BACKEND TERMS API
  ///==========================
  /// Replace this list with API response.
  final List<Map<String, String>> terms = [

    {
      "title": "1. Introduction",
      "desc":
      "Welcome to Metersay Driver. These Terms & Conditions govern your use of our platform. By using the app, you agree to comply with and be bound by these terms."
    },

    {
      "title": "2. Driver Responsibilities",
      "desc":
      "Drivers must follow all traffic rules and regulations. You are responsible for providing accurate information and maintaining professional behavior at all times."
    },

    {
      "title": "3. Ratings & Feedback",
      "desc":
      "Driver performance may be monitored through user feedback."
    },

    {
      "title": "4. Cancellation Policy",
      "desc":
      "Unnecessary cancellation of rides is not allowed. Repeated cancellations may affect your account status and earnings."
    },

    {
      "title": "5. Account Suspension",
      "desc":
      "Violation of any of these terms may result in temporary or permanent suspension of your account without prior notice."
    },

    {
      "title": "6. Fare Policy",
      "desc":
      "All rides must follow meter-based pricing only. Overcharging is strictly prohibited."
    },

    {
      "title": "7. Privacy Policy",
      "desc":
      "We respect your privacy and are committed to protecting your personal data in accordance with our Privacy Policy."
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

              ////////////////////////////////////////////////////
              /// HEADER
              ////////////////////////////////////////////////////

              Container(

              height: 99,
              color: const Color(0xFFFFD329),

              child: Row(

                children: [

                  const SizedBox(width: 10),

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

                      "Terms & Conditions",

                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
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

                  const SizedBox(width: 10),

                ],

              ),

            ),

            ////////////////////////////////////////////////////
            /// BODY
            ////////////////////////////////////////////////////

            Expanded(

                child: Container(

                  color: const Color(0xFFEAEAEA),

                  child: Column(

                      children: [

                      const SizedBox(height: 20),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),

                            child: ListView.builder(

                        padding: const EdgeInsets.only(
                          top: 15,
                          left: 15,
                          right: 15,
                          bottom: 15,
                        ),

                        itemCount: terms.length,

                        itemBuilder: (context, index) {

                          return termTile(
                            terms[index]["title"]!,
                            terms[index]["desc"]!,
                          );

                        },

                      ),

                    ),

                  ),

                        ////////////////////////////////////////////////////
                        /// FIXED BOTTOM
                        ////////////////////////////////////////////////////

                        Padding(

                          padding: const EdgeInsets.fromLTRB(
                            20,
                            15,
                            20,
                            15,
                          ),

                          child: Column(

                            mainAxisSize: MainAxisSize.min,

                            children: [

                              //////////////////////////////////////////////
                              /// CHECKBOX
                              //////////////////////////////////////////////

                              Row(

                                children: [

                                  Checkbox(

                                    value: agree,

                                    activeColor:
                                    const Color(0xFF5A5151),

                                    onChanged: (value) {

                                      setState(() {

                                        agree = value!;

                                      });

                                    },

                                  ),

                                  const Expanded(

                                    child: Text(

                                      "I agree to the Terms & Conditions",

                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),

                                    ),

                                  ),

                                ],

                              ),

                              const SizedBox(height: 12),

                              //////////////////////////////////////////////
                              /// ACCEPT BUTTON
                              //////////////////////////////////////////////

                              SizedBox(

                                width: double.infinity,
                                height: 48,

                                child: ElevatedButton(

                                  onPressed: agree
                                      ? () {

                                    //////////////////////////////////////
                                    /// BACKEND API
                                    //////////////////////////////////////
                                    ///
                                    /// Send Agree = true
                                    ///
                                    /// Navigate Next Screen
                                    ///
                                  }
                                      : null,

                                  style: ElevatedButton.styleFrom(

                                    backgroundColor:
                                    const Color(0xFF5A5151),

                                    disabledBackgroundColor:
                                    Colors.grey.shade400,

                                    shape: RoundedRectangleBorder(

                                      borderRadius:
                                      BorderRadius.circular(10),

                                    ),

                                  ),

                                  child: const Text(

                                    "Accept & Continue",

                                    style: TextStyle(

                                      fontSize: 18,

                                      fontWeight: FontWeight.w500,

                                      color: Colors.white,

                                    ),

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
    );
  }

  ////////////////////////////////////////////////////////////
  /// TERMS TILE
  ////////////////////////////////////////////////////////////

  Widget termTile(String title, String description) {

    return Padding(

      padding: const EdgeInsets.only(bottom: 18),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              height: 1.4,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 14),

          Divider(
            thickness: 1,
            color: Colors.grey.shade300,
          ),

        ],

      ),

    );

  }

}