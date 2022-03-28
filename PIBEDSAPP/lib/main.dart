import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:selectable_navigation_drawer_example/model/navigation_item.dart';
import 'package:selectable_navigation_drawer_example/page/listscreencg.dart';
import 'package:selectable_navigation_drawer_example/page/home.dart';
import 'package:selectable_navigation_drawer_example/page/header_page.dart';
import 'package:selectable_navigation_drawer_example/page/acercade.dart';
import 'package:selectable_navigation_drawer_example/page/listscreencch.dart';
import 'package:selectable_navigation_drawer_example/provider/navigation_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Navigation Drawer';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: MainPage(),
        ),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;

    switch (navigationItem) {
      case NavigationItem.header:
        return HeaderPage();
      case NavigationItem.home:
        return Home();
      case NavigationItem.corariogrande:
        return ListScreenCG();
      case NavigationItem.corariochico:
        return ListScreenCCH();
      case NavigationItem.acercade:
        return AcercadePage();
    }
  }
}
