import 'package:anchaal/splash.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anchaal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        // our swatch shall compute all the right colors for the app
        // you can even define each color individually like primaryColor...so on
      ),
      home: Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent and used by the build method of the
  // State. Fields in a Widget subclass are always marked "final".
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  final List<Widget> _children = [Home(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: _children[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index, // to highlight only the tapped button
        selectedIconTheme: IconThemeData(color: Colors.red.shade400),
        onTap: (int index) => {
          setState(() => _index = index),
          // switch the screen to what user selects
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
