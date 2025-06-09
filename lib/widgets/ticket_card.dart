import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  final String eventName;
  final String ticketType;
  final String date;
  final String time;
  final String location;

  const TicketCard({
    super.key,
    required this.eventName,
    required this.ticketType,
    required this.date,
    required this.time,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              eventName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Tipo: $ticketType',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Data: $date às $time',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Local: $location',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Image.asset(
                'assets/barcode_placeholder.png', 
                height: 50,
              ),
            ),
            const SizedBox(height: 8.0),
            const Center(
              child: Text(
                'Ticket ID: #123456789',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}