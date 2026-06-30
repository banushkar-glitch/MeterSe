import 'package:flutter/material.dart';
import '../settings_screen.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {

  final List<DocumentItem> documents = [

    DocumentItem(
      title: "Driving Licence",
      subtitle: "Upload front side of your driving license",
      icon: "assets/document.png",
      verified: true,
    ),

    DocumentItem(
      title: "Vehicle Registration",
      subtitle: "Upload front side of your RC",
      icon: "assets/autodocument.png",
      verified: true,
    ),

    DocumentItem(
      title: "Vehicle Photo",
      subtitle: "Upload front side of your Riksha",
      icon: "assets/autodocument.png",
      verified: true,
    ),

    DocumentItem(
      title: "Aadhaar Card",
      subtitle: "Upload front side of your Aadhaar",
      icon: "assets/document.png",
      verified: true,
    ),

    DocumentItem(
      title: "Aadhaar Card",
      subtitle: "Upload back side of your Aadhaar",
      icon: "assets/document.png",
      verified: true,
    ),

    DocumentItem(
      title: "Pan Card",
      subtitle: "Upload front side of your PAN",
      icon: "assets/document.png",
      verified: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,

      body: SafeArea(

        child: Column(

          children: [

            /////////////////////////////
            /// HEADER
            /////////////////////////////

            Container(

              width: double.infinity,
              height: 99,
              color: const Color(0xFFFFD329),

              child: Row(

                children: [

                  const SizedBox(width: 12),

                  IconButton(

                    onPressed: () {
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

                      "Documents",

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

                      /// NOTIFICATION API

                    },

                    icon: const Icon(
                      Icons.notifications_none,
                      size: 38,
                      color: Colors.black,
                    ),

                  ),

                  const SizedBox(width: 12),

                ],

              ),

            ),

            /////////////////////////////
            /// BODY
            /////////////////////////////

            Expanded(

              child: Container(

                color: const Color(0xFFEAEAEA),

                child: ListView.builder(

                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),

                  itemCount: documents.length + 1,

                  itemBuilder: (context, index) {
                    if (index == documents.length) {
                      return updateContainer();
                    }

                    return documentTile(documents[index]);
                  },

                ),

              ),

            ),

            /////////////////////////////
            /// FOOTER
            /////////////////////////////

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
  ////////////////////////////////////////////////////////
  /// DOCUMENT TILE
////////////////////////////////////////////////////////

  Widget documentTile(DocumentItem item) {

    return InkWell(

      onTap: () {

        /// OPEN DOCUMENT SCREEN
        /// BACKEND API HERE

      },

      child: Padding(

        padding: const EdgeInsets.only(bottom: 8),

        child: Column(

          children: [

            Row(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Image.asset(
                  item.icon,
                  width: 34,
                  height: 34,
                  fit: BoxFit.contain,
                ),

                const SizedBox(width: 12),

                Expanded(

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text(

                        item.title,

                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),

                      ),

                      const SizedBox(height: 2),

                      Text(

                        item.subtitle,

                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),

                      ),

                      const SizedBox(height: 5),

                      Row(

                        children: [

                          Icon(

                            Icons.check,

                            size: 18,

                            color: item.verified
                                ? Colors.green
                                : Colors.red,

                          ),

                          const SizedBox(width: 4),

                          Text(

                            item.verified
                                ? "Verified"
                                : "Pending",

                            style: TextStyle(

                              fontSize: 14,

                              color: item.verified
                                  ? Colors.green
                                  : Colors.red,

                            ),

                          ),

                        ],

                      ),

                    ],

                  ),

                ),

                IconButton(

                  onPressed: () {

                    /// NEXT PAGE API

                  },

                  icon: const Icon(
                    Icons.chevron_right,
                    size: 30,
                  ),

                ),

              ],

            ),

            const SizedBox(height: 8),

            const Divider(
              thickness: 1,
            ),

          ],

        ),

      ),

    );

  }

////////////////////////////////////////////////////////
  /// UPDATE CONTAINER
////////////////////////////////////////////////////////

  Widget updateContainer() {

    return Container(

      margin: const EdgeInsets.only(top: 12),

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(10),

      ),

      child: Row(

        children: [

          const Icon(
            Icons.error_outline,
            size: 32,
          ),

          const SizedBox(width: 12),

          const Expanded(

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(

                  "Keep your documents updated",

                  style: TextStyle(

                    fontWeight: FontWeight.bold,
                    fontSize: 12,

                  ),

                ),

                SizedBox(height: 2),

                Text(

                  "Expired documents may affect your ride requests",

                  style: TextStyle(
                    fontSize: 10,
                  ),

                ),

              ],

            ),

          ),

          ElevatedButton(

            onPressed: () {

              /// UPDATE DOCUMENT API

            },

            style: ElevatedButton.styleFrom(

              backgroundColor: const Color(0xFF4C4545),

              minimumSize: const Size(80, 30),

              shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(5),

              ),

            ),

            child: const Text(

              "Update Now",

              style: TextStyle(

                fontSize: 10,
                color: Colors.white,

              ),

            ),

          ),

        ],

      ),

    );

  }

}

////////////////////////////////////////////////////////
/// DOCUMENT MODEL
////////////////////////////////////////////////////////

class DocumentItem {
  final String title;
  final String subtitle;
  final String icon;
  final bool verified;

  const DocumentItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.verified,
  });
}