import 'package:flutter/material.dart';
import '../settings_screen.dart';
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final currentPass = TextEditingController();
  final newPass = TextEditingController();
  final confirmPass = TextEditingController();

  bool showCurrent = false;
  bool showNew = false;
  bool showConfirm = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE4C766),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior:
          ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
          children: [
            /// 🔹 HEADER
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

                children: [

                  IconButton(
                    onPressed: () {

                      Navigator.pop(
                        context);

                    },

                    icon: Icon(
                      Icons.arrow_back,
                      size: size.width * 0.09,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Change Password",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.notifications_none),
                ],
              ),
            ),

            const SizedBox(height: 10),

            /// 🔹 CARD

               Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05),
                child: Container(
                  padding:
                  EdgeInsets.all(size.width * 0.05),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFEFEF),
                    borderRadius:
                    BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      /// 🔹 TOP ICON + TEXT
                      Column(
                        children: const [
                          Icon(Icons.lock_reset, size: 60),
                          SizedBox(height: 10),
                          Text(
                            "Change Your Password",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight:
                                FontWeight.w600),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Enter your current password and choose a new password",
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(fontSize: 13),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      /// 🔹 FORM

                         Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                PasswordField(
                                  label: "Current Password",
                                  controller: currentPass,
                                  isVisible: showCurrent,
                                  toggle: () {
                                    setState(() =>
                                    showCurrent =
                                    !showCurrent);
                                  },
                                ),
                                PasswordField(
                                  label: "New Password",
                                  controller: newPass,
                                  isVisible: showNew,
                                  toggle: () {
                                    setState(() =>
                                    showNew = !showNew);
                                  },
                                ),
                                PasswordField(
                                  label: "Confirm Password",
                                  controller: confirmPass,
                                  isVisible: showConfirm,
                                  toggle: () {
                                    setState(() =>
                                    showConfirm =
                                    !showConfirm);
                                  },
                                ),

                                const SizedBox(height: 15),

                                /// 🔹 PASSWORD RULES BOX
                                Container(
                                  padding:
                                  const EdgeInsets.all(
                                      12),
                                  decoration: BoxDecoration(
                                    color: const Color(
                                        0xFFEAE6C8),
                                    borderRadius:
                                    BorderRadius
                                        .circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: const [
                                      Text(
                                        "Password must contain:",
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight
                                                .w600),
                                      ),
                                      SizedBox(height: 6),
                                      RuleItem(
                                          text:
                                          "At least 8 characters"),
                                      RuleItem(
                                          text:
                                          "One uppercase letter"),
                                      RuleItem(
                                          text:
                                          "One lowercase letter"),
                                      RuleItem(
                                          text:
                                          "One number or special character"),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                    height:
                                    size.height * 0.02),
                              ],
                            ),
                          ),
                        ),


                      /// 🔹 BUTTON
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!
                                .validate()) {
                              if (newPass.text !=
                                  confirmPass.text) {
                                ScaffoldMessenger.of(
                                    context)
                                    .showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Passwords do not match")),
                                );
                                return;
                              }

                              // API CALL HERE
                            }
                          },
                          style: ElevatedButton
                              .styleFrom(
                            backgroundColor:
                            const Color(
                                0xFF4A423F),
                            padding:
                            EdgeInsets.symmetric(
                              vertical:
                              size.height * 0.018,
                            ),
                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius
                                  .circular(14),
                            ),
                          ),
                          child: const Text(
                            "Update Password",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white),
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
    );
  }
}

/// 🔹 PASSWORD FIELD (REUSABLE + EYE TOGGLE)
class PasswordField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isVisible;
  final VoidCallback toggle;

  const PasswordField({
    super.key,
    required this.label,
    required this.controller,
    required this.isVisible,
    required this.toggle,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding:
      EdgeInsets.only(bottom: size.height * 0.018),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            obscureText: !isVisible,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  isVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: toggle,
              ),
              hintText: "Enter password",
              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(12),
              ),
              contentPadding:
              EdgeInsets.symmetric(
                horizontal:
                size.width * 0.03,
              ),
            ),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "Required";
              }
              if (val.length < 8) {
                return "Min 8 characters";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

/// 🔹 RULE ITEM
class RuleItem extends StatelessWidget {
  final String text;

  const RuleItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          const Icon(Icons.check_circle,
              size: 18),
          const SizedBox(width: 6),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}