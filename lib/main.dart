import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/bookmarked_events_provider.dart';
import 'package:flutter_application_1/provider/event_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/pages/auth_screen.dart';
import 'package:flutter_application_1/provider/confirmed_events_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EventProvider()),
        ChangeNotifierProvider(
          create: (context) => BookmarkedEventosProvider(),
        ),
        ChangeNotifierProvider(create: (_) => ConfirmedEventosProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Event Pass App',
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}
