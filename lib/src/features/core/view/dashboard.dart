import 'package:flutter/material.dart';

class DashboardClass extends StatefulWidget {
  static const String id = "dashboard-screen";

  @override
  State<DashboardClass> createState() => _DashboardClassState();
}

class _DashboardClassState extends State<DashboardClass> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          child: Text("Hello"),
        )
      ],
    );
  }
}
