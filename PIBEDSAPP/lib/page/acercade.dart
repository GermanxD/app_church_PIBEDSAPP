import 'package:flutter/material.dart';
import 'package:selectable_navigation_drawer_example/widget/navigation_drawer_widget.dart';

class AcercadePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Acerca de'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(50, 55, 205, 1),
        ),
      );
}
