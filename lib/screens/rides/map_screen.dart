import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../slidedrawer/slidebar_screen.dart';
import 'riderequest_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;

  LatLng currentPosition = const LatLng(18.5204, 73.8567);

  StreamSubscription<Position>? positionStream;

  bool isOnline = true;

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  Future<void> _initLocation() async {
    await _getLocation();
    _startLiveTracking();
  }

  Future<void> _getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) return;

    LocationPermission permission =
    await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }

    Position position =
    await Geolocator.getCurrentPosition();

    final newPosition =
    LatLng(position.latitude, position.longitude);

    setState(() {
      currentPosition = newPosition;
    });

    mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(newPosition, 16),
    );
  }

  void _startLiveTracking() {
    positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((position) {
      final newPosition =
      LatLng(position.latitude, position.longitude);

      setState(() {
        currentPosition = newPosition;
      });

      mapController?.animateCamera(
        CameraUpdate.newLatLng(newPosition),
      );

      // TODO:
      // sendLocationToBackend(
      // position.latitude,
      // position.longitude,
      // );
    });
  }

  @override
  void dispose() {
    positionStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: DrawerMenu(),
      backgroundColor: const Color(0xffE3C65A),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * .03,
            vertical: size.height * .01,
          ),
          child: Column(
            children: [

              //----------------------------------
              // HEADER
              //----------------------------------

              GestureDetector(
                onTap: () {
                  // OPEN PROFILE
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * .04,
                    vertical: size.height * .012,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffE9CF63),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Builder(
                        builder: (context) => InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: const Icon(Icons.menu),
                        ),
                      ),
                      SizedBox(width: size.width * .03),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello,Rakesh",
                              style: TextStyle(
                                fontWeight:
                                FontWeight.w700,
                                fontSize:
                                size.width * .045,
                              ),
                            ),

                            SizedBox(
                                height:
                                size.height * .003),

                            Row(
                              children: [
                                Text(
                                  "You are Online",
                                  style: TextStyle(
                                    fontSize:
                                    size.width *
                                        .026,
                                    letterSpacing: 2,
                                  ),
                                ),

                                SizedBox(
                                    width:
                                    size.width *
                                        .015),

                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration:
                                  const BoxDecoration(
                                    color:
                                    Colors.green,
                                    shape:
                                    BoxShape.circle,
                                  ),
                                ),

                                SizedBox(
                                    width:
                                    size.width *
                                        .01),

                                Text(
                                  "Online",
                                  style: TextStyle(
                                    color:
                                    Colors.green,
                                    fontSize:
                                    size.width *
                                        .025,
                                  ),
                                )
                              ],
                            ),

                            Text(
                              "OnlineTime 03h 30m 20sec",
                              style: TextStyle(
                                fontWeight:
                                FontWeight.w500,
                                fontSize:
                                size.width * .03,
                              ),
                            ),
                          ],
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          // NOTIFICATION PAGE
                        },
                        child: const Icon(
                          Icons.notifications_none,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: size.height * .015),

              //----------------------------------
              // BODY
              //----------------------------------

              Expanded(
                child: Column(
                  children: [

                    //----------------------------------
                    // MAP
                    //----------------------------------

                    Expanded(
                      flex: 6,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                              20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(.15),
                              blurRadius: 8,
                            )
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(
                              20),
                          child: GoogleMap(
                            initialCameraPosition:
                            CameraPosition(
                              target:
                              currentPosition,
                              zoom: 15,
                            ),
                            myLocationEnabled:
                            true,
                            myLocationButtonEnabled:
                            true,
                            zoomControlsEnabled:
                            false,
                            markers: {
                              Marker(
                                markerId:
                                const MarkerId(
                                    "driver"),
                                position:
                                currentPosition,
                              ),
                            },
                            onMapCreated:
                                (controller) {
                              mapController =
                                  controller;
                            },
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        height: size.height * .015),

                    //----------------------------------
                    // RIDES CARD
                    //----------------------------------

                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          // TODAY RIDES SCREEN
                        },
                        child: Container(
                          width: double.infinity,
                          padding:
                          EdgeInsets.symmetric(
                            horizontal:
                            size.width * .04,
                          ),
                          decoration: BoxDecoration(
                            color:
                            const Color(0xff5A5A5A),
                            borderRadius:
                            BorderRadius.circular(
                                18),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  children: [
                                    Text(
                                      "Today's Ride",
                                      style:
                                      TextStyle(
                                        color: Colors
                                            .white70,
                                        fontSize:
                                        size.width *
                                            .028,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                        size.height *
                                            .005),
                                    Text(
                                      "5 Rides Completed",
                                      style:
                                      TextStyle(
                                        color: Colors
                                            .white,
                                        fontWeight:
                                        FontWeight
                                            .bold,
                                        fontSize:
                                        size.width *
                                            .042,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const Icon(
                                Icons
                                    .trending_up_rounded,
                                color: Colors.amber,
                                size: 42,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        height: size.height * .012),

                    //----------------------------------
                    // GO ONLINE CARD
                    //----------------------------------

                    Expanded(
                      flex: 1,
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(
                          horizontal:
                          size.width * .04,
                        ),
                        decoration: BoxDecoration(
                          color:
                          const Color(0xff5A5A5A),
                          borderRadius:
                          BorderRadius.circular(
                              16),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: [
                                  Text(
                                    "Go Online",
                                    style:
                                    TextStyle(
                                      color: Colors
                                          .white,
                                      fontWeight:
                                      FontWeight
                                          .bold,
                                      fontSize:
                                      size.width *
                                          .038,
                                    ),
                                  ),
                                  Text(
                                    "You are online and visible to riders",
                                    style:
                                    TextStyle(
                                      color: Colors
                                          .white70,
                                      fontSize:
                                      size.width *
                                          .026,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Switch(
                              value: isOnline,
                              activeTrackColor:
                              const Color(
                                  0xffE3C65A),
                              activeColor:
                              Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  isOnline =
                                      value;
                                });

                                // TODO BACKEND
                                // updateDriverStatus(value);
                              },
                            )
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                        height: size.height * .012),

                    //----------------------------------
                    // RIDE REQUEST
                    //----------------------------------

                    GestureDetector(
                      onTap: () {
                        // OPEN RIDE REQUESTS
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewRideRequestScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding:
                        EdgeInsets.symmetric(
                          horizontal:
                          size.width * .05,
                          vertical:
                          size.height * .018,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(
                              16),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: [
                                  Text(
                                    "Ride Request",
                                    style:
                                    TextStyle(
                                      fontWeight:
                                      FontWeight
                                          .bold,
                                      fontSize:
                                      size.width *
                                          .040,
                                    ),
                                  ),
                                  SizedBox(
                                      height: size
                                          .height *
                                          .003),
                                  Text(
                                    "You are online and visible to riders",
                                    style:
                                    TextStyle(
                                      color: Colors
                                          .black54,
                                      fontSize:
                                      size.width *
                                          .026,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}