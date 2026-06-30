import 'package:flutter/material.dart';
import '../rides/map_screen.dart';
import 'rejectbox.dart';
void showRejectRideBottomSheet(BuildContext context) {
  String? selectedReason;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,

    builder: (context) {
      return StatefulBuilder(
        builder: (context, setBottomState) {
          final width = MediaQuery.of(context).size.width;
          final height = MediaQuery.of(context).size.height;

          return Container(
            height: height * 0.70,

            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),

            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.02,
              ),

              child: Column(
                children: [

                  /// TOP HANDLE
                  Container(
                    width: width * 0.15,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  SizedBox(height: height * 0.025),

                  Text(
                    "Why are you rejecting this ride?",
                    style: TextStyle(
                      fontSize: width * 0.055,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  Expanded(
                    child: ListView(
                      children: [

                        buildReasonTile(
                          title: "Pickup too far away",
                          selectedReason: selectedReason,
                          onTap: () {
                            setBottomState(() {
                              selectedReason = "Pickup too far away";
                            });
                          },
                        ),

                        buildReasonTile(
                          title: "Heavy traffic",
                          selectedReason: selectedReason,
                          onTap: () {
                            setBottomState(() {
                              selectedReason = "Heavy traffic";
                            });
                          },
                        ),

                        buildReasonTile(
                          title: "Vehicle issue",
                          selectedReason: selectedReason,
                          onTap: () {
                            setBottomState(() {
                              selectedReason =  "Vehicle issue";
                            });
                          },
                        ),

                        buildReasonTile(
                          title: "Going offline",
                          selectedReason: selectedReason,
                          onTap: () {
                            setBottomState(() {
                              selectedReason =  "Going offline";
                            });
                          },
                        ),

                        buildReasonTile(
                          title: "Personal reason",
                          selectedReason: selectedReason,
                          onTap: () {
                            setBottomState(() {
                              selectedReason = "Personal reason";
                            });
                          },
                        ),

                        buildReasonTile(
                          title: "Other reason",
                          selectedReason: selectedReason,
                          onTap: () {
                            setBottomState(() {
                              selectedReason = "Other reason";
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.015),

                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(
                          vertical: height * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(12),
                        ),
                      ),

                      onPressed: () {

                        /// ==========================
                        /// BACKEND API SPACE
                        /// ==========================
                        ///
                        /// Send selectedReason
                        /// rideId
                        /// driverId
                        ///
                        /// Example:
                        /// rejectRide(
                        ///    reason: selectedReason
                        /// );

                        if (selectedReason == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please select a reason"),
                            ),
                          );
                          return;
                        }

                        print(selectedReason);

                        Navigator.pop(context);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapScreen(),
                          ),
                        );

                      },

                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: width * 0.045,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.01),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
Widget buildReasonTile({
  required String title,
  required String? selectedReason,
  required VoidCallback onTap,
}) {
  return Card(
    child: RadioListTile<String>(
      value: title,
      groupValue: selectedReason,
      title: Text(title),
      onChanged: (_) => onTap(),
    ),
  );
}

///reject box function for rideaccepted  and ridestarted screen


void  showRejectRideBottomSheetWithWarning(BuildContext context) {
  String? selectedReason;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,

    builder: (context) {
      return StatefulBuilder(
        builder: (context, setBottomState) {
          final width = MediaQuery.of(context).size.width;
          final height = MediaQuery.of(context).size.height;

          return Container(
            height: height * 0.70,

            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),

            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.02,
              ),

              child: Column(
                children: [

                  /// TOP HANDLE
                  Container(
                    width: width * 0.15,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  SizedBox(height: height * 0.025),

                  Text(
                    "Why are you rejecting this ride?",
                    style: TextStyle(
                      fontSize: width * 0.055,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  Expanded(
                    child: ListView(
                      children: [

                        buildReasonTile(
                          title: "Pickup too far away",
                          selectedReason: selectedReason,
                          onTap: () {
                            setBottomState(() {
                              selectedReason = "Pickup too far away";
                              showCancellationWarningPopup(context);
                            });
                          },
                        ),

                        buildReasonTile(
                          title: "Heavy traffic",
                          selectedReason: selectedReason,
                          onTap: () {
                            setBottomState(() {
                              selectedReason = "Heavy traffic";
                              showCancellationWarningPopup(context);
                            });
                          },
                        ),

                        buildReasonTile(
                          title: "Vehicle issue",
                          selectedReason: selectedReason,
                          onTap: () {
                            setBottomState(() {
                              selectedReason =  "Vehicle issue";
                              showCancellationWarningPopup(context);
                            });
                          },
                        ),

                        buildReasonTile(
                          title: "Going offline",
                          selectedReason: selectedReason,
                          onTap: () {
                            setBottomState(() {
                              selectedReason =  "Going offline";
                              showCancellationWarningPopup(context);
                            });
                          },
                        ),

                        buildReasonTile(
                          title: "Personal reason",
                          selectedReason: selectedReason,
                          onTap: () {
                            setBottomState(() {
                              selectedReason = "Personal reason";
                              showCancellationWarningPopup(context);
                            });

                          },
                        ),

                        buildReasonTile(
                          title: "Other reason",
                          selectedReason: selectedReason,
                          onTap: () {
                            setBottomState(() {
                              selectedReason = "Other reason";
                              showCancellationWarningPopup(context);
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.015),

                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(
                          vertical: height * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(12),
                        ),
                      ),

                      onPressed: () {

                        /// ==========================
                        /// BACKEND API SPACE
                        /// ==========================
                        ///
                        /// Send selectedReason
                        /// rideId
                        /// driverId
                        ///
                        /// Example:
                        /// rejectRide(
                        ///    reason: selectedReason
                        /// );

                        if (selectedReason == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please select a reason"),
                            ),
                          );
                          return;
                        }

                        print(selectedReason);

                        Navigator.pop(context);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapScreen(),
                          ),
                        );

                      },

                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: width * 0.045,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.01),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
