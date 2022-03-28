import 'package:flutter/material.dart';
//import 'package:selectable_navigation_drawer_example/data/user.dart';
import 'package:selectable_navigation_drawer_example/widget/navigation_drawer_widget.dart';

class HeaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('PIBEDS'),
          centerTitle: true,
        ),
        body: Image.asset(
          "assets/pibedslogopng.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      );
}
