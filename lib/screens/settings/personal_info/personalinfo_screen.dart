import 'package:flutter/material.dart';
import '../settings_screen.dart';
class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final phone = TextEditingController();
  final dob = TextEditingController();
  final license = TextEditingController();
  final vehicle = TextEditingController();
  final address = TextEditingController();

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
                children: [
                  IconButton(
                  onPressed: () {

                      Navigator.pop(
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
        const Text(
                    "Personal Information",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(Icons.notifications_none),
                ],
              ),
            ),

            const SizedBox(height: 10),

            /// 🔹 CARD AREA
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Container(
                  padding: EdgeInsets.all(size.width * 0.04),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFEFEF),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      /// PROFILE
                      Column(
                        children: const [
                          Icon(Icons.person_outline, size: 60),
                          SizedBox(height: 6),
                          Text(
                            "Tap to change profile photo",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      /// FORM
                      Expanded(
                        child: Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                InputField(
                                  icon: Icons.badge_outlined,
                                  label: "Full Name",
                                  controller: name,
                                ),
                                InputField(
                                  icon: Icons.phone,
                                  label: "Phone Number",
                                  controller: phone,
                                ),
                                InputField(
                                  icon: Icons.calendar_month,
                                  label: "Date Of Birth",
                                  controller: dob,
                                ),
                                InputField(
                                  icon: Icons.credit_card,
                                  label: "Driving License Number",
                                  controller: license,
                                ),
                                InputField(
                                  icon: Icons.directions_car,
                                  label: "Vehicle Number",
                                  controller: vehicle,
                                ),
                                InputField(
                                  icon: Icons.location_on,
                                  label: "Address",
                                  controller: address,
                                  maxLines: 2,
                                ),

                                SizedBox(height: size.height * 0.02),
                              ],
                            ),
                          ),
                        ),
                      ),

                      /// 🔹 BUTTON
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // API call / save logic
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4A423F),
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.018),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            "Save Changes",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 REUSABLE INPUT FIELD (FIGMA STYLE)
class InputField extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextEditingController controller;
  final int maxLines;

  const InputField({
    super.key,
    required this.icon,
    required this.label,
    required this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.018),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.025),
            child: Icon(icon, size: 22),
          ),
          SizedBox(width: size.width * 0.03),

          /// TEXT FIELD COLUMN
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: controller,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.height * 0.014,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (val) =>
                  val == null || val.isEmpty ? "Required" : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}