import 'package:flutter/material.dart';

class SpecialRouteDetailClass extends StatefulWidget {
  static const String id = "special-route-screen";

  @override
  State<SpecialRouteDetailClass> createState() => _SpecialRouteDetailClassState();
}

class _SpecialRouteDetailClassState extends State<SpecialRouteDetailClass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(" Special Route Detail Class "),
      ),
    );
  }
}
