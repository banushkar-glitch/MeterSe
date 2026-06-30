import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../slidedrawer/slidebar_screen.dart';
import 'rideaccept_screen.dart';
import '../slidedrawer/reject_slider.dart';
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

    return Center(
        child: Container(
          width: size.width * 0.88,
          padding: EdgeInsets.all(size.width * 0.04),
          decoration: BoxDecoration(
            color: const Color(0xFFFFD329),
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: SizedBox(
            height: size.height * 0.78,
          child: Column(

            children: [

              //-----------------------------------
              // HEADER
              //-----------------------------------
          Center(
          child: Container(
          width: 180,
            height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFF3C3A3A),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [

                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 17,
                    ),

                    SizedBox(width: 8),

                    Text(
                      "New Ride Request",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
          ),
              SizedBox(height: size.height * 0.02),



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
                    aspectRatio: 1.2,
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
                width: 305,
                height: 160,

                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(24),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(14),

                  child: Column(
                    children: [

                      /// PROFILE ROW
                      Row(
                        children: [

                          const CircleAvatar(
                            radius: 18,
                            backgroundImage:
                            AssetImage("assets/profile.png"),
                          ),

                          const SizedBox(width: 18),

                          const Expanded(
                            child: Text(
                              "Neha",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          const Icon(
                            Icons.star,
                            size: 18,
                            color: Colors.black,
                          ),

                          const SizedBox(width: 3),

                          const Text(
                            "4.9",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      const Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),

                      const SizedBox(height: 14),

                      /// PICKUP
                      Row(
                        children: [

                          const Icon(
                            Icons.location_on,
                            color: Colors.green,
                            size: 20,
                          ),

                          const SizedBox(width: 8),

                          const Expanded(
                            child: Text(
                              "Shivaji Nagar",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),

                          const Text(
                            "0.5 km",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      /// DROP
                      Row(
                        children: [

                          const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 20,
                          ),

                          const SizedBox(width: 8),

                          const Expanded(
                            child: Text(
                              "Hinjewadi Phase 1",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),

                          const Text(
                            "9.5 km",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.03),

              //-----------------------------------
              // ACCEPT SLIDER BUTTON
              //-----------------------------------

              Container(
                width: double.infinity,
                height: 55,
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
                              fontSize: size.width * 0.050,
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

                              if (sliderPosition >= maxSlide * 0.8) {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RideAcceptedScreen(),
                                  ),
                                );

                                return;
                              }

                              setState(() {
                                sliderPosition = 0;
                              });
                            },

                            child: Container(
                              width: 62,
                              decoration: BoxDecoration(
                                color:
                                const Color(0xFFFFD329),
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

              //-----------------------------------
              // REJECT BUTTON
              //-----------------------------------

          Center(
            child: SizedBox(
              width: 150,

                child: ElevatedButton.icon(
                  onPressed: () {
                    showRejectRideBottomSheet(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  label: Text(
                    "Reject",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.014,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(28),
                    ),
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