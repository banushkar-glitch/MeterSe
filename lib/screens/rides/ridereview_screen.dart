import 'package:flutter/material.dart';
import 'map_screen.dart';
import '../slidedrawer/slidebar_screen.dart';
class RateRideScreen extends StatefulWidget {
  const RateRideScreen({super.key});

  @override
  State<RateRideScreen> createState() => _RateRideScreenState();
}

class _RateRideScreenState extends State<RateRideScreen> {
  final TextEditingController reviewController = TextEditingController();

  int selectedRating = 4;

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  Widget buildStar(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRating = index;
        });
      },
      child: Icon(
        Icons.star,
        color: index <= selectedRating
            ? const Color(0xFFFFD700)
            : Colors.grey.shade400,
        size: 32,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final height = media.size.height;

    return Scaffold(
      drawer: const DrawerMenu(),
      backgroundColor: const Color(0xFFE6CF63),
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.015,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
              Row(
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        size: width * 0.07,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Text(
                      "Rate Your Ride",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      // TODO Notification API
                    },
                    icon: Icon(
                      Icons.notifications_none,
                      size: width * 0.07,
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.02),

              /// SUCCESS ICON
              Center(
                child: Container(
                  height: width * 0.24,
                  width: width * 0.24,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: width * 0.14,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.015),

              Center(
                child: Text(
                  "Ride Completed!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.05,
                  ),
                ),
              ),

              SizedBox(height: height * 0.005),

              Center(
                child: Text(
                  "How was your experience??",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: width * 0.032,
                  ),
                ),
              ),

              SizedBox(height: height * 0.03),

              /// MAP
              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  minHeight: height * 0.28,
                  maxHeight: height * 0.38,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.white,
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/map.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: height * 0.03),

              Text(
                "Rate your Experience",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.045,
                ),
              ),

              SizedBox(height: height * 0.01),

              /// RATING CARD
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.018,
                  horizontal: width * 0.03,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [

                    Text(
                      "Your feedback helps us to improve",
                      style: TextStyle(
                        fontSize: width * 0.038,
                      ),
                    ),

                    SizedBox(height: height * 0.01),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                            (index) => buildStar(index + 1),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.025),

              Text(
                "Write a review (optional)",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.045,
                ),
              ),

              SizedBox(height: height * 0.01),

              /// REVIEW BOX
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TextField(
                  controller: reviewController,
                  maxLines: 5,
                  maxLength: 250,
                  decoration: InputDecoration(
                    hintText:
                    "Share details about your ride.........",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(width * 0.04),
                    counterText: "",
                  ),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "${reviewController.text.length}/250",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: width * 0.03,
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              /// SUBMIT BUTTON
              SizedBox(
                width: double.infinity,
                height: height * 0.065,
                child: ElevatedButton(
                  onPressed: () {

                    /// TODO API CALL
                    ///
                    /// selectedRating
                    /// reviewController.text
                    ///
                    /// Backend Integration Here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MapScreen(),

                      ),
                    );

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFEA00),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Submit Review",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.bold,
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
}