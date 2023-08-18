import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

import 'dart:math';

import 'package:shivam_app/map/var.dart';
import 'package:shivam_app/widgets/main_page.dart';
import 'package:shivam_app/widgets/widget.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool off = false;
  int pos = 0;
  late double dis;
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  double long = 10, lat = 10;
  late StreamSubscription<Position> positionStream;
  late Timer timer;
  late Timer timer_dis;
  late Timer check_timer;
  bool fg = true;

  String distance = "0000";

  @override
  void initState() {
    checkGps();

    timer = Timer.periodic(
        Duration(milliseconds: 100), (Timer t1) => getLocation());

    check_timer = Timer.periodic(Duration(seconds: 2), (Timer t3) => go());

    super.initState();
  }

  payment(i) {
    if (paisa > 0) {
      paisa = paisa - 50;
    } else {
      Fluttertoast.showToast(
          msg: 'Insufficient Money',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.blue,
          textColor: Colors.black);
    }

    Transaction.add([destination[i], "Pune", 50]);
    // print(Transaction);
  }

  go() {
    for (int i = 0; i < loc.length; i++) {
      check(loc[i][0], loc[i][1], i);
    }
  }

  check(l, lo, i) {
    calculateDistance(lat, long, l, lo);
    if (flag[i] == 1) {
      if ((dis) < 0.1) {
        pos = i;
        var x = destination[i];
        // var distance = calculateDistance(lat, long, loc[i][0], loc[i][1]);
        // print("You are near $x at a distance of $distance");

        flag[i] = 0;
        payment(i);
        off = true;
        setState(() {});
        Fluttertoast.showToast(
            msg: 'Money debited',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.blue,
            textColor: Colors.black);

        Future.delayed(Duration(seconds: 30), () {
          flag[i] = 1;
        });
      }
    }
  }

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        setState(() {
          //refresh the UI
        });

        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
      //refresh the UI
    });
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    long = position.longitude;
    lat = position.latitude;

    setState(() {});

    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      long = position.longitude;
      lat = position.latitude;

      setState(() {
        //refresh UI on update
      });
    });
  }

  void calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    // if (dis < (12742 * asin(sqrt(a)))) {
    //   print(
    //     dis,
    //   );
    //   print(lat);
    //   print(long);
    //   dis = (12742 * asin(sqrt(a)));
    //   distance = (12742 * asin(sqrt(a))).toString();
    // }
    dis = (12742 * asin(sqrt(a)));
    // print(dis);
    distance = (12742 * asin(sqrt(a))).toString();
  }

  @override
  void dispose() {
    timer.cancel();
    timer_dis.cancel();
    check_timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: MainPage(servicestatus, lat, long, destination[pos], distance),
        // ElevatedButton(
        //     style: ButtonStyle(
        //         backgroundColor: MaterialStateProperty.all(Colors.blue)),
        //     onPressed: add_money,
        //     child: Container(
        //       child: const Text(
        //         "Add 100 Rs",
        //         style: TextStyle(color: Colors.black),
        //       ),
        //     ))
      ),
    );
  }
}
