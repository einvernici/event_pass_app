import 'package:flutter/material.dart';
import 'package:flutter_application_1/evento/event.dart';
import 'package:flutter_application_1/widgets/button.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({
    super.key,
    required this.evento});

    final Evento evento;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(evento.title)
      ),
      body: Column(children:[
        Text(evento.description),
        Text(evento.startDate),
        Text(evento.startTime),
        Text(evento.location),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(text: 'Partiu!', onTap: () {}), //criar a função para adicionar o evento a lista GOINGTO do usuário
        )
        ]
      )
    );
  }
}