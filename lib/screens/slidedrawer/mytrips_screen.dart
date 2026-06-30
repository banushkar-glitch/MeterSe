import 'package:flutter/material.dart';

class RideHistoryModel {
  final String pickup;
  final String drop;
  final String date;
  final String time;
  final String status;

  const RideHistoryModel({
    required this.pickup,
    required this.drop,
    required this.date,
    required this.time,
    required this.status,
  });
}

class RidesCompletedScreen extends StatefulWidget {
  const RidesCompletedScreen({super.key});

  @override
  State<RidesCompletedScreen> createState() =>
      _RidesCompletedScreenState();
}

class _RidesCompletedScreenState
    extends State<RidesCompletedScreen> {

  //////////////////////////////
  /// FILTER
  //////////////////////////////

  String selectedFilter = "Today";

  //////////////////////////////
  /// BACKEND DATA
  //////////////////////////////

  List<RideHistoryModel> rideList = [

    RideHistoryModel(
      pickup: "Kothrud",
      drop: "Wakad",
      date: "27 April",
      time: "10:15 AM",
      status: "Completed",
    ),

    RideHistoryModel(
      pickup: "Shivaji Nagar",
      drop: "Kothrud",
      date: "27 April",
      time: "09:20 AM",
      status: "Completed",
    ),

    RideHistoryModel(
      pickup: "Aundh",
      drop: "Wakad",
      date: "27 April",
      time: "08:30 AM",
      status: "Completed",
    ),

    RideHistoryModel(
      pickup: "FC Road",
      drop: "Wakad",
      date: "27 April",
      time: "07:15 AM",
      status: "Completed",
    ),

    RideHistoryModel(
      pickup: "Pune Station",
      drop: "Kharadi",
      date: "27 April",
      time: "06:40 AM",
      status: "Completed",
    ),

  ];

  //////////////////////////////////////////
  /// FOOTER DATA (API LATER)
  //////////////////////////////////////////

  int totalTrips = 12;

  String totalDistance = "56 Km";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,

      body: SafeArea(

        child: Column(

          children: [

            //////////////////////////////////////
            /// HEADER
            //////////////////////////////////////

            Container(

              width: double.infinity,
              height: 99,

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
                      size: 38,
                      color: Colors.black,
                    ),

                  ),

                  const Expanded(

                    child: Text(

                      "Rides Completed",

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

                  const SizedBox(width: 10),

                ],

              ),

            ),

            //////////////////////////////////////
            /// BODY
            //////////////////////////////////////

            Expanded(

              child: Container(

                color: const Color(0xFFEAEAEA),

                child: Column(

                  children: [

                    const SizedBox(height: 10),

                    //////////////////////////////////////
                    /// TODAY WEEKLY MONTHLY
                    //////////////////////////////////////

                    Container(

                      margin: const EdgeInsets.symmetric(
                        horizontal: 23,
                      ),

                      height: 46,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: Row(

                        children: [

                          filterButton("Today"),

                          filterButton("Weekly"),

                          filterButton("Monthly"),

                        ],

                      ),

                    ),

                    const SizedBox(height: 15),

                    //////////////////////////////////////
                    /// RIDE LIST
                    //////////////////////////////////////

                    Expanded(

                      child: ListView.builder(

                        padding: const EdgeInsets.symmetric(
                          horizontal: 23,
                        ),

                        itemCount: rideList.length,

                        itemBuilder: (context, index) {
                          return rideCard(rideList[index]);
                        },

                      ),

                    ),

                  ],

                ),

              ),

            ),

            //////////////////////////////////////
            /// FOOTER
            //////////////////////////////////////

            Container(

              width: double.infinity,
              height: 99,
              color: const Color(0xFF3C3A3A),

              child: Row(

                children: [

                  Expanded(

                    child: Row(

                      mainAxisAlignment:
                      MainAxisAlignment.center,

                      children: [

                        Image.asset(
                          "assets/autodocument.png",
                          width: 38,
                          height: 38,
                        ),

                        const SizedBox(width: 8),

                        Column(

                          mainAxisAlignment:
                          MainAxisAlignment.center,

                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            const Text(

                              "Total Trips",

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),

                            ),

                            Text(

                              "$totalTrips",

                              style: const TextStyle(

                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,

                              ),

                            ),

                          ],

                        ),

                      ],

                    ),

                  ),

                  Container(
                    width: 1,
                    height: 50,
                    color: Colors.white,
                  ),

                  Expanded(

                    child: Row(

                      mainAxisAlignment:
                      MainAxisAlignment.center,

                      children: [

                        const Icon(
                          Icons.route,
                          color: Colors.white,
                          size: 36,
                        ),

                        const SizedBox(width: 8),

                        Column(

                          mainAxisAlignment:
                          MainAxisAlignment.center,

                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            const Text(

                              "Total Distance",

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),

                            ),

                            Text(

                              totalDistance,

                              style: const TextStyle(

                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,

                              ),

                            ),

                          ],

                        ),

                      ],

                    ),

                  ),

                ],

              ),

            ),

          ],

        ),

      ),

    );
  }
  ////////////////////////////////////////////////////////
  /// FILTER BUTTON
////////////////////////////////////////////////////////

  Widget filterButton(String title) {

    bool isSelected = selectedFilter == title;

    return Expanded(

      child: GestureDetector(

        onTap: () {

          setState(() {

            selectedFilter = title;

            //////////////////////////////////////
            /// BACKEND API
            //////////////////////////////////////

            if (title == "Today") {

              /// getTodayRides();

            } else if (title == "Weekly") {

              /// getWeeklyRides();

            } else {

              /// getMonthlyRides();

            }

          });

        },

        child: Container(

          margin: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 7,
          ),

          decoration: BoxDecoration(

            color: isSelected
                ? const Color(0xFFD0D0D0)
                : Colors.white,

            borderRadius: BorderRadius.circular(30),

          ),

          child: Center(

            child: Text(

              title,

              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),

            ),

          ),

        ),

      ),

    );

  }

////////////////////////////////////////////////////////
  /// RIDE CARD
////////////////////////////////////////////////////////

  Widget rideCard(RideHistoryModel ride) {

    return InkWell(

      onTap: () {

        //////////////////////////////////////
        /// OPEN RIDE DETAILS
        //////////////////////////////////////

      },

      child: Container(

        margin: const EdgeInsets.only(bottom: 10),

        padding: const EdgeInsets.all(15),

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius: BorderRadius.circular(10),

        ),

        child: Row(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Expanded(

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Row(

                    children: [

                      const Icon(
                        Icons.location_on,
                        color: Colors.green,
                        size: 18,
                      ),

                      const SizedBox(width: 6),

                      Text(

                        ride.pickup,

                        style: const TextStyle(
                          fontSize: 16,
                        ),

                      ),

                    ],

                  ),

                  const SizedBox(height: 8),

                  Row(

                    children: [

                      const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 18,
                      ),

                      const SizedBox(width: 6),

                      Text(

                        ride.drop,

                        style: const TextStyle(
                          fontSize: 16,
                        ),

                      ),

                    ],

                  ),

                  const SizedBox(height: 10),

                  Text(

                    "${ride.date}      |      ${ride.time}",

                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),

                  ),

                ],

              ),

            ),

            const SizedBox(width: 10),

            Column(

              children: [

                const Icon(

                  Icons.check_circle,

                  color: Colors.green,

                  size: 28,

                ),

                const SizedBox(height: 3),

                Text(

                  ride.status,

                  style: const TextStyle(

                    color: Color(0xFF09AC32),

                    fontSize: 12,

                  ),

                ),

              ],

            ),

          ],

        ),

      ),

    );

  }

////////////////////////////////////////////////////////
  /// BACKEND PLACEHOLDERS
////////////////////////////////////////////////////////

  Future<void> getTodayRides() async {

    /// TODAY API

  }

  Future<void> getWeeklyRides() async {

    /// WEEKLY API

  }

  Future<void> getMonthlyRides() async {

    /// MONTHLY API

  }

}
