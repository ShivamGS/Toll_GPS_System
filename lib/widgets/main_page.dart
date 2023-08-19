import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shivam_app/map/var.dart';
import 'package:shivam_app/widgets/history.dart';

class MainPage extends StatefulWidget {
  MainPage(this.servicestatus, this.lat, this.long, this.j, this.distance);

  final bool servicestatus;

  final dynamic lat;
  final dynamic long;
  final dynamic j;
  final String distance;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  add_money() {
    paisa = paisa + 100;
    Fluttertoast.showToast(
        msg: '100 Rs Added',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.blue,
        textColor: Colors.black);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        // menu bar
        Positioned(
          top: height * 0.05,
          left: width * 0.05,
          // height: 20,
          child: Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "D:/flutter projects/shivam_app/lib/images/menu.png"))),
          ),
        ),

        // Name of user
        Positioned(
          top: height * 0.052,
          left: width * 0.34,
          // height: 20,
          child: Container(
            child: Column(
              children: const [
                Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Text("Good Evening", style: TextStyle(fontSize: 15)),
                ),
                Text(
                  "Shivam",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),

        // Avatar of user
        // Positioned(
        //   top: height * 0.065,
        //   right: width * 0.05,
        //   // height: 20,
        //   child: Container(
        //       height: 40,
        //       width: 200,
        //       child: CircleAvatar(
        //         backgroundImage: Image,
        //       )),
        // ),

        // Main screen
        Positioned(
          top: height * 0.15,
          left: width * 0.05,
          child: Container(
            height: 300,
            width: 270,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 21, 21, 21),
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0),
                  blurRadius: 2.0,
                  spreadRadius: 0.05,
                  offset: Offset(1.0, 1.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("You are near to :",
                      style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 229, 229, 229))),
                  Text(
                    "${widget.j}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "latitude",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${widget.lat}",
                    style: TextStyle(color: Colors.blue),
                  ),
                  const Divider(
                    indent: 0,
                    endIndent: 160,
                    color: Colors.white,
                  ),
                  const Text(
                    "longitude",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${widget.long}",
                    style: TextStyle(color: Colors.blue),
                  ),
                  const Divider(
                    indent: 0,
                    endIndent: 160,
                    color: Colors.white,
                  ),
                  const Text(
                    "Distance from Toll",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${widget.distance.substring(0)} Km",
                    style: TextStyle(color: Colors.blue),
                  ),
                  const Divider(
                    indent: 0,
                    endIndent: 160,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),

        // Balance
        Positioned(
          top: height * 0.51,
          left: width * 0.05,
          right: width * 0.05,
          // height: 20,
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Card(
              elevation: 20,
              shadowColor: Colors.black,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                // height: 40
                // width: 340,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Current Balance:",
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 3, left: 5, bottom: 5),
                            child: Text(
                              "Rs $paisa",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 60, right: 8),
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: add_money,
                              icon: Icon(Icons.add_circle_rounded),
                              iconSize: 50,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 2, bottom: 5),
                              child: Text("Add 100 Rs"),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),

        // Trasnsaction History
        Positioned(
          top: height * 0.65,
          left: width * 0.05,
          right: width * 0.05,
          child: Container(
              height: 40,
              width: 40,
              child: const Text(
                "Transaction",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
        ),

        Positioned(
            top: height * 0.7,
            left: width * 0.05,
            right: width * 0.05,
            bottom: 0,
            child: Container(height: 100, width: 100, child: history())),
      ],
    );
  }
}

// You are near to : ${widget.j} at a distance of ${widget.distance.substring(0)} Km
// const Image(
//                       image: AssetImage(
//                           "D:/flutter projects/shivam_app/lib/images/plus.png"),
//                     ))






               