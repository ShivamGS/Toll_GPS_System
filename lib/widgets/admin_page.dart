import 'package:flutter/material.dart';
import 'package:shivam_app/map/var.dart';

import 'custom_text_field.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            height: 100,
            width: width,
            // color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //   child: Text("Cumulative Toll"),
                // ),
                Padding(
                    padding: const EdgeInsets.only(top: 40, left: 20, right: 8),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Toll No.",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    )),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Divide_Line(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Car Type",
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3, left: 5, bottom: 5),
                        child: Text(
                          "Car No.",
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Divide_Line(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    child: Text(
                      "Amount",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Divide_Line(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    child: Text(
                      "Time",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: height - 220,
            width: width,
            child: ListView.builder(
                itemCount: Toll_Data.length,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 5, bottom: 20),
                    child: Card(
                      elevation: 20,
                      shadowColor: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(
                                      "${Toll_Data[i][0]}",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              )),
                          const Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Divide_Line(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${Toll_Data[i][3]}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 3, left: 5, bottom: 5),
                                  child: Text(
                                    "${Toll_Data[i][1]}",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Divide_Line(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Container(
                              child: Text(
                                "${Toll_Data[i][2]}  Rs",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Divide_Line(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              child: Text(
                                "${Toll_Data[i][4]}",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        )
      ],
    ));
  }
}
