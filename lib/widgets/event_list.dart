import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/event_view.dart';

class EventListView extends StatelessWidget {
  const EventListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [EventView(), EventView(), EventView()],
    );
  }
}