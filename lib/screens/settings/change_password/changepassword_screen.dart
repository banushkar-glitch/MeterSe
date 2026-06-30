import 'package:flutter/material.dart';
import '../settings_screen.dart';
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState
    extends State<ChangePasswordScreen> {

  final _formKey = GlobalKey<FormState>();

  final currentPasswordController =
  TextEditingController();

  final newPasswordController =
  TextEditingController();

  final confirmPasswordController =
  TextEditingController();

  bool currentHidden = true;
  bool newHidden = true;
  bool confirmHidden = true;

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },

      child: Scaffold(
        resizeToAvoidBottomInset: true,

        body: SafeArea(
          child: Column(
            children: [

              /// HEADER
              Container(
                height: 99,
                width: double.infinity,
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
                        size: 35,
                        color: Colors.black,
                      ),
                    ),

                    const Expanded(
                      child: Text(
                        "Change Password",
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
                        size: 35,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(width: 10),
                  ],
                ),
              ),

              /// BODY
              Expanded(
                child: Container(
                  color: const Color(0xFFEAEAEA),

                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,

                      child: Column(
                        children: [

                          const SizedBox(height: 20),

                          Image.asset(
                            "assets/change_password.png",
                            width: 112,
                            height: 112,
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            "Change Your Password",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          const SizedBox(height: 35),

                          /// CURRENT PASSWORD
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 38,
                            ),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [

                                const Text(
                                  "Current Password",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                TextFormField(
                                  controller:
                                  currentPasswordController,

                                  obscureText:
                                  currentHidden,

                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty) {
                                      return "Required";
                                    }
                                    return null;
                                  },

                                  decoration:
                                  InputDecoration(
                                    hintText:
                                    "Enter current password",

                                    border:
                                    OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          10),
                                    ),

                                    suffixIcon:
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          currentHidden =
                                          !currentHidden;
                                        });
                                      },
                                      icon: Icon(
                                        currentHidden
                                            ? Icons
                                            .visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 15),

                          /// NEW PASSWORD
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 38,
                            ),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [

                                const Text(
                                  "Enter New Password",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                TextFormField(
                                  controller:
                                  newPasswordController,

                                  obscureText: newHidden,

                                  validator: (value) {

                                    if (value == null ||
                                        value.isEmpty) {
                                      return "Required";
                                    }

                                    if (value.length < 8) {
                                      return "Minimum 8 characters";
                                    }

                                    return null;
                                  },

                                  decoration:
                                  InputDecoration(
                                    hintText:
                                    "Enter new password",

                                    border:
                                    OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          10),
                                    ),

                                    suffixIcon:
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          newHidden =
                                          !newHidden;
                                        });
                                      },
                                      icon: Icon(
                                        newHidden
                                            ? Icons
                                            .visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 15),

                          /// CONFIRM PASSWORD
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 38,
                            ),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [

                                const Text(
                                  "Re-Enter New Password",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                TextFormField(
                                  controller:
                                  confirmPasswordController,

                                  obscureText:
                                  confirmHidden,

                                  validator: (value) {

                                    if (value == null ||
                                        value.isEmpty) {
                                      return "Required";
                                    }

                                    if (value !=
                                        newPasswordController
                                            .text) {
                                      return "Passwords do not match";
                                    }

                                    return null;
                                  },

                                  decoration:
                                  InputDecoration(
                                    hintText:
                                    "Re-Enter new password",

                                    border:
                                    OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          10),
                                    ),

                                    suffixIcon:
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          confirmHidden =
                                          !confirmHidden;
                                        });
                                      },
                                      icon: Icon(
                                        confirmHidden
                                            ? Icons
                                            .visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 12),

                          /// PASSWORD RULES
                          Container(
                            width: 317,
                            height: 126,

                            padding:
                            const EdgeInsets.all(12),

                            decoration: BoxDecoration(
                              color:
                              const Color(0xFFFFFEE6),
                              borderRadius:
                              BorderRadius.circular(
                                  10),
                              border: Border.all(
                                color: Colors.black12,
                              ),
                            ),

                            child: const Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [

                                Text(
                                  "Password must contain:",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),

                                SizedBox(height: 8),

                                Text(
                                    "✔ At least 8 characters"),

                                Text(
                                    "✔ One uppercase letter"),

                                Text(
                                    "✔ One lowercase letter"),

                                Text(
                                    "✔ One number or special character"),
                              ],
                            ),
                          ),

                          const SizedBox(height: 25),

                          /// UPDATE BUTTON
                          InkWell(
                            onTap: () {

                              if (_formKey.currentState!
                                  .validate()) {

                                /// CHANGE PASSWORD API HERE

                                print(
                                    currentPasswordController
                                        .text);

                                print(
                                    newPasswordController
                                        .text);

                                ScaffoldMessenger.of(
                                    context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Password Updated",
                                    ),
                                  ),
                                );
                              }
                            },

                            child: Container(
                              width: 209,
                              height: 45,

                              decoration: BoxDecoration(
                                color: const Color(
                                    0xFFD9D9D9),
                                borderRadius:
                                BorderRadius.circular(
                                    25),
                              ),

                              child: const Center(
                                child: Text(
                                  "Update Password",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              /// FOOTER
              Container(
                height: 99,
                width: double.infinity,
                color: const Color(0xFF3C3A3A),
              ),
            ],
          ),
        ),
      ),
    );
  }
}