import 'package:flutter/material.dart';
import 'package:flutter_application_1/user/user.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar ({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          items: [BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
                  BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
                  BottomNavigationBarItem(icon: IconButton(
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => User()));}, 
                    icon: Icon(Icons.face)), label: 'profile'),
                  ]
    );
  }
}