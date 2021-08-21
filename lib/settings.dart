import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          ListTile(
            leading: Icon(Icons.my_location),
            title: Text("Location Access"),
            subtitle: Text("Tap to grant access"),
            onTap: () {
              Location().hasPermission().then((permission) {
                if (permission == PermissionStatus.denied)
                  Location().requestPermission();
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline_rounded),
            title: Text("About"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
