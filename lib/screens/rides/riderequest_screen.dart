import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../slidedrawer/slidebar_screen.dart';
import 'rideaccept_screen.dart';
class NewRideRequestScreen extends StatefulWidget {
  const NewRideRequestScreen({super.key});

  @override
  State<NewRideRequestScreen> createState() =>
      _NewRideRequestScreenState();
}

class _NewRideRequestScreenState
    extends State<NewRideRequestScreen> {

  double sliderPosition = 0;

  GoogleMapController? mapController;

  final LatLng pickupPoint =
  const LatLng(18.5204, 73.8567);

  final LatLng dropPoint =
  const LatLng(18.5912, 73.7389);

  Set<Marker> markers = {};

  Set<Polyline> polylines = {};

  @override
  void initState() {
    super.initState();

    markers = {

      Marker(
        markerId: const MarkerId("pickup"),
        position: pickupPoint,
        infoWindow:
        const InfoWindow(title: "Pickup"),
      ),

      Marker(
        markerId: const MarkerId("drop"),
        position: dropPoint,
        infoWindow:
        const InfoWindow(title: "Drop"),
      ),
    };

    polylines = {

      Polyline(
        polylineId:
        const PolylineId("route"),
        color: Colors.black,
        width: 5,
        points: [
          pickupPoint,
          dropPoint,
        ],
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: DrawerMenu(),
      backgroundColor: const Color(0xFFE3C65A),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.045,
            vertical: size.height * 0.015,
          ),
          child: Column(
            children: [

              //-----------------------------------
              // HEADER
              //-----------------------------------

              Row(
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        size: size.width * 0.07,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Center(
                      child: Text(
                        "New Ride Request",
                        style: TextStyle(
                          fontSize: size.width * 0.043,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  Icon(
                    Icons.notifications_none,
                    size: size.width * 0.065,
                    color: Colors.black,
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.03),

              //-----------------------------------
              // MAP CARD
              //-----------------------------------

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(24),
                ),
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(24),
                  child: AspectRatio(
                    aspectRatio: 1.45,
                    child: GoogleMap(
                      initialCameraPosition:
                      CameraPosition(
                        target: pickupPoint,
                        zoom: 13,
                      ),
                      markers: markers,
                      polylines: polylines,
                      zoomControlsEnabled: false,
                      myLocationButtonEnabled: false,
                      onMapCreated: (controller) {
                        mapController = controller;
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.03),

              //-----------------------------------
              // RIDE INFO CARD
              //-----------------------------------

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(size.width * 0.045),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [

                    //-----------------------------------
                    // PICKUP
                    //-----------------------------------

                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.green,
                          size: size.width * 0.045,
                        ),

                        SizedBox(width: size.width * 0.015),

                        Expanded(
                          child: Text(
                            "Shivaji Nagar",
                            style: TextStyle(
                              fontSize: size.width * 0.032,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.025,
                            vertical: size.height * 0.005,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE3C65A),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Meter Based",
                            style: TextStyle(
                              fontSize: size.width * 0.024,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.015),

                    //-----------------------------------
                    // DROP
                    //-----------------------------------

                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: size.width * 0.045,
                        ),

                        SizedBox(width: size.width * 0.015),

                        Expanded(
                          child: Text(
                            "Hinjewadi Phase 1",
                            style: TextStyle(
                              fontSize: size.width * 0.032,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.02),

                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),

                    SizedBox(height: size.height * 0.015),

                    //-----------------------------------
                    // CUSTOMER INFO
                    //-----------------------------------

                    Row(
                      children: [

                        CircleAvatar(
                          radius: size.width * 0.045,
                          backgroundColor:
                          const Color(0xFF3B82F6),
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: size.width * 0.05,
                          ),
                        ),

                        SizedBox(width: size.width * 0.03),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rahul",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                  size.width * 0.035,
                                ),
                              ),
                              Text(
                                "Customer",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize:
                                  size.width * 0.028,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: size.width * 0.04,
                            ),
                            SizedBox(width: size.width * 0.01),
                            Text(
                              "4.5",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                size.width * 0.035,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(width: size.width * 0.08),

                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Distance",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize:
                                size.width * 0.026,
                              ),
                            ),
                            Text(
                              "8.2 km",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize:
                                size.width * 0.05,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              //-----------------------------------
              // ACCEPT SLIDER BUTTON
              //-----------------------------------

              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF4B4B4B),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {

                    final maxSlide =
                        constraints.maxWidth - 70;

                    return Stack(
                      children: [

                        Center(
                          child: Text(
                            "Swipe to Accept",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        Positioned(
                          left: sliderPosition,
                          top: 4,
                          bottom: 4,
                          child: GestureDetector(

                            onHorizontalDragUpdate: (details) {

                              setState(() {

                                sliderPosition +=
                                    details.delta.dx;

                                if (sliderPosition < 0) {
                                  sliderPosition = 0;
                                }

                                if (sliderPosition >
                                    maxSlide) {
                                  sliderPosition =
                                      maxSlide;
                                }
                              });
                            },

                            onHorizontalDragEnd: (_) {

                              if (sliderPosition >=
                                  maxSlide * 0.8) {

                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(
                                  const SnackBar(
                                    content:
                                    Text("Ride Accepted"),
                                  ),
                                );

                                // navigate here later
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RideAcceptedScreen(),
                                  ),
                                );
                              }

                              setState(() {
                                sliderPosition = 0;
                              });
                            },

                            child: Container(
                              width: 62,
                              decoration: BoxDecoration(
                                color:
                                const Color(0xFFE3C65A),
                                borderRadius:
                                BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  ">>>",
                                  style: TextStyle(
                                    fontSize:
                                    size.width * 0.04,
                                    fontWeight:
                                    FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: size.height * 0.02),

              Text(
                "or",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: size.width * 0.032,
                ),
              ),

              SizedBox(height: size.height * 0.02),

              //-----------------------------------
              // REJECT BUTTON
              //-----------------------------------

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  label: Text(
                    "Reject",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: size.width * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.018,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(28),
                    ),
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}