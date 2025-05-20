import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar ({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          items: [BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
                  BottomNavigationBarItem(icon: Icon(Icons.face), label: 'profile'),
                  ]
    );
  }
}