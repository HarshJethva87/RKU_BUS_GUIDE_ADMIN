import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rku_bus_guide_admin/src/features/core/view/Route/list_route_detail.dart';
import 'package:rku_bus_guide_admin/src/features/core/view/Route/update_route_detail.dart';

class RouteDetailClass extends StatefulWidget {
  static const String id = "route-detail-screen";

  @override
  State<RouteDetailClass> createState() => _RouteDetailClassState();
}

class _RouteDetailClassState extends State<RouteDetailClass> {

  final _formKey = GlobalKey<FormState>();

  var routeNumber = "";
  var pickupAddress = "";
  var dropAddress = "";
  var pickupTime = "";
  var dropTime = "";
  var totalRouteTime = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final routeNumberController = TextEditingController();
  final pickUpAddressController = TextEditingController();
  final dropAddressController = TextEditingController();
  final pickUpTimeController = TextEditingController();
  final dropTimeController = TextEditingController();
  final routeTotalTimeController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    routeNumberController.dispose();
    pickUpAddressController.dispose();
    dropAddressController.dispose();
    pickUpTimeController.dispose();
    dropTimeController.dispose();
    routeTotalTimeController.dispose();
    super.dispose();
  }

  clearText() {
    routeNumberController.clear();
    pickUpAddressController.clear();
    dropAddressController.clear();
    pickUpTimeController.clear();
    dropTimeController.clear();
    routeTotalTimeController.clear();
  }

  // Adding Student
  CollectionReference route =
      FirebaseFirestore.instance.collection('Route_Details');

  Future<void> addRoute() {
    return route
        .add({
          "routeNumber": routeNumber,
          "pickupAddress": pickupAddress,
          "dropAddress": dropAddress,
          "pickupTime": pickupTime,
          "dropTime": dropTime,
          "totalRouteTime": totalRouteTime,
        })
        .then((value) => print('Route Successfully Added'))
        .catchError((error) => print('Failed to Add Route: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: ListView(
              children: [
                TextFormField(
                  controller: routeNumberController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    labelText: "Route Number",
                    hintText: "Enter a route number",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Route Number';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: pickUpAddressController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    labelText: "PickUp Stop",
                    hintText: "Enter a PickUp Stop",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter PickUp Stop';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: dropAddressController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    labelText: "Drop Stop",
                    hintText: "Enter a Drop Stop",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Drop Stop';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: pickUpTimeController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    labelText: "PickUp Time",
                    hintText: "Enter a Pick Up Time",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Time';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: dropTimeController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    labelText: "Drop Time",
                    hintText: "Enter a Drop Time",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Time';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: routeTotalTimeController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    labelText: "Total Time Route",
                    hintText: "Enter a route total time",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter total time';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              routeNumber = routeNumberController.text;
                              pickupAddress = pickUpAddressController.text;
                              dropAddress = dropAddressController.text;
                              pickupTime = pickUpTimeController.text;
                              dropTime = dropTimeController.text;
                              totalRouteTime = routeTotalTimeController.text;
                              addRoute();
                              clearText();
                            });
                          }
                        },
                        child: Text(
                          'Add Route',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {clearText()},
                        child: Text(
                          'Reset',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        style:
                            ElevatedButton.styleFrom(primary: Colors.blueGrey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
