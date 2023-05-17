import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateRouteDetail extends StatefulWidget {
  final String id;
  UpdateRouteDetail({Key? key, required this.id}) : super(key: key);

  @override
  _UpdateRouteDetailState createState() => _UpdateRouteDetailState();
}

class _UpdateRouteDetailState extends State<UpdateRouteDetail> {
  final _formKey = GlobalKey<FormState>();

  // Updaing Student
  CollectionReference route =
      FirebaseFirestore.instance.collection('Route_Details');

  Future<void> updateRoute(id, routeNumber, pickupAddress, dropAddress,
      pickupTime, dropTime, totalRouteTime) {
    return route
        .doc(id)
        .update({
          "routeNumber": routeNumber,
          "pickupAddress": pickupAddress,
          "dropAddress": dropAddress,
          "pickupTime": pickupTime,
          "dropTime": dropTime,
          "totalRouteTime": totalRouteTime,
        })
        .then((value) => print("Route Updated Successfully"))
        .catchError((error) => print("Failed to update Route: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          // Getting Specific Data by ID
          child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('Route_Details')
                .doc(widget.id)
                .get(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                print('Something Went Wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapshot.data!.data();
              var routeNumber = data!['routeNumber'];
              var pickupAddress = data['pickupAddress'];
              var dropAddress = data['dropAddress'];
              var pickupTime = data['pickupTime'];
              var dropTime = data['dropTime'];
              var totalRouteTime = data['totalRouteTime'];

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: routeNumber,
                        autofocus: false,
                        onChanged: (value) => routeNumber = value,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                          labelText: "Route Number",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Route Number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: pickupAddress,
                        autofocus: false,
                        onChanged: (value) => pickupAddress = value,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                          labelText: "PickUp Stop",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter PickUp Stop';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: dropAddress,
                        autofocus: false,
                        onChanged: (value) => dropAddress = value,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                          labelText: "Drop Stop",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Drop Stop';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: pickupTime,
                        autofocus: false,
                        onChanged: (value) => pickupTime = value,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                          labelText: "Pick up time",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Time';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: dropTime,
                        autofocus: false,
                        onChanged: (value) => dropTime = value,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                          labelText: "Drop Time",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Time';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: totalRouteTime,
                        autofocus: false,
                        onChanged: (value) => totalRouteTime = value,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                          labelText: "Route Total Time",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Route Total Time';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, otherwise false.
                              if (_formKey.currentState!.validate()) {
                                updateRoute(
                                  widget.id,
                                  routeNumber,
                                  pickupAddress,
                                  dropAddress,
                                  pickupTime,
                                  dropTime,
                                  totalRouteTime,
                                );
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              'Update',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          // ElevatedButton(
                          //   onPressed: () => {},
                          //   child: Text(
                          //     'Reset',
                          //     style: TextStyle(fontSize: 18.0),
                          //   ),
                          //   style: ElevatedButton.styleFrom(
                          //       primary: Colors.blueGrey),
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
