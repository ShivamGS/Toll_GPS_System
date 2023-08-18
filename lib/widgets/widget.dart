import 'package:flutter/material.dart';
import 'package:shivam_app/map/var.dart';

class Content extends StatefulWidget {
  Content(this.servicestatus, this.haspermission, this.lat, this.long, this.off,
      this.j, this.distance);

  final bool servicestatus;
  final bool haspermission;
  final bool off;
  final dynamic lat;
  final dynamic long;
  final dynamic j;
  final String distance;

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(50),
        child: Column(children: [
          Text(
            widget.servicestatus ? "GPS is Enabled" : "GPS is disabled.",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "latitude: ${widget.lat}",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "longitude: ${widget.long}",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Money: $paisa",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              widget.off
                  ? "Money Debited For : ${widget.j}"
                  : "You are near to : ${widget.j} at a distance of ${widget.distance.substring(0)} Km",
              style: const TextStyle(fontSize: 20, color: Colors.black)),
          SizedBox(
            height: 50,
          ),
        ]));
  }
}

class BodyBox extends StatelessWidget {
  const BodyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
