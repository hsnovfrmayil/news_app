import 'package:flutter/material.dart';

class PageRoute extends StatefulWidget {
  const PageRoute({super.key});

  @override
  State<PageRoute> createState() => _PersonPageState();
}

class _PersonPageState extends State<PageRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Image.network(
            "https://img.traveltriangle.com/blog/wp-content/uploads/2019/01/Mountains-In-New-Zealand-Cover.jpg",
            height: MediaQuery.of(context).size.height / 3,
          ),
          SizedBox(
            height: 100,
          ),
          Text(
            "Turistlerin en cox diqqetini ceken yerlerin adi aciqlandi",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
