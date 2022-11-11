import 'package:flutter/material.dart';

Widget bottomNavBarWidget(
        {required int selectedIndex, required Function(int)? onTap}) =>
    BottomNavigationBar(
      onTap: onTap,
      currentIndex: selectedIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Shop'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
