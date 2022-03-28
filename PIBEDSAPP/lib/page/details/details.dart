import 'package:flutter/material.dart';
import 'package:selectable_navigation_drawer_example/model/cantoscchlist.dart';

class Details extends StatelessWidget {
  final Letra letra;

  Details(this.letra);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(50, 55, 205, 1),
        title: Text(letra.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  letra.letra,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
