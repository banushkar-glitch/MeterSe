import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../slidedrawer/slidebar_screen.dart';
import 'riderequest_screen.dart';
import 'lastmilerequest_screen.dart';
import '../../utils/app_text.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;

  ///drawer menu
  final GlobalKey<ScaffoldState> _scaffoldKey =
  GlobalKey<ScaffoldState>();

  LatLng currentPosition = const LatLng(18.5204, 73.8567);

  StreamSubscription<Position>? positionStream;

  bool isOnline = true;
  bool showRideRequest = false;
  bool isLastMileRequest = false;

  @override
  void initState() {
    super.initState();
    _initLocation();

    // TESTING ONLY
    Future.delayed(
      const Duration(seconds: 15),
          () {
        setState(() {
          showRideRequest = true;

          // FRONTEND TESTING
          isLastMileRequest = false;
          // false = Normal Ride Request
          // true  = Last Mile Request
        });
      },
    );
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
      key: _scaffoldKey,
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.70,
        child: DrawerMenu(),
      ),
      backgroundColor: const Color(0xFFEAEAEA),

      body: Stack(
        children: [

          SafeArea(

          child: Column(
            children: [

              //----------------------------------
              // HEADER
              //----------------------------------
              Container(
                height: 99,
                width: double.infinity,
                color: const Color(0xFFFFD329),

                child: Row(
                  children: [

                    const SizedBox(width: 10),

                    IconButton(

                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        size: size.width * 0.07,
                        color: Colors.black,
                      ),
                    ),

                     Expanded(
                      child: Text(AppText.getText("Dashboard"),
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

              SizedBox(height: size.height * .002),

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
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                              4),
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
                              4),
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
                        height: size.height * .00),

                    //----------------------------------
                    // RIDES CARD
                    //----------------------------------

                    Container(
                      width: double.infinity,
                      height: 203,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [

                          /// TOP ROW
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [

                                    Text(
                                      "Todays Rides",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),

                                    SizedBox(height: 15),

                                    Text(
                                      "5 Rides Completed",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [

                                  Text(
                                    "💎 Diamond",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),

                                  SizedBox(height: 8),

                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.black,
                                        size: 20,
                                      ),

                                      SizedBox(width: 4),

                                      Text(
                                        "4.8",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height : 50),

                          /// BOTTOM ROW
                          Row(
                            children: [

                              CircleAvatar(
                                radius: 26,
                                backgroundColor: Color(0xFFD9D9D9),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [

                                    Text(
                                      "Ramesh Kumar",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),

                                    SizedBox(height: 4),

                                    Text(
                                      "Vehicle: RJ14PC5678",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),

                                    SizedBox(height: 2),

                                    Text(
                                      "Unique Id: 010101",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Switch(
                                value: true,
                                activeColor: Colors.white,
                                activeTrackColor: Color(0xFF5EC25C),
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                        height: size.height * .00),

                    //----------------------------------
                    // RIDE REQUEST
                    //----------------------------------

                    Container(
                      width: double.infinity,
                      height: 100,
                      color: const Color(0xFF3C3A3A),

                      child: Center(
                        child: Container(
                          width: 240,
                          height: 68,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Time left today: ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "03 : 30 : 20",
                                      style: TextStyle(
                                        color: Color(0xFF6FBF3A),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 6),

                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Days Left: ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "2",
                                      style: TextStyle(
                                        color: Color(0xFF6FBF3A),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),

      ),

          if (showRideRequest)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 6,
                  sigmaY: 6,
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.15),
                ),
              ),
            ),

          if (showRideRequest)
            Center(
              child: isLastMileRequest
                  ? const LastMileRequest()
                  : const NewRideRequestScreen(),
            ),
        ],
      ),
    );
  }
}