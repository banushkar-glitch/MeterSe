import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {

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

                  const SizedBox(width: 10),

                  IconButton(

                    onPressed: () {

                      //////////////////////////////////////////
                      /// BACK BUTTON
                      //////////////////////////////////////////

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

                      "About us!",

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

                      //////////////////////////////////////////
                      /// NOTIFICATION API
                      //////////////////////////////////////////

                    },

                    icon: const Icon(
                      Icons.notifications_none,
                      size: 38,
                      color: Colors.black,
                    ),

                  ),

                  const SizedBox(width: 10),

                ],

              ),

            ),

            //////////////////////////////////////////////////////
            /// LOGO (FIXED)
            //////////////////////////////////////////////////////

            const SizedBox(height: 22),

            Center(

              child: Image.asset(

                "assets/logo.png",

                width: 163,
                height: 163,

                fit: BoxFit.contain,

              ),

            ),

            const SizedBox(height: 15),

            //////////////////////////////////////////////////////
            /// POWERED TEXT (FIXED)
            //////////////////////////////////////////////////////

            const Text(

              "Driven by Trust. Powered by Technology.",

              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),

            ),

            const SizedBox(height: 18),

            //////////////////////////////////////////////////////
            /// ONLY THIS SECTION SCROLLS
            //////////////////////////////////////////////////////

            Expanded(

                child: SingleChildScrollView(

                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                    ),

                    child: Column(

                        children: [

                      //////////////////////////////////////////////////////
                      /// WHO WE ARE
                      //////////////////////////////////////////////////////

                      policySection(

                      title: "Who We Are",

                      description:
                      "Metersay is a technology-driven platform connecting "
                          "riders with professional drivers for safe, reliable "
                          "and affordable journeys.",

                    ),

                  const Divider(
                    thickness: 1,
                    color: Colors.black26,
                  ),

                  //////////////////////////////////////////////////////
                  /// OUR MISSION
                  //////////////////////////////////////////////////////

                  policySection(

                    title: "Our Mission",

                    description:
                    "To make every ride convenient, comfortable and "
                        "accessible while creating opportunities for drivers "
                        "to earn and grow.",

                  ),

                  const Divider(
                    thickness: 1,
                    color: Colors.black26,
                  ),

                          //////////////////////////////////////////////////////
                          /// OUR VISION
                          //////////////////////////////////////////////////////

                          policySection(

                            title: "Our Vision",

                            description:
                            "To become the most trusted mobility platform that "
                                "drives positive change in the way people and cities "
                                "move.",

                          ),

                          const Divider(
                            thickness: 1,
                            color: Colors.black26,
                          ),

                          //////////////////////////////////////////////////////
                          /// OUR VALUES
                          //////////////////////////////////////////////////////

                          policySection(

                            title: "Our Values",

                            description:
                            "We prioritize the safety of our riders and drivers. "
                                "We believe in transparency and honest service. "
                                "Our customers are at the heart of everything we do.",

                          ),

                          const SizedBox(height: 20),

                        ],

                    ),

                ),

            ),

                //////////////////////////////////////////////////////
                /// FOOTER (FIXED)
                //////////////////////////////////////////////////////

                Container(

                  width: double.infinity,

                  height: 99,

                  color: const Color(0xFF3C3A3A),

                ),

              ],

            ),

        ),

    );

  }

//////////////////////////////////////////////////////
  /// COMMON SECTION WIDGET
//////////////////////////////////////////////////////

  Widget policySection({

    required String title,

    required String description,

  }) {

    return Padding(

      padding: const EdgeInsets.only(bottom: 10),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(

            title,

            style: const TextStyle(

              fontSize: 16,

              fontWeight: FontWeight.w600,

              color: Colors.black,

            ),

          ),

          const SizedBox(height: 8),

          Text(

            description,

            style: const TextStyle(

              fontSize: 14,

              fontWeight: FontWeight.w300,

              height: 1.35,

              color: Colors.black,

            ),

          ),

        ],

      ),

    );

  }

}