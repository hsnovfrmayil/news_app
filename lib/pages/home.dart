import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_news/pages/person.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String buttonText = "Show News";
  List _items = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assets/sample.json");
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.black,
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: "News",
                  ),
                  Tab(
                    text: "Sport",
                  ),
                  Tab(
                    text: "Weather",
                  ),
                ],
              )),
          body: TabBarView(children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: (() {
                        readJson();
                        buttonText = "News";
                      }),
                      child: Text(
                        buttonText,
                      )),
                  for (int i = 0; i < _items.length; i++) ...{
                    gestureDedectorwithContainer(
                        src: _items[i]["src"], text: _items[i]["text"])
                  },
                ],
              ),
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
          ])),
    );
  }

  GestureDetector gestureDedectorwithContainer(
      {required String src, required String text, double height = 200}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => PageRoute())));
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Image.network(
                src,
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
