import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rku_bus_guide_admin/firebase_options.dart';
import 'package:rku_bus_guide_admin/src/features/core/view/dashboard.dart';
import 'package:rku_bus_guide_admin/src/features/core/view/home.dart';
import 'package:rku_bus_guide_admin/src/features/core/view/image_detail.dart';
import 'package:rku_bus_guide_admin/src/features/core/view/Route/route_detail.dart';
import 'package:rku_bus_guide_admin/src/features/core/view/special_route_detail.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize a new Firebase App instance
 WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin-Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeClass.id,
      routes: {
        HomeClass.id: (context) => HomeClass(),
        DashboardClass.id: (context) => DashboardClass(),
        RouteDetailClass.id: (context) => RouteDetailClass(),
        SpecialRouteDetailClass.id: (context) => SpecialRouteDetailClass(),
        ImageDetailClass.id: (context) => ImageDetailClass(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
