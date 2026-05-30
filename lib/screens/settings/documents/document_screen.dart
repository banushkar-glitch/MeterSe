import 'package:flutter/material.dart';
import '../settings_screen.dart';
class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE4C766),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.02,
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                /// 🔹 HEADER
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    IconButton(
                      onPressed: () {

                        Navigator.pop(
                          context);


                      },

                      icon: Icon(
                        Icons.arrow_back,
                        size: size.width * 0.09,
                        color: Colors.black,
                      ),
                    ),

                    Text(
                      "Documents",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight:
                        FontWeight.w700,
                      ),
                    ),

                    Icon(
                      Icons.notifications_none,
                      size: 34,
                    ),
                  ],
                ),

                SizedBox(
                  height: size.height * 0.02,
                ),

                /// 🔹 DESCRIPTION
                const Text(
                  "Upload and manage all your important documents.\nEnsure your documents are valid and up to date.",

                  style: TextStyle(
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),

                SizedBox(
                  height: size.height * 0.025,
                ),

                /// 🔹 MAIN CARD
                Container(
                  width: double.infinity,

                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                    vertical: size.height * 0.025,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F3F3),

                    borderRadius:
                    BorderRadius.circular(24),
                  ),

                  child: Column(
                    children: [

                      DocumentTile(
                        icon: Icons.credit_card,
                        title: "Driving Licence",
                        subtitle:
                        "Upload front side of your driving license",
                      ),

                      Divider(
                        color: Colors.grey.shade400,
                        height: size.height * 0.05,
                      ),

                      DocumentTile(
                        icon: Icons.fire_truck,
                        title:
                        "Vehicle Registration",
                        subtitle:
                        "Upload front side of your RC",
                      ),

                      Divider(
                        color: Colors.grey.shade400,
                        height: size.height * 0.05,
                      ),

                      DocumentTile(
                        icon: Icons.directions_car,
                        title: "Vehicle Photo",
                        subtitle:
                        "Upload front side of your Riksha",
                      ),

                      Divider(
                        color: Colors.grey.shade400,
                        height: size.height * 0.05,
                      ),

                      DocumentTile(
                        icon: Icons.badge,
                        title: "Aadhaar Card",
                        subtitle:
                        "Upload front side of your Aadhar",
                      ),

                      Divider(
                        color: Colors.grey.shade400,
                        height: size.height * 0.05,
                      ),

                      DocumentTile(
                        icon: Icons.badge_outlined,
                        title: "PAN Card",
                        subtitle:
                        "Upload front side of your PAN",
                      ),

                      Divider(
                        color: Colors.grey.shade400,
                        height: size.height * 0.05,
                      ),

                      DocumentTile(
                        icon: Icons.account_circle,
                        title: "Profile Photo",
                        subtitle:
                        "Upload your profile image",
                      ),

                      Divider(
                        color: Colors.grey.shade400,
                        height: size.height * 0.05,
                      ),

                      /// 🔹 UPDATE CARD
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                          size.width * 0.03,
                          vertical:
                          size.height * 0.018,
                        ),

                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                            Colors.grey.shade400,
                          ),

                          borderRadius:
                          BorderRadius.circular(
                              16),
                        ),

                        child: Row(
                          children: [

                            const Icon(
                              Icons.error_outline,
                              size: 36,
                            ),

                            SizedBox(
                              width:
                              size.width * 0.03,
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,

                                children: const [

                                  Text(
                                    "Keep your documents updated",

                                    style: TextStyle(
                                      fontWeight:
                                      FontWeight
                                          .w700,
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height: 4),

                                  Text(
                                    "Expired documents may affect your ride requests",

                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {},

                              style:
                              ElevatedButton
                                  .styleFrom(
                                backgroundColor:
                                const Color(
                                  0xFF4A423F,
                                ),

                                shape:
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                      12),
                                ),
                              ),

                              child: const Text(
                                "Update Now",
                                style: TextStyle(
                                  color:
                                  Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.03,
                      ),

                      /// 🔹 UPLOAD BUTTON
                      SizedBox(
                        width: double.infinity,

                        child: ElevatedButton(
                          onPressed: () {},

                          style:
                          ElevatedButton.styleFrom(
                            backgroundColor:
                            const Color(
                              0xFF4A423F,
                            ),

                            padding:
                            EdgeInsets.symmetric(
                              vertical:
                              size.height * 0.02,
                            ),

                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius
                                  .circular(16),
                            ),
                          ),

                          child: const Text(
                            "Upload New Document",

                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight:
                              FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 🔹 DOCUMENT TILE
class DocumentTile extends StatelessWidget {

  final IconData icon;
  final String title;
  final String subtitle;

  const DocumentTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Icon(
          icon,
          size: 40,
        ),

        SizedBox(
          width: size.width * 0.03,
        ),

        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(
                title,

                style: const TextStyle(
                  fontSize: 17,
                  fontWeight:
                  FontWeight.w700,
                ),
              ),

              SizedBox(
                height: size.height * 0.004,
              ),

              Text(
                subtitle,

                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),

              SizedBox(
                height: size.height * 0.006,
              ),

              Row(
                children: const [

                  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 22,
                  ),

                  SizedBox(width: 5),

                  Text(
                    "Verified",

                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight:
                      FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        GestureDetector(
          onTap: () {},

          child: const Icon(
            Icons.chevron_right,
            size: 34,
          ),
        ),
      ],
    );
  }
}