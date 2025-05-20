import 'package:flutter/material.dart';
//import 'package:flutter_application_1/widgets/image.dart';

class EventView extends StatelessWidget {
  const EventView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        width: 500,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/genericimage.jpg')
          )
        ),
      child: ListTile(
        title: Text(
          'Evento 1',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black)
          ),
        subtitle: Text(
          '25.05.25',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
        )
      ),
    );
  }
}