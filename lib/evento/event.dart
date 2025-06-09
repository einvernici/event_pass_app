import 'package:flutter/material.dart';
import 'package:flutter_application_1/evento/event_detail_page.dart';
import 'package:flutter_application_1/provider/bookmarked_events_provider.dart';
import 'package:flutter_application_1/provider/event_provider.dart';
import 'package:flutter_application_1/widgets/navigation_bar.dart';
import 'package:provider/provider.dart';

class Evento {
   const Evento({
    required this.id,
    required this.title,
    required this.description, 
    required this.startTime, 
    required this.startDate,
    required this.location});

  final String id;
  final String title;
  final String description;
  final String startTime;
  final String startDate;
  final String location;

}

class EventoTile extends StatelessWidget {
  final Evento event;
  
  const EventoTile({super.key, required this.event});

 @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          SizedBox(height: 100, child: Image.asset('assets/genericimage.jpg')), //substituir pela thumbnail do evento - aprender upload de imagens
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    event.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                  Expanded(
                    child: Text(
                      event.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12.0, color: Colors.black54),
                    ),
                  ),
                  Text(event.startDate,style: const TextStyle(fontSize: 12.0, color: Colors.black87),),
                  Text(event.startTime, style: const TextStyle(fontSize: 12.0, color: Colors.black87),),
                  Text(event.location, style: const TextStyle(fontSize: 12.0, color: Colors.black54),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 

class FeedEventos extends StatefulWidget {
  const FeedEventos({super.key});

  @override
  State<FeedEventos> createState() => _FeedEventosState();
}

class _FeedEventosState extends State<FeedEventos> {
  
  @override
  Widget build(BuildContext context) {
    var eventProvider = Provider.of<EventProvider>(context);
    var eventos = eventProvider.listaEventos;


    var bookmarkedEventsProvider = Provider.of<BookmarkedEventosProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Feed de Eventos')),
      body: ListView.builder(
        itemCount: eventos.length,
        itemBuilder: (context, index) {
          Evento evento = eventos[index];

          final isBookmarked = bookmarkedEventsProvider.bookmarkedEvents.contains(evento);

          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventDetailPage(evento: eventos[index]),
                ),
              );
            },
            title: EventoTile(event: evento),
            trailing: IconButton(
              onPressed: () {
              
                if (isBookmarked) {
                  bookmarkedEventsProvider.removeBookmarkedList(evento);
                } else {
                  bookmarkedEventsProvider.addToBookmarkedList(evento);
                }
              },
              icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border),
              color: isBookmarked ? Colors.blue : Colors.grey, 
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

