import 'package:flutter/material.dart';
import 'package:selectable_navigation_drawer_example/model/cantoscchlist.dart';
import 'package:selectable_navigation_drawer_example/page/details/details.dart';
import 'package:selectable_navigation_drawer_example/widget/navigation_drawer_widget.dart';

class ListScreenCCH extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Color.fromRGBO(50, 55, 205, 1),
          title: Text('Cantos Corario Chico', style: TextStyle(fontSize: 25.0)),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: LetraSearch());
              },
              icon: Icon(Icons.search),
            )
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: cantosList.length,
          itemBuilder: (context, index) {
            Letra letra = cantosList[index];
            return Card(
              child: ListTile(
                title: Text(letra.title),
                //subtitle: Text(letra.numero.toString()),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Details(letra)));
                },
              ),
            );
          }));
}

class LetraSearch extends SearchDelegate<Letra> {
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
        ? cantosList
        : cantosList
            .where((element) =>
                element.title.toLowerCase().contains(query.toLowerCase()))
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
              final Letra letra = mylist[index];
              return ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Details(letra)));
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(letra.title),
                    //Text(listitem.letra),
                    Divider()
                  ],
                ),
              );
            });
  }
}
