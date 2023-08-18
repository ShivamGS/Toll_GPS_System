import 'package:flutter/material.dart';
import 'package:shivam_app/map/var.dart';

class history extends StatefulWidget {
  const history({Key? key}) : super(key: key);

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // controller: _controller,
        itemCount: Transaction.length,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.only(right: 5, bottom: 20),
            child: Card(
              elevation: 20,
              shadowColor: Colors.black,
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 8),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Image(
                                  color: Colors.white,
                                  image: AssetImage(
                                      "D:/flutter projects/shivam_app/lib/images/car.png")),
                              iconSize: 50,
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${Transaction[i][0]}",
                          style: const TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 3, left: 5, bottom: 5),
                          child: Text(
                            "${Transaction[i][1]}",
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: Container(
                      child: Text(
                        "${Transaction[i][2]}  Rs",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
