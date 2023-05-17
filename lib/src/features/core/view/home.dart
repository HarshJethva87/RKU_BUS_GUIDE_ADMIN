import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:rku_bus_guide_admin/src/features/core/view/Route/list_route_detail.dart';
import 'package:rku_bus_guide_admin/src/features/core/view/Route/update_route_detail.dart';
import 'package:rku_bus_guide_admin/src/features/core/view/dashboard.dart';
import 'package:rku_bus_guide_admin/src/features/core/view/image_detail.dart';
import 'package:rku_bus_guide_admin/src/features/core/view/Route/route_detail.dart';
import 'package:rku_bus_guide_admin/src/features/core/view/special_route_detail.dart';

class HomeClass extends StatefulWidget {
  static const String id = "home-screen";

  @override
  State<HomeClass> createState() => _HomeClassState();
}

class _HomeClassState extends State<HomeClass> {
  // This is Declare for the switch screen use State management

  Widget _selectedScreen = DashboardClass();

  // Useing Switch Case we change over screen

  currentScreen(item) {
    switch (item.route) {
      case DashboardClass.id:
        setState(() {
          _selectedScreen = DashboardClass();
        });
        break;
      case RouteDetailClass.id:
        setState(() {
          _selectedScreen = RouteDetailClass();
        });
        break;
      case ListRouteDetail.id:
        setState(() {
          _selectedScreen = ListRouteDetail();
        });
        break;
      case SpecialRouteDetailClass.id:
        setState(() {
          _selectedScreen = SpecialRouteDetailClass();
        });
        break;
      case ImageDetailClass.id:
        setState(() {
          _selectedScreen = ImageDetailClass();
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('RKU BUS GUIDE ADMIN_PANEL'),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            route: DashboardClass.id,
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
              title: 'RouteDetails',
              icon: Icons.route_rounded,
              children: [
                AdminMenuItem(
                  title: "Add Routes",
                  route: RouteDetailClass.id,
                ),
                AdminMenuItem(
                  title: "List Routes",
                  route: ListRouteDetail.id,
                )
              ]),
          AdminMenuItem(
            title: 'SpecialRouteDetails',
            route: SpecialRouteDetailClass.id,
            icon: Icons.map_outlined,
          ),
          AdminMenuItem(
            title: 'ImageDetails',
            route: ImageDetailClass.id,
            icon: Icons.image,
          ),
        ],
        selectedRoute: HomeClass.id,
        onSelected: (item) {
          currentScreen(item);
        },
      ),
      body: SafeArea(
        child: _selectedScreen,
      ),
    );
  }
}
