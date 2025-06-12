import 'package:flutter/material.dart';
import 'package:flutter_application_1/evento/event.dart';

class ConfirmedEventosProvider with ChangeNotifier {
  final List<Evento> _confirmedEvents = [];

  List<Evento> get confirmedEvents => _confirmedEvents;

  void addToConfirmedList(Evento evento) {
    if (!isConfirmed(evento)) {
      _confirmedEvents.add(evento);
      notifyListeners();
    }
  }

  void removeFromConfirmedList(Evento evento) {
    _confirmedEvents.removeWhere((e) => e.id == evento.id);
    notifyListeners();
  }

  bool isConfirmed(Evento evento) {
    return _confirmedEvents.any((e) => e.id == evento.id);
  }
}
