import 'package:flutter/material.dart';
import 'package:selectable_navigation_drawer_example/page/details/detailsCG.dart';
import 'package:selectable_navigation_drawer_example/model/cantoscglist.dart';
import 'package:selectable_navigation_drawer_example/widget/navigation_drawer_widget.dart';

class ListScreenCG extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Color.fromRGBO(50, 55, 205, 1),
          title:
              Text('Cantos Corario Grande', style: TextStyle(fontSize: 25.0)),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: LetraCGSearch());
              },
              icon: Icon(Icons.search),
            )
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: cantosListCG.length,
          itemBuilder: (context, index) {
            LetraCG letraCG = cantosListCG[index];
            return Card(
              child: ListTile(
                title: Text(letraCG.titleCG),
                //subtitle: Text(letra.numero.toString()),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsCG(letraCG)));
                },
              ),
            );
          }));
}

class LetraCGSearch extends SearchDelegate<LetraCG> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.navigate_before),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty
        ? cantosListCG
        : cantosListCG
            .where((element) =>
                element.titleCG.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return mylist.isEmpty
        ? Center(
            child: Text(
            'Not Results Found...',
            style: TextStyle(fontSize: 20),
          ))
        : ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              final LetraCG letracg = mylist[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsCG(letracg)));
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(letracg.titleCG),
                    //Text(listitem.letraCG),
                    Divider()
                  ],
                ),
              );
            });
  }
}
