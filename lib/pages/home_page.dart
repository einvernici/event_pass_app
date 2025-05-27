import 'package:flutter/material.dart';
import 'package:flutter_application_1/evento/event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Home Page',
      home: FeedEventos()
      );
  }
}