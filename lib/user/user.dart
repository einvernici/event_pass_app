import 'package:flutter/material.dart';
import 'package:flutter_application_1/evento/event.dart';
import 'package:flutter_application_1/provider/bookmarked_events_provider.dart';
import 'package:provider/provider.dart';

class User extends StatelessWidget{
  List<Evento> _myBookmarked = [];
  //List<Evento> _myGoingTo = []; //criar lista de eventos confirmados pelo usuário "ingresso comprado"

  get myBookmarked => _myBookmarked;
  //get myGoingTo => _myGoingTo;

  User({super.key,});

  @override
  Widget build(BuildContext context) {
    var bookmarkedEventsProvider = Provider.of<BookmarkedEventosProvider>(context);
    _myBookmarked = bookmarkedEventsProvider.bookmarkedEvents;
    
    return Scaffold(
      appBar: AppBar(title: Text('Seus Eventos')),
      body: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _myBookmarked.length, 
            itemBuilder: (context, index){
             Evento bookmarkedEvent = _myBookmarked[index];
             return SizedBox(height: 200, width: 200, child: EventoTile(event: bookmarkedEvent));}));}}