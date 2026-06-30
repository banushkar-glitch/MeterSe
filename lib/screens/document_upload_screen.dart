import 'package:flutter/material.dart';
import 'driver_details_screen.dart';
import '../utils/app_text.dart';
class DocumentUploadScreen extends StatelessWidget {
  const DocumentUploadScreen({super.key});

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
              height: 99,
              width: double.infinity,
              color: const Color(0xFFFFD329),

              alignment: Alignment.center,

              child: Text(AppText.getText("Upload Documents"),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),

            //////////////////////////////////////////////////////
            /// BODY
            //////////////////////////////////////////////////////
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.white,

            child: Column(

              children: [

                const SizedBox(height: 55),

                 Text(AppText.getText("Please upload the original documents to start driving."),

                  textAlign: TextAlign.center,

                  style: TextStyle(

                    fontSize: 25,

                    fontWeight: FontWeight.w300,

                    height: 1.5,

                  ),

                ),

                const SizedBox(height: 40),

                uploadButton(

                  title:  AppText.getText("Driving License"),

                  onTap: () {

                    //////////////////////////////////////
                    /// BACKEND API
                    /// Upload Driving License
                    //////////////////////////////////////

                  },

                ),

                const SizedBox(height: 50),

                uploadButton(

                  title:  AppText.getText("Vehicle RC"),

                  onTap: () {

                    //////////////////////////////////////
                    /// BACKEND API
                    /// Upload Vehicle RC
                    //////////////////////////////////////

                  },

                ),

                const SizedBox(height: 50),

                uploadButton(

                  title:  AppText.getText("Aadhaar Card"),

                  onTap: () {

                    //////////////////////////////////////
                    /// BACKEND API
                    /// Upload Aadhaar Card
                    //////////////////////////////////////

                  },

                ),

                const SizedBox(height: 50),

                uploadButton(

                  title: AppText.getText("Profile Photo (Selfie)"),

                  onTap: () {

                    //////////////////////////////////////
                    /// BACKEND API
                    /// Upload Selfie
                    //////////////////////////////////////

                  },

                ),

              ],

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

              alignment: Alignment.center,

              child: SizedBox(
                width: 290,
                height: 50,

                child: ElevatedButton(
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder : (context) => DriverDetailsScreen(),
                      ),
                    );
                    /////////////////////////////////////////////////
                    /// BACKEND API
                    ///
                    /// Submit Uploaded Documents
                    ///
                    /////////////////////////////////////////////////

                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD9D9D9),
                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  child: Text(AppText.getText("Submit"),

                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////
  /// UPLOAD BUTTON
  //////////////////////////////////////////////////////

  Widget uploadButton({

    required String title,

    required VoidCallback onTap,

  }) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        width: 230,

        height: 50,

        alignment: Alignment.center,

        decoration: BoxDecoration(

          color: const Color(0xFFD9D9D9),

          borderRadius: BorderRadius.circular(24.5),

          boxShadow: const [

            BoxShadow(

              color: Colors.black26,

              blurRadius: 4,

              offset: Offset(0, 4),

            ),

          ],

        ),

        child: Text(

          title,

          style: const TextStyle(

            fontSize: 20,

            color: Colors.black,

          ),

        ),

      ),

    );

  }

}