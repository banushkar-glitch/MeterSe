class AppText {

  static String selectedLanguage = "ENGLISH";

  static Map<String, Map<String, String>> text = {

    "ENGLISH": {
      "login": "Login",
      "createAccount": "Create Account",
      "changePassword": "Change Password",
      "documents": "Documents",
      "forgotPassword": "Forgot Password",
    },

    "हिंदी": {
      "login": "लॉगिन",
      "createAccount": "खाता बनाएं",
      "changePassword": "पासवर्ड बदलें",
      "documents": "दस्तावेज़",
      "forgotPassword": "पासवर्ड भूल गए",
    },

    "मराठी": {
      "login": "लॉगिन",
      "createAccount": "खाते तयार करा",
      "changePassword": "पासवर्ड बदला",
      "documents": "कागदपत्रे",
      "forgotPassword": "पासवर्ड विसरलात",
    },
  };

  static String getText(String key) {

    return text[selectedLanguage]![key] ?? key;

  }
}