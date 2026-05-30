import 'package:flutter/material.dart';
import 'accountcreated_screen.dart';

class DriverDetailsScreen extends StatefulWidget {
  const DriverDetailsScreen({super.key});

  @override
  State<DriverDetailsScreen> createState() =>
      _DriverDetailsScreenState();
}

class _DriverDetailsScreenState
    extends State<DriverDetailsScreen> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFE3C65A),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          padding: EdgeInsets.symmetric(
            horizontal: width * 0.08,
            vertical: height * 0.015,
          ),

          child: Column(
            children: [

              /// TOP BAR
              Row(
                children: [

                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: width * 0.065,
                    ),
                  ),

                  Expanded(
                    child: Text(
                      "Details",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      // TODO Notification Screen
                    },
                    icon: Icon(
                      Icons.notifications_none,
                      size: width * 0.06,
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.08),

              /// BIRTH DATE
              _dateField(width),

              SizedBox(height: height * 0.04),

              /// BATCH NO
              _inputField(
                hint: "Batch no. (optional)",
                width: width,
              ),

              SizedBox(height: height * 0.04),

              /// VEHICLE TYPE
              _inputField(
                hint: "Vehicle type",
                width: width,
              ),

              SizedBox(height: height * 0.05),

              /// GENDER
              Container(
                width: double.infinity,

                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                  vertical: height * 0.01,
                ),

                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius:
                  BorderRadius.circular(8),
                  border:
                  Border.all(color: Colors.black54),
                ),

                child: Row(
                  children: [

                    Text(
                      "Gender",
                      style: TextStyle(
                        fontSize: width * 0.04,
                      ),
                    ),

                    const Spacer(),

                    _smallButton("Male"),

                    SizedBox(width: width * 0.02),

                    _smallButton("Female"),
                  ],
                ),
              ),

              SizedBox(height: height * 0.05),

              /// CRIMINAL RECORD
              Container(
                width: double.infinity,

                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                  vertical: height * 0.015,
                ),

                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius:
                  BorderRadius.circular(8),
                  border:
                  Border.all(color: Colors.black54),
                ),

                child: Column(
                  children: [

                    Text(
                      "Do you have a criminal record?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: width * 0.04,
                      ),
                    ),

                    SizedBox(height: height * 0.015),

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,

                      children: [

                        _smallButton("YES"),

                        SizedBox(
                            width: width * 0.03),

                        _smallButton("NO"),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.05),

              /// TERMS
              Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Transform.scale(
                    scale: 0.9,
                    child: Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding:
                      EdgeInsets.only(top: 12),
                      child: Text(
                        "I have read and agree to the Terms & Conditions and Privacy Policy.",
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.03),

              /// SUBMIT BUTTON
              SizedBox(
                width: width * 0.42,
                height: height * 0.055,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    Colors.grey.shade300,
                    foregroundColor: Colors.black,

                    elevation: 3,

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                  ),

                  onPressed: () {

                    // 🔥 API SPACE
                    // TODO Backend

                    if (!isChecked) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Please accept Terms & Conditions",
                          ),
                        ),
                      );
                      return;
                    }
                    // ✅ NAVIGATION HERE
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountCreated(),
                      ),
                    );


                  },

                  child: Text(
                    "SUBMIT",
                    style: TextStyle(
                      fontSize: width * 0.035,
                      fontWeight:
                      FontWeight.w500,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  /// DATE FIELD
  Widget _dateField(double width) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 12),

      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black54),
      ),

      child: TextField(
        decoration: InputDecoration(
          hintText: "Birth Date",
          border: InputBorder.none,

          suffixIcon: Icon(
            Icons.calendar_month,
            size: width * 0.06,
          ),
        ),
      ),
    );
  }

  /// INPUT FIELD
  Widget _inputField({
    required String hint,
    required double width,
  }) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 12),

      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black54),
      ),

      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }

  /// SMALL BUTTON
  Widget _smallButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,

        elevation: 2,

        minimumSize: const Size(60, 30),

        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(8),
        ),
      ),
      onPressed: () {},

      child: Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}