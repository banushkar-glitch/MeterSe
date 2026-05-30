import 'package:flutter/material.dart';
import '../settings_screen.dart';
class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE4C766),
      body: SafeArea(
        child: Column(
          children: [
            /// 🔹 HEADER
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  IconButton(
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  SettingsScreen(),
                        ),
                      );

                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: size.width * 0.09,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Terms and Conditions",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.notifications_none, size: 28),
                ],
              ),
            ),

            const SizedBox(height: 15),

            /// 🔹 BODY
            Expanded(
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Last updated: 27 April 2026",
                      style: TextStyle(fontSize: 13),
                    ),

                    const SizedBox(height: 12),

                    /// 🔹 TERMS CARD (SCROLLABLE)
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Scrollbar(
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: const [
                                TermsItem(
                                  title: "1. Introduction",
                                  desc:
                                  "Welcome to Metersay Driver. These Terms & Conditions govern your use of our platform. By using the app, you agree to comply with and be bound by these terms",
                                ),
                                Divider(),
                                TermsItem(
                                  title: "2. Driver Responsibilities",
                                  desc:
                                  "Drivers must follow all traffic rules and regulations. You are responsible for providing accurate information and maintaining professional behavior at all times.",
                                ),
                                Divider(),
                                TermsItem(
                                  title: "3. Ratings & Feedback",
                                  desc:
                                  "Driver performance may be monitored through user feedback.",
                                ),
                                Divider(),
                                TermsItem(
                                  title: "4. Cancellation Policy",
                                  desc:
                                  "Unnecessary cancellation of rides is not allowed. Repeated cancellations may affect your account status and earnings.",
                                ),
                                Divider(),
                                TermsItem(
                                  title: "5. Account Suspension",
                                  desc:
                                  "Violation of any of these terms may result in temporary or permanent suspension of your account without prior notice.",
                                ),
                                Divider(),
                                TermsItem(
                                  title: "6. Fare Policy",
                                  desc:
                                  "All rides must follow meter-based pricing only. Overcharging is strictly prohibited.",
                                ),
                                Divider(),
                                TermsItem(
                                  title: "7. Privacy Policy",
                                  desc:
                                  "We respect your privacy and are committed to protecting your personal data in accordance with our Privacy Policy.",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// 🔹 CHECKBOX
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (val) {
                            setState(() => isChecked = val!);
                          },
                        ),
                        const Expanded(
                          child: Text(
                            "I agree to the Terms & Conditions",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// 🔹 BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isChecked ? () {} : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A423F),
                          disabledBackgroundColor:
                          Colors.grey.shade400,
                          padding: const EdgeInsets.symmetric(
                              vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Accept & Continue",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 REUSABLE TERMS ITEM
class TermsItem extends StatelessWidget {
  final String title;
  final String desc;

  const TermsItem({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            desc,
            style: const TextStyle(
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}