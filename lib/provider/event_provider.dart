import 'package:flutter/material.dart';
import 'package:flutter_application_1/evento/event.dart';

class EventProvider extends ChangeNotifier{

  final List<Evento> _listaEventos = [
    Evento( id: '1',
            title: 'Evento 1',
            description: 'Festa de inauguração da Empresa X.',
            startDate: '28 de Setembro',
            startTime: '16:00h',
            location: 'Rua Carlos Gomes, 761'),
    Evento( id: '2',
            title: 'Evento 2',
            description: 'Hip-hop hits 2000 - artista 1, artista 2, artista 3, artista 4, artista 5.',
            startDate: '16 de Setembro',
            startTime: '22:00h',
            location: 'Casa NTX'),
    Evento( id: '3',
            title: 'Evento 3',
            description: 'Tributo Miles Davis',
            startDate: '8 de Setembro',
            startTime: '21:00h',
            location: 'Ocidente'),
  ];

  List<Evento> get listaEventos => _listaEventos;

}