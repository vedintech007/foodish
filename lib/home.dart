import 'package:flutter/material.dart';
import 'package:ved_foodish/cards/card1.dart';
import 'package:ved_foodish/cards/card2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;
  static List<Widget> pages = <Widget>[
    Card1(),
    Card2(),
    Container(
      color: Colors.green,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'VED Foodish',
        style: Theme.of(context).textTheme.headline6,
      )),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: "Card",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: "Card 2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: "Card 3",
          ),
        ],
      ),
    );
  }
}
