import 'package:flutter/material.dart';

class MeterLoader extends StatelessWidget {
  const MeterLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/loading_rickshaw.gif",
        width: 140,
        height: 140,
      ),
    );
  }
}