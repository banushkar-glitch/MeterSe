import 'package:flutter/material.dart';
import 'personal_info/personalinfo_screen.dart';
import 'change_password/changepassword_screen.dart';
import 'documents/document_screen.dart';
import 'language_select/languagesetting_screen.dart';
import 'notification/notificationsettings_screen.dart';
import 'privacy_policy/privacypolicysettings_screen.dart';
import 'terms_condition/termscondition_screen.dart';
import 'help_support/helpsupportsettings_screen.dart';
import 'about_us/aboutussettings_screen.dart';
import 'logout/logoutsettings_screen.dart';
import '../../utils/app_text.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  bool isSoundOn = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFE4C766),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.menu,
                      size: 28,
                    ),
                  ),
                  const Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(Icons.notifications_none, size: 28),
                ],
              ),

              const SizedBox(height: 20),

              /// ACCOUNT
              sectionTitle("Account"),
              settingsCard([
                settingItem(
                  icon: Icons.person_outline,
                  title: "Personal Information",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const PersonalInfoScreen(),

                      ),
                    );
                  },
                ),
                settingItem(
                  icon: Icons.lock_outline,
                  title: "Change Password",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const ChangePasswordScreen(),
                      ),
                    );
                  },
                ),
                settingItem(
                  icon: Icons.credit_card,
                  title: "Documents",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const DocumentsScreen(),
                      ),
                    );

                  },
                ),
              ]),

              const SizedBox(height: 20),

              /// PREFERENCES
              sectionTitle("Preferences"),
              settingsCard([
                settingItem(
                  icon: Icons.language,
                  title: "Language",
                  trailingText: AppText.selectedLanguage == "मराठी"
                      ? "मराठी"
                      : AppText.selectedLanguage == "हिंदी"
                      ? "हिंदी"
                      : "English",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const LanguageSettingScreen(),
                      ),
                    );
                  },
                ),
                settingItem(
                  icon: Icons.notifications_none,
                  title: "Notifications",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const NotificationScreen(),
                      ),
                    );
                  },
                ),
                settingItem(
                  icon: Icons.security_outlined, // permission-like icon
                  title: "Permission Management",
                  onTap: () {
                    // navigate or handle click
                  },
                ),
                switchItem(
                  icon: Icons.volume_up_outlined,
                  title: "Sound",
                  value: isSoundOn,
                  onChanged: (val) {
                    setState(() => isSoundOn = val);
                  },
                ),
              ]),

              const SizedBox(height: 20),

              /// APP
              sectionTitle("App"),
              settingsCard([
                settingItem(
                  icon: Icons.privacy_tip_outlined,
                  title: "Privacy Policy",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const PrivacyPolicyScreen(),
                      ),
                    );
                  },
                ),
                settingItem(
                  icon: Icons.description_outlined,
                  title: "Terms & Conditions",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const TermsConditionsScreen(),
                      ),
                    );
                  },
                ),
                settingItem(
                  icon: Icons.help_outline,
                  title: "Help & Support",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const HelpSupportScreen(),
                      ),
                    );
                  },
                ),
                settingItem(
                  icon: Icons.info_outline,
                  title: "About Us",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const AboutUsScreen(),
                      ),
                    );
                  },
                ),
              ]),

              const SizedBox(height: 20),

              /// MORE
              sectionTitle("More"),
              settingsCard([
                settingItem(
                  icon: Icons.logout,
                  title: "Logout",
                  iconColor: Colors.red,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const LogoutScreen(),
                      ),
                    );
                  },
                ),
              ]),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 SECTION TITLE
  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// 🔹 CARD CONTAINER
  Widget settingsCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }

  /// 🔹 NORMAL ITEM
  Widget settingItem({
    required IconData icon,
    required String title,
    String? trailingText,
    Color iconColor = Colors.black,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            if (trailingText != null)
              Text(
                trailingText,
                style: const TextStyle(color: Colors.grey),
              ),
            const SizedBox(width: 5),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }

  /// 🔹 SWITCH ITEM
  Widget switchItem({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}