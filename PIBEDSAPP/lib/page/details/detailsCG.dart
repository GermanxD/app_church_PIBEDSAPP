import 'package:flutter/material.dart';
import 'package:selectable_navigation_drawer_example/model/cantoscglist.dart';

class DetailsCG extends StatelessWidget {
  final LetraCG letraCG;

  DetailsCG(this.letraCG);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(50, 55, 205, 1),
        title: Text(letraCG.titleCG),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  letraCG.letraCG,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'RobotoBlack',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
