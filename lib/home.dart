import 'package:anchaal/models/user_location.dart';
import 'package:anchaal/service/locator.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: 148,
          height: 148,
          child: FloatingActionButton(
            onPressed: () {
              UserLocation currentLocation;
              LocationService().getLocation().then((location) {
                currentLocation = location;
                print('Latitude: ${currentLocation.latitude}');
                print('Longitude: ${currentLocation.longitude}');
                print('Altitude: ${currentLocation.altitude}');
                print('Speed: ${currentLocation.speed}');
              });
              showToast(context);
            },
            child: Icon(
              Icons.warning_amber,
              size: 63.0,
            ),
          ),
        ),
      ),
    );
  }
}

void showToast(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(SnackBar(
    content: const Text('Don\'t panic, help is arriving the next moment !'),
  ));
}
