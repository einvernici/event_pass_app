import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/event_list.dart';
import 'package:flutter_application_1/widgets/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Check Makers',
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