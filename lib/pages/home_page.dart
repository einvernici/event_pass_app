import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/event_list.dart';
import 'package:flutter_application_1/widgets/navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello'),
          backgroundColor: Colors.blue,
          ),
        body: EventListView(),
        bottomNavigationBar: CustomNavigationBar(),
        ),
      );
  }
}