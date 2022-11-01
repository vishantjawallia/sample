// import 'package:cache_image/cache_image.dart';
// ignore_for_file: use_key_in_widget_constructors

import '../config/Palettes.dart';
import '../screens/home/cart_page.dart';
import '../screens/home/home_page.dart';
import '../screens/home/order_page.dart';
import '../screens/home/profile_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  int selectedIndex = 0;
  Home(this.selectedIndex);

  @override
  State<Home> createState() => _HomeState(selectedIndex);
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  _HomeState(this.selectedIndex);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    OrderPage(),
    CartPage(),
    ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Palettes.darkGrey,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_saver_off_rounded),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Palettes.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
