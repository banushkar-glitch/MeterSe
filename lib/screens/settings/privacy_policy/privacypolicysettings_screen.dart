import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {

  ////////////////////////////////////////////////////////
  /// BACKEND DATA
////////////////////////////////////////////////////////

  final List<Map<String, String>> privacySections = [

    {
      "title": "Information we collect",
      "description":
      "We collect personal information that you provide to us, such as your name, phone number, email address, and location when you use our services."
    },

    {
      "title": "How we use your information",
      "description":
      "We use your information to provide, maintain and improve our services, process transactions, communicate with you and ensure safety and security."
    },

    {
      "title": "Information Sharing",
      "description":
      "We do not sell your personal data. We may share your information with trusted service providers only to deliver our services and comply with legal obligations."
    },

    {
      "title": "Data Security",
      "description":
      "We implement industry-standard security measures to protect your data from unauthorized access, misuse or disclosure."
    },

    {
      "title": "Your Choices",
      "description":
      "You can update your information, manage your preferences and delete your account at any time through the app settings."
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

                  const SizedBox(width: 12),

                  IconButton(

                    onPressed: () {

                      /// BACK BUTTON
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

                      "Privacy Policy",

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

                      /// NOTIFICATION API

                    },

                    icon: const Icon(
                      Icons.notifications_none,
                      size: 38,
                      color: Colors.black,
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

                child: SingleChildScrollView(

                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 20,
                  ),

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      const Text(

                        "Last Updated : 05 May 2026",

                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),

                      ),

                      const SizedBox(height: 15),

                      const Divider(),

                      /// PART 2 CONTINUES HERE
                      ///
                      policySection(
                        title: "Information we collect",
                        description:
                        "We collect personal information that you provide to us, such as your name, phone number, email address, and location when you use our services.",
                      ),

                      const Divider(),

                      policySection(
                        title: "How we use your information",
                        description:
                        "We use your information to provide, maintain and improve our services, process transactions, communicate with you and ensure safety and security.",
                      ),

                      const Divider(),

                      policySection(
                        title: "Information Sharing",
                        description:
                        "We do not sell your personal data. We may share your information with trusted service providers only to deliver our services and comply with legal obligations.",
                      ),

                      const Divider(),

                      policySection(
                        title: "Data Security",
                        description:
                        "We implement industry-standard security measures to protect your data from unauthorized access, misuse or disclosure.",
                      ),

                      const Divider(),

                      policySection(
                        title: "Your Choices",
                        description:
                        "You can update your information, manage your preferences and delete your account at any time through the app settings.",
                      ),

                      const Divider(),

                      const SizedBox(height: 18),

                      contactContainer(),

                      const SizedBox(height: 15),

                    ],

                  ),

                ),

              ),

            ),

            //////////////////////////////////////////////////////
            /// FOOTER
            //////////////////////////////////////////////////////

            Container(

              height: 99,
              width: double.infinity,
              color: const Color(0xFF3C3A3A),

            ),

          ],

        ),

      ),

    );

  }
  ////////////////////////////////////////////////////////
  /// POLICY SECTION
////////////////////////////////////////////////////////

  Widget policySection({

    required String title,
    required String description,

  }) {

    return Padding(

      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(

            title,

            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),

          ),

          const SizedBox(height: 10),

          Text(

            description,

            style: const TextStyle(
              fontSize: 12,
              height: 1.4,
              color: Colors.black87,
            ),

          ),

        ],

      ),

    );

  }


  ////////////////////////////////////////////////////////
  /// CONTACT CONTAINER
////////////////////////////////////////////////////////

  Widget contactContainer() {

    return Container(

      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(10),

      ),

      child: Row(

        children: [

          //////////////////////////////////////////////////////
          /// SUPPORT ICON
          //////////////////////////////////////////////////////

          const Icon(
            Icons.support_agent,
            size: 34,
            color: Colors.black,
          ),

          const SizedBox(width: 10),

          //////////////////////////////////////////////////////
          /// TEXT
          //////////////////////////////////////////////////////

          const Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(

                  "Questions or Concerns?",

                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),

                ),

                SizedBox(height: 2),

                Text(

                  "Contact our support team at\nsupport@metersay.com",

                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.black54,
                    height: 1.2,
                  ),

                ),

              ],

            ),

          ),

          //////////////////////////////////////////////////////
          /// CONTACT BUTTON
          //////////////////////////////////////////////////////

          SizedBox(

            width: 70,
            height: 28,

            child: ElevatedButton(

              onPressed: () {

                ////////////////////////////////////////////////////
                /// BACKEND API
                /// Open Contact Us Screen
                /// OR Launch Email
                ////////////////////////////////////////////////////

              },

              style: ElevatedButton.styleFrom(

                backgroundColor: const Color(0xFF4C4545),

                padding: EdgeInsets.zero,

                shape: RoundedRectangleBorder(

                  borderRadius:
                  BorderRadius.circular(5),

                ),

              ),

              child: const Text(

                "Contact Us",

                style: TextStyle(
                  fontSize: 9,
                  color: Colors.white,
                ),

              ),

            ),

          ),

        ],

      ),

    );

  }
}