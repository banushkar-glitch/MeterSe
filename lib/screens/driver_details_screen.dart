import 'package:flutter/material.dart';
import 'accountcreated_screen.dart';
import '../utils/app_text.dart';
class DriverDetailsScreen extends StatefulWidget {
  const DriverDetailsScreen({super.key});

  @override
  State<DriverDetailsScreen> createState() =>
      _DriverDetailsScreenState();
}

class _DriverDetailsScreenState
    extends State<DriverDetailsScreen> {

  String? selectedGender;
  String? criminalRecord;

  bool isTermsAccepted = false;

  DateTime? selectedDate;

  final TextEditingController batchNumberController =
  TextEditingController();

  final TextEditingController vehicleTypeController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFEAEAEA),

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

                   Expanded(
                    child: Text(AppText.getText("Personal Details"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Geologica',
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        letterSpacing: 0,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                      size: 28,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(width: 10),
                ],
              ),
            ),

            /// BODY AREA
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFEAEAEA),

                child: Column(
                  children: [

                    const SizedBox(height: 83),

                GestureDetector(
                  onTap: () async {

                    DateTime? pickedDate =
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    );

                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    }
                  },

                  child: Container(
                    width: 303,
                    height: 49,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(11),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),

                      child: Row(
                        children: [

                          Expanded(
                            child: Text(
                              selectedDate == null
                                  ? AppText.getText("Date of Birth")
                                  : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                              style: TextStyle(
                                fontFamily: 'InriaSerif',
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                                letterSpacing: -0.4,
                                color: Color(0xCC000000), // 80% opacity black
                              ),
                            ),
                          ),

                          const Icon(
                            Icons.calendar_today_outlined,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),



                    const SizedBox(height: 41),

                    Container(
                      width: 303,
                      height: 50,

                      decoration: BoxDecoration(
                        color: Colors.white,

                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),

                        borderRadius: BorderRadius.circular(11),
                      ),

                      child:  Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                        ),

                        child: Row(
                          children: [

                            Text(AppText.getText("Batch Number"),
                              style: TextStyle(
                                fontFamily: 'InriaSerif',
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                                letterSpacing: -0.4,
                                color: Color(0xCC000000), // 80% opacity black
                              ),
                            ),

                            SizedBox(width: 4),

                            Text(
                              "(optional)",
                              style: TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 41),


                GestureDetector(
                  onTap: () {
                    print("Vehicle Type Clicked");
                  },
                  child: Container(
                      width: 303,
                      height: 49,

                      decoration: BoxDecoration(
                        color: Colors.white,

                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),

                        borderRadius: BorderRadius.circular(9),
                      ),

                      child:  Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                        ),

                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(AppText.getText("Vehicle Type"),
                            style: TextStyle(
                              fontFamily: 'InriaSerif',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                              letterSpacing: -0.4,
                              color: Color(0xCC000000), // 80% opacity black
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                    const SizedBox(height: 41),

                    Container(
                      width: 303,
                      height: 49,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(9),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),

                        child: Row(
                          children: [

                          Text(AppText.getText("Gender"),
                              style: TextStyle(
                                fontFamily: 'InriaSerif',
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                                letterSpacing: -0.4,
                                color: Color(0xCC000000), // 80% opacity black
                              ),
                            ),

                            const Spacer(),

                            Container(
                              width: 92,
                              height: 28,

                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F3EB),
                                borderRadius: BorderRadius.circular(9),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                    color: Colors.black26,
                                  ),
                                ],
                              ),

                              child: Center(
                                child: Text(AppText.getText("Male"),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 12),

                            Container(
                              width: 92,
                              height: 28,

                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F3EB),
                                borderRadius: BorderRadius.circular(9),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    color: Colors.black26,
                                  ),
                                ],
                              ),

                              child: Center(
                                child: Text(AppText.getText("Female"),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 41),

                    Container(
                      width: 303,
                      height: 83,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(9),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                             Text(AppText.getText("Do you have a criminal record?"),
                              style: TextStyle(
                                fontFamily: 'InriaSerif',
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                                letterSpacing: -0.4,
                                color: Color(0xCC000000), // 80% opacity black
                              ),
                            ),

                            const SizedBox(height: 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Container(
                                  width: 92,
                                  height: 28,

                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF5F3EB),
                                    borderRadius: BorderRadius.circular(9),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        color: Colors.black26,
                                      ),
                                    ],
                                  ),

                                  child:  Center(
                                    child: Text(AppText.getText("Yes"),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 12),

                                Container(
                                  width: 92,
                                  height: 28,

                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF5F3EB),
                                    borderRadius: BorderRadius.circular(9),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        color: Colors.black26,
                                      ),
                                    ],
                                  ),

                                  child: Center(
                                    child: Text(AppText.getText("No"),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(width: 45),

                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                        ),

                        const SizedBox(width: 15),

                         SizedBox(
                          width: 250,
                          child: Text(AppText.getText("I have read and agree to the Terms & Conditions and Privacy Policy."),
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.4,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),

            /// FOOTER
            GestureDetector(
              onTap: () {
                // YOUR ACTION HERE

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccountCreated(),
                  ),
                );
              },

              child: Container(
                height: 99,
                width: double.infinity,
                color: const Color(0xFF3C3A3A),

                child: Center(
                  child: Container(
                    width: 290,
                    height: 50.8,

                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(
                        25.3981,
                      ),
                    ),

                    child: Center(
                      child: Text(AppText.getText("Submit"),
                        style: TextStyle(
                          fontFamily: 'InriaSerif',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                          letterSpacing: -0.4,
                          color: Color(0xCC000000),
                        ),
                      ),
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
}