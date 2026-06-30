import 'package:flutter/material.dart';
import '../../../utils/app_text.dart';
import '../settings_screen.dart';

class LanguageSettingScreen extends StatefulWidget {
  const LanguageSettingScreen({super.key});

  @override
  State<LanguageSettingScreen> createState() =>
      _LanguageSettingScreenState();
}

class _LanguageSettingScreenState
    extends State<LanguageSettingScreen> {

  String selectedLanguage = AppText.selectedLanguage;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE4C766),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
              vertical: size.height * 0.02,
            ),

            child: Column(
              children: [

                /// 🔹 HEADER
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children:  [

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
                      Text(
                      "Language",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),

                    Icon(
                      Icons.notifications_none,
                      size: 34,
                    ),
                  ],
                ),

                SizedBox(
                  height: size.height * 0.03,
                ),

                /// 🔹 ICON
                CircleAvatar(
                  radius: size.width * 0.14,
                  backgroundColor: Colors.white,

                  child: Icon(
                    Icons.translate,
                    size: size.width * 0.12,
                    color: Colors.black,
                  ),
                ),

                SizedBox(
                  height: size.height * 0.03,
                ),

                /// 🔹 TITLE
                const Text(
                  "Select Your Preferred Language",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 22,
                    fontWeight:
                    FontWeight.w700,
                  ),
                ),

                SizedBox(
                  height: size.height * 0.01,
                ),

                const Text(
                  "Choose the language you want to use in the app.",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),

                SizedBox(
                  height: size.height * 0.05,
                ),

                /// 🔹 ENGLISH
                languageCard(

                  title: "English",
                  subtitle: "English",
                  value: "ENGLISH",
                ),

                SizedBox(
                  height: size.height * 0.03,
                ),

                /// 🔹 MARATHI
                languageCard(

                  title: "मराठी",
                  subtitle: "Marathi",
                  value: "मराठी",
                ),

                SizedBox(
                  height: size.height * 0.03,
                ),

                /// 🔹 HINDI
                languageCard(

                  title: "हिंदी",
                  subtitle: "Hindi",
                  value: "हिंदी",
                ),

                SizedBox(
                  height: size.height * 0.08,
                ),

                /// 🔹 SAVE BUTTON
                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    onPressed: () {
                      AppText.selectedLanguage = selectedLanguage;

                      print("SAVED LANGUAGE = ${AppText.selectedLanguage}");

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      );
                    },

                    style:
                    ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(
                        0xFF4A423F,
                      ),

                      padding:
                      EdgeInsets.symmetric(
                        vertical:
                        size.height * 0.02,
                      ),

                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                            18),
                      ),
                    ),

                    child: const Text(
                      "Save & Continue",

                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight:
                        FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 LANGUAGE CARD
  Widget languageCard({
    required String title,
    required String subtitle,
    required String value,
  }) {

    final size = MediaQuery.of(context).size;

    bool isSelected =
        selectedLanguage == value;

    return GestureDetector(
      onTap: () {

        setState(() {
          selectedLanguage = value;
        });
      },

      child: Container(
        width: double.infinity,

        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.025,
        ),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
          BorderRadius.circular(22),
        ),

        child: Row(
          children: [

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(
                    title,

                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight:
                      FontWeight.w600,
                    ),
                  ),

                  SizedBox(
                    height:
                    size.height * 0.004,
                  ),

                  Text(
                    subtitle,

                    style: TextStyle(
                      fontSize: 15,
                      color:
                      Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),

            /// CHECKBOX
            Icon(
              isSelected
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,

              color: isSelected
                  ? Colors.green
                  : Colors.grey.shade400,

              size: 32,
            ),
          ],
        ),
      ),
    );
  }
}