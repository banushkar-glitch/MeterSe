import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  //////////////////////////////////////////////////////
  /// BACKEND LIST (Replace with API later)
  //////////////////////////////////////////////////////

  List<NotificationModel> notifications = [

    NotificationModel(
      title: "Payment Received",
      message: "You have received ₹584 for trip to MG Road, Pune",
      time: "10:30 AM",
      isRead: false,
    ),

    NotificationModel(
      title: "New Ride Request",
      message: "New ride request from Swargate to Katraj, Pune",
      time: "09:15 AM",
      isRead: false,
    ),

    NotificationModel(
      title: "Document Expiring Soon",
      message: "Your Driving License will expire on 12 May 2025",
      time: "Yesterday",
      isRead: true,
    ),

    NotificationModel(
      title: "Special Offer",
      message: "Complete 20 rides this week and get extra ₹300 bonus",
      time: "2 May 2025",
      isRead: true,
    ),

    NotificationModel(
      title: "Account Verified",
      message: "Congratulations! Your account has been successfully verified.",
      time: "1 May 2025",
      isRead: true,
    ),

  ];

  //////////////////////////////////////////////////////
  /// MARK ALL READ
  //////////////////////////////////////////////////////

  void markAllRead() {

    setState(() {

      for (var item in notifications) {
        item.isRead = true;
      }

    });

    /// BACKEND API
    /// Call Mark All Read API here

  }

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

              child: Row(

                children: [

                  const SizedBox(width: 12),

                  IconButton(

                    onPressed: () {

                      Navigator.pop(context);

                      /// BACKEND (optional)

                    },

                    icon: const Icon(
                      Icons.arrow_back,
                      size: 38,
                      color: Colors.black,
                    ),

                  ),

                  const Expanded(

                    child: Text(

                      "Notifications",

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

                      /// Notification API

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

            //////////////////////////////////////////////////////
            /// BODY
            //////////////////////////////////////////////////////

            Expanded(

              child: Container(

                color: const Color(0xFFEAEAEA),

                child: Column(

                  children: [

                    Padding(

                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 20,
                        right: 20,
                      ),

                      child: Row(

                        mainAxisAlignment:
                        MainAxisAlignment.end,

                        children: [

                          GestureDetector(

                            onTap: markAllRead,

                            child: const Text(

                              "Mark all as read",

                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFF2D564),
                                fontWeight: FontWeight.w500,
                              ),

                            ),

                          ),

                        ],

                      ),

                    ),

                    const Divider(),

                    Expanded(

                      child: ListView.builder(

                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),

                        itemCount: notifications.length + 1,

                        itemBuilder: (context, index) {

                          if (index == notifications.length) {
                            return pushNotificationContainer();
                          }

                          return notificationTile(notifications[index]);

                        },

                      ),

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

            ),

          ],

        ),

      ),

    );

  }
  ////////////////////////////////////////////////////////
  /// NOTIFICATION TILE
////////////////////////////////////////////////////////

  Widget notificationTile(NotificationModel item) {

    return InkWell(

      onTap: () {

        setState(() {
          item.isRead = true;
        });

        /////////////////////////////////////////////////////
        /// BACKEND API
        /// Open Notification Details Screen
        /////////////////////////////////////////////////////

      },

      child: Padding(

        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),

        child: Column(

          children: [

            Row(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Expanded(

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Text(

                        item.title,

                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),

                      ),

                      const SizedBox(height: 6),

                      Text(

                        item.message,

                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                          height: 1.3,
                        ),

                      ),

                    ],

                  ),

                ),

                const SizedBox(width: 15),

                Column(

                  children: [

                    Text(

                      item.time,

                      style: const TextStyle(
                        fontSize: 12,
                      ),

                    ),

                    const SizedBox(height: 12),

                    item.isRead

                        ? const SizedBox(
                      width: 15,
                      height: 15,
                    )

                        : Container(

                      width: 15,
                      height: 15,

                      decoration: const BoxDecoration(

                        color: Color(0xFFF2D564),

                        shape: BoxShape.circle,

                      ),

                    ),

                  ],

                ),

              ],

            ),

            const SizedBox(height: 15),

            const Divider(),

          ],

        ),

      ),

    );

  }

  ////////////////////////////////////////////////////////
  /// PUSH NOTIFICATION CONTAINER
////////////////////////////////////////////////////////

  Widget pushNotificationContainer() {

    return Container(

      margin: const EdgeInsets.only(
        top: 8,
        bottom: 15,
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(10),

      ),

      child: Row(

        children: [

          //////////////////////////////////////////////////
          /// ICON
          //////////////////////////////////////////////////

          const Icon(
            Icons.notifications_none,
            size: 30,
            color: Colors.black,
          ),

          const SizedBox(width: 12),

          //////////////////////////////////////////////////
          /// TEXT
          //////////////////////////////////////////////////

          const Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(

                  "Enable Push Notifications",

                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),

                ),

                SizedBox(height: 2),

                Text(

                  "Get real-time updates and never\nmiss important alerts",

                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.black54,
                    height: 1.2,
                  ),

                ),

              ],

            ),

          ),

          //////////////////////////////////////////////////
          /// UPDATE BUTTON
          //////////////////////////////////////////////////

          SizedBox(

            width: 72,
            height: 28,

            child: ElevatedButton(

              onPressed: () {

                ////////////////////////////////////////////
                /// BACKEND API
                /// Enable Push Notification API
                ////////////////////////////////////////////

              },

              style: ElevatedButton.styleFrom(

                backgroundColor: const Color(0xFF4C4545),

                padding: EdgeInsets.zero,

                shape: RoundedRectangleBorder(

                  borderRadius:
                  BorderRadius.circular(5),

                ),

              ),

              child: const Text(

                "Update Now",

                style: TextStyle(
                  fontSize: 9,
                  color: Colors.white,
                ),

              ),

            ),

          ),

        ],

      ),

    );

  }

}
////////////////////////////////////////////////////////
/// NOTIFICATION MODEL
////////////////////////////////////////////////////////

class NotificationModel {

  final String title;
  final String message;
  final String time;

  bool isRead;

  NotificationModel({

    required this.title,
    required this.message,
    required this.time,
    required this.isRead,

  });

}