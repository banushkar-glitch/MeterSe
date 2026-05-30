import 'package:flutter/material.dart';
import 'subscription_screen.dart';
class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubscriptionScreen(),
                          ),
                        );
                      },

                      icon: Icon(
                        Icons.arrow_back,
                        size: size.width * 0.075,
                        color: Colors.black,
                      ),
                    ),

                    Text(
                      "Payments",

                      style: TextStyle(
                        fontSize: size.width * 0.05,
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

                /// 🔹 PAYMENT ICON
                CircleAvatar(
                  radius: size.width * 0.08,
                  backgroundColor: Colors.white,

                  child: Icon(
                    Icons.account_balance_wallet,
                    size: size.width * 0.07,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: size.height * 0.012),

                /// 🔹 TITLE
                Text(
                  "Manage Your Payments",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: size.height * 0.005),

                /// 🔹 SUBTITLE
                Text(
                  "View payment methods and transaction history.",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: size.width * 0.026,
                    color: Colors.black54,
                  ),
                ),

                SizedBox(height: size.height * 0.02),

                /// 🔹 PAYMENT METHODS TITLE
                Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    "Payment Methods",

                    style: TextStyle(
                      fontSize: size.width * 0.028,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.008),

                /// 🔹 PAYMENT METHODS BOX
                Container(
                  width: double.infinity,

                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.height * 0.008,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),

                    borderRadius:
                    BorderRadius.circular(14),
                  ),

                  child: Column(
                    children: const [

                      PaymentMethodTile(
                        icon: Icons.g_mobiledata,
                        title: "Google Pay",
                      ),

                      PaymentMethodTile(
                        icon: Icons.phone_android,
                        title: "PhonePe",
                      ),

                      PaymentMethodTile(
                        icon: Icons.account_balance,
                        title: "Bank Transfer",
                      ),

                      PaymentMethodTile(
                        icon: Icons.account_balance_wallet,
                        title: "Wallet",
                        isLast: true,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.018),

                /// 🔹 RECENT TRANSACTION TITLE
                Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    "Recent Transactions",

                    style: TextStyle(
                      fontSize: size.width * 0.028,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.008),

                /// 🔹 TRANSACTION BOX
                Container(
                  width: double.infinity,

                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.height * 0.01,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),

                    borderRadius:
                    BorderRadius.circular(14),

                    border: Border.all(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),

                  child: Column(
                    children: const [

                      TransactionTile(
                        title: "Wallet Balance Added",
                        amount: "500",
                        time: "9:15 AM",
                      ),

                      Divider(),

                      TransactionTile(
                        title: "Payout to Metersay",
                        amount: "800",
                        time: "Yesterday",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.018),

                /// 🔹 SECURITY BOX
                Container(
                  width: double.infinity,

                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.height * 0.012,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),

                    borderRadius:
                    BorderRadius.circular(12),

                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),

                  child: Row(
                    children: [

                      Icon(
                        Icons.verified_user_outlined,
                        size: size.width * 0.07,
                      ),

                      SizedBox(width: size.width * 0.025),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            Text(
                              "Secure Payments",

                              style: TextStyle(
                                fontSize:
                                size.width * 0.028,
                                fontWeight:
                                FontWeight.w600,
                              ),
                            ),

                            SizedBox(
                                height:
                                size.height * 0.002),

                            Text(
                              "Your payments are encrypted and secured with top-level security.",

                              style: TextStyle(
                                fontSize:
                                size.width * 0.021,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: size.width * 0.02),

                      ElevatedButton(
                        onPressed: () {},

                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color(0xFF4A423F),

                          padding:
                          EdgeInsets.symmetric(
                            horizontal:
                            size.width * 0.03,
                            vertical:
                            size.height * 0.008,
                          ),

                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                                8),
                          ),
                        ),

                        child: Text(
                          "Learn More",

                          style: TextStyle(
                            fontSize:
                            size.width * 0.022,
                            color: Colors.white,
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

/// 🔹 PAYMENT METHOD TILE
class PaymentMethodTile extends StatelessWidget {

  final IconData icon;
  final String title;
  final bool isLast;

  const PaymentMethodTile({
    super.key,
    required this.icon,
    required this.title,
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
              vertical: size.height * 0.012,
            ),

            child: Row(
              children: [

                Icon(
                  icon,
                  size: size.width * 0.045,
                ),

                SizedBox(width: size.width * 0.03),

                Expanded(
                  child: Text(
                    title,

                    style: TextStyle(
                      fontSize: size.width * 0.028,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

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
          ),
      ],
    );
  }
}

/// 🔹 TRANSACTION TILE
class TransactionTile extends StatelessWidget {

  final String title;
  final String amount;
  final String time;

  const TransactionTile({
    super.key,
    required this.title,
    required this.amount,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Row(
      children: [

        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(
                title,

                style: TextStyle(
                  fontSize: size.width * 0.026,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: size.height * 0.003),

              Text(
                time,

                style: TextStyle(
                  fontSize: size.width * 0.022,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),

        Text(
          amount,

          style: TextStyle(
            fontSize: size.width * 0.028,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}