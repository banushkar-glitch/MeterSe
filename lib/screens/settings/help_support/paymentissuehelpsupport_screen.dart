import 'package:flutter/material.dart';
import 'helpsupportsettings_screen.dart';
class PaymentIssuesScreen extends StatelessWidget {
  const PaymentIssuesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE4C766),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.012,
            ),

            child: Column(
              children: [

                /// 🔹 TOP BAR
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      icon: Icon(
                        Icons.arrow_back,
                        size: size.width * 0.075,
                        color: Colors.black,
                      ),
                    ),

                    Text(
                      "Payment Issues",

                      style: TextStyle(
                        fontSize: size.width * 0.048,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),

                    IconButton(
                      onPressed: () {},

                      icon: Icon(
                        Icons.notifications_none,
                        size: size.width * 0.065,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.01),

                /// 🔹 TOP ICON
                CircleAvatar(
                  radius: size.width * 0.085,
                  backgroundColor: Colors.white,

                  child: Icon(
                    Icons.account_balance_wallet_outlined,
                    size: size.width * 0.075,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: size.height * 0.012),

                /// 🔹 TITLE
                Text(
                  "Having trouble with payments?",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: size.height * 0.004),

                /// 🔹 SUBTITLE
                Text(
                  "We're here to help you resolve any payment related issues.",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: size.width * 0.024,
                    color: Colors.black54,
                  ),
                ),

                SizedBox(height: size.height * 0.018),

                /// 🔹 SEARCH BAR
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(12),
                  ),

                  child: Row(
                    children: [

                      Icon(
                        Icons.search,
                        size: size.width * 0.055,
                        color: Colors.black54,
                      ),

                      SizedBox(width: size.width * 0.02),

                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText:
                            "Search payment issues...",

                            hintStyle: TextStyle(
                              fontSize:
                              size.width * 0.025,
                              color: Colors.black45,
                            ),

                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.018),

                /// 🔹 SECTION TITLE
                Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    "Common Payment Issues",

                    style: TextStyle(
                      fontSize: size.width * 0.028,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.01),

                /// 🔹 ISSUES BOX
                Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),

                    borderRadius:
                    BorderRadius.circular(14),
                  ),

                  child: Column(
                    children: const [

                      PaymentIssueTile(
                        title: "Payout Not Received",
                        subtitle:
                        "Haven't received your earnings in bank account?",
                      ),

                      PaymentIssueTile(
                        title: "Incorrect Payout Amount",
                        subtitle:
                        "Received less amount than expected?",
                      ),

                      PaymentIssueTile(
                        title: "Payout Pending",
                        subtitle:
                        "Payout is taking longer than usual",
                      ),

                      PaymentIssueTile(
                        title: "Payment Method Issues",
                        subtitle:
                        "Problem adding or updating payment method?",
                      ),

                      PaymentIssueTile(
                        title: "Refund Related Issues",
                        subtitle:
                        "Issue with refund or cancelled trip amount?",
                        isLast: true,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.018),

                /// 🔹 SUPPORT BOX
                Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),

                    borderRadius:
                    BorderRadius.circular(14),

                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),

                  child: Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.012,
                        ),

                        child: Row(
                          children: [

                            Icon(
                              Icons.support_agent,
                              size: size.width * 0.08,
                            ),

                            SizedBox(width: size.width * 0.03),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,

                                children: [

                                  Text(
                                    "Still need help?",

                                    style: TextStyle(
                                      fontSize:
                                      size.width * 0.032,
                                      fontWeight:
                                      FontWeight.w600,
                                    ),
                                  ),

                                  SizedBox(
                                    height:
                                    size.height * 0.002,
                                  ),

                                  Text(
                                    "Our support team is available\n24/7 to assist you",

                                    style: TextStyle(
                                      fontSize:
                                      size.width * 0.022,
                                      color:
                                      Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {},

                              style:
                              ElevatedButton.styleFrom(
                                backgroundColor:
                                const Color(
                                    0xFF4A423F),

                                padding:
                                EdgeInsets.symmetric(
                                  horizontal:
                                  size.width * 0.04,
                                  vertical:
                                  size.height * 0.01,
                                ),

                                shape:
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius
                                      .circular(8),
                                ),
                              ),

                              child: Text(
                                "Chat With Us",

                                style: TextStyle(
                                  fontSize:
                                  size.width * 0.023,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Divider(
                        color: Colors.grey.shade300,
                        height: 1,
                      ),

                      InkWell(
                        onTap: () {},

                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                            vertical: size.height * 0.014,
                          ),

                          child: Row(
                            children: [

                              Icon(
                                Icons.mail_outline,
                                size: size.width * 0.07,
                              ),

                              SizedBox(
                                  width:
                                  size.width * 0.03),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,

                                  children: [

                                    Text(
                                      "Email us",

                                      style: TextStyle(
                                        fontSize:
                                        size.width *
                                            0.03,
                                        fontWeight:
                                        FontWeight
                                            .w600,
                                      ),
                                    ),

                                    SizedBox(
                                      height:
                                      size.height *
                                          0.002,
                                    ),

                                    Text(
                                      "Support@metersay.com",

                                      style: TextStyle(
                                        fontSize:
                                        size.width *
                                            0.022,
                                        color: Colors
                                            .black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Icon(
                                Icons.arrow_forward_ios,
                                size: size.width * 0.035,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.015),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 🔹 REUSABLE ISSUE TILE
class PaymentIssueTile extends StatelessWidget {

  final String title;
  final String subtitle;
  final bool isLast;

  const PaymentIssueTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Column(
      children: [

        InkWell(
          onTap: () {},

          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03,
              vertical: size.height * 0.014,
            ),

            child: Row(
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Text(
                        title,

                        style: TextStyle(
                          fontSize: size.width * 0.028,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.004,
                      ),

                      Text(
                        subtitle,

                        style: TextStyle(
                          fontSize: size.width * 0.022,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: size.width * 0.02),

                Icon(
                  Icons.arrow_forward_ios,
                  size: size.width * 0.03,
                ),
              ],
            ),
          ),
        ),

        if (!isLast)
          Divider(
            color: Colors.grey.shade300,
            height: 1,
          ),
      ],
    );
  }
}