import 'package:flutter/material.dart';
import 'package:global_news/pages/home.dart';
import 'package:global_news/pages/person.dart';
import 'package:global_news/pages/search.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int _index = 0;
  List<Widget> widgetLists = [
    HomePage(),
    SearchPage(),
    PersonPage(),
    
  ];
  Widget _newWidget = HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _newWidget,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (value) {
            setState(() {
              _index = value;
              _newWidget = widgetLists[value];
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
          ]),
    );
  }
}
