import 'package:flutter/material.dart';
import '../settings_screen.dart';
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: const Color(0xFFE4C766),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04,
                vertical: size.height * 0.015,
              ),

              child: Column(
                children: [
                  /// ================= HEADER =================
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsScreen(),
                            ),
                          );

                        },

                        child: Icon(
                          Icons.arrow_back,
                          size: size.width * 0.07,
                          color: Colors.black,
                        ),
                      ),

                      Expanded(
                        child: Center(
                          child: Text(
                            "Privacy Policy",

                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      Icon(
                        Icons.notifications_none,
                        size: size.width * 0.07,
                        color: Colors.black,
                      ),
                    ],
                  ),

                  SizedBox(height: size.height * 0.022),

                  /// ================= TOP DESCRIPTION =================
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.015,
                    ),

                    child: Text(
                      "Your privacy is important to us. "
                          "This policy explains how we collect, "
                          "use and protect your personal information",

                      style: TextStyle(
                        fontSize: size.width * 0.036,
                        height: 1.45,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.03),

                  /// ================= MAIN CARD =================
                  Container(
                    width: double.infinity,

                    padding: EdgeInsets.all(
                      size.width * 0.05,
                    ),

                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F4F4),

                      borderRadius: BorderRadius.circular(24),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        /// LAST UPDATED
                        Text(
                          "Last Updated :05 May 2026",

                          style: TextStyle(
                            fontSize: size.width * 0.042,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),

                        SizedBox(height: size.height * 0.022),

                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),

                        SizedBox(height: size.height * 0.022),

                        /// ================= POLICY SECTIONS =================
                        _policySection(
                          title: "Information We Collect",

                          content:
                          "We collect personal information that you provide to us, such as your name, phone number, email address, and location when you use our services.",

                          size: size,
                        ),

                        Divider(
                          color: Colors.grey.shade300,
                        ),

                        SizedBox(height: size.height * 0.02),

                        _policySection(
                          title: "How We Use Your Information",

                          content:
                          "We use your information to provide, maintain and improve our services, process transactions, communicate with you, and ensure safety and security.",

                          size: size,
                        ),

                        Divider(
                          color: Colors.grey.shade300,
                        ),

                        SizedBox(height: size.height * 0.02),

                        _policySection(
                          title: "Information Sharing",

                          content:
                          "We do not sell your personal data. We may share your information with trusted service providers only to deliver our services and comply with legal obligations.",

                          size: size,
                        ),

                        Divider(
                          color: Colors.grey.shade300,
                        ),

                        SizedBox(height: size.height * 0.02),

                        _policySection(
                          title: "Data Security",

                          content:
                          "We implement industry-standard security measures to protect your data from unauthorized access, misuse, or disclosure.",

                          size: size,
                        ),

                        Divider(
                          color: Colors.grey.shade300,
                        ),

                        SizedBox(height: size.height * 0.02),

                        _policySection(
                          title: "Your Choices",

                          content:
                          "You can update your information, manage your preferences, or delete your account at any time through the app settings.",

                          size: size,
                        ),

                        SizedBox(height: size.height * 0.03),

                        Divider(
                          color: Colors.grey.shade300,
                        ),

                        SizedBox(height: size.height * 0.03),

                        /// ================= CONTACT CARD =================
                        Container(
                          width: double.infinity,

                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.04,
                            vertical: size.height * 0.02,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius:
                            BorderRadius.circular(18),

                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                          ),

                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,

                                children: [
                                  /// ICON
                                  CircleAvatar(
                                    radius: size.width * 0.06,

                                    backgroundColor:
                                    Colors.grey.shade100,

                                    child: Icon(
                                      Icons.support_agent,

                                      size: size.width * 0.07,

                                      color: Colors.black,
                                    ),
                                  ),

                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),

                                  /// TEXT
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,

                                      children: [
                                        Text(
                                          "Questions or Concerns?",

                                          style: TextStyle(
                                            fontSize:
                                            size.width * 0.041,

                                            fontWeight:
                                            FontWeight.w700,

                                            color: Colors.black,
                                          ),
                                        ),

                                        SizedBox(
                                          height:
                                          size.height * 0.004,
                                        ),

                                        Text(
                                          "Contact our support team at\nsupport@metersay.com",

                                          style: TextStyle(
                                            fontSize:
                                            size.width * 0.032,

                                            height: 1.4,

                                            color:
                                            Colors.grey.shade700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),

                                  /// BUTTON
                                  Flexible(
                                    child: ElevatedButton(
                                      onPressed: () {},

                                      style:
                                      ElevatedButton.styleFrom(
                                        elevation: 0,

                                        backgroundColor:
                                        const Color(
                                            0xFF4A423F),

                                        padding:
                                        EdgeInsets.symmetric(
                                          horizontal:
                                          size.width * 0.035,

                                          vertical:
                                          size.height * 0.013,
                                        ),

                                        shape:
                                        RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              12),
                                        ),
                                      ),

                                      child: FittedBox(
                                        child: Text(
                                          "Contact Us",

                                          style: TextStyle(
                                            fontSize:
                                            size.width * 0.032,

                                            fontWeight:
                                            FontWeight.w600,

                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: size.height * 0.03),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// ================= REUSABLE POLICY SECTION =================
  Widget _policySection({
    required String title,
    required String content,
    required Size size,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: size.height * 0.022,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            title,

            style: TextStyle(
              fontSize: size.width * 0.046,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),

          SizedBox(height: size.height * 0.012),

          Text(
            content,

            style: TextStyle(
              fontSize: size.width * 0.037,
              height: 1.45,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}