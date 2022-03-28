import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selectable_navigation_drawer_example/data/user.dart';
import 'package:selectable_navigation_drawer_example/model/navigation_item.dart';
import 'package:selectable_navigation_drawer_example/provider/navigation_provider.dart';

class NavigationDrawerWidget extends StatelessWidget {
  static final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
          color: Color.fromRGBO(50, 55, 205, 1),
          child: ListView(
            children: <Widget>[
              buildHeader(
                context,
                image: image,
                name: name,
                email: email,
              ),
              Container(
                padding: padding,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    buildMenuItem(
                      context,
                      item: NavigationItem.home,
                      text: 'Home',
                      icon: Icons.home,
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: NavigationItem.corariogrande,
                      text: 'Corario Grande',
                      icon: Icons.book,
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: NavigationItem.corariochico,
                      text: 'Corario Chico',
                      icon: Icons.book,
                    ),
                    const SizedBox(height: 24),
                    Divider(color: Colors.white70),
                    const SizedBox(height: 24),
                    buildMenuItem(
                      context,
                      item: NavigationItem.acercade,
                      text: 'Acerca de',
                      icon: Icons.info,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem(
    BuildContext context, {
    required NavigationItem item,
    required String text,
    required IconData icon,
  }) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = item == currentItem;

    final color = isSelected ? Colors.cyanAccent : Colors.white;

    return Material(
      color: Colors.transparent,
      child: ListTile(
        selected: isSelected,
        selectedTileColor: Colors.white24,
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color, fontSize: 16)),
        onTap: () => selectItem(context, item),
      ),
    );
  }

  void selectItem(BuildContext context, NavigationItem item) {
    final provider = Provider.of<NavigationProvider>(context, listen: false);
    provider.setNavigationItem(item);
  }

  Widget buildHeader(
    BuildContext context, {
    required String image,
    required String name,
    required String email,
  }) =>
      Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromRGBO(50, 55, 205, 1),
                    backgroundImage: AssetImage(image)),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      );
}
