import 'package:flutter/material.dart';
import 'package:flutter_application_1/evento/event.dart';

class BookmarkedEventosProvider extends ChangeNotifier{
  // ignore: prefer_final_fields
  List<Evento> _bookmarkedEvents = [];

  List<Evento> get bookmarkedEvents => _bookmarkedEvents;

  void addToBookmarkedList(Evento evento){
    bookmarkedEvents.add(evento);
    print("evento adicionado ao bookmark");
    notifyListeners();
  }

  void removeBookmarkedList(Evento evento){
    bookmarkedEvents.remove(evento);
    notifyListeners();
  }


}