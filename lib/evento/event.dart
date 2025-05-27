import 'package:flutter/material.dart';
import 'package:flutter_application_1/evento/event_detail_page.dart';
import 'package:flutter_application_1/widgets/navigation_bar.dart';

class Evento extends StatelessWidget {
   const Evento({
    super.key,  
    required this.title,
    required this.description, 
    required this.startTime, 
    required this.startDate,
    required this.location});

  final String title;
  final String description;
  final String startTime;
  final String startDate;
  final String location;

 
 @override
  Widget build(BuildContext context)
   {
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
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                  Expanded(
                    child: Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12.0, color: Colors.black54),
                    ),
                  ),
                  Text(
                    '$startDate - $startTime',
                    style: const TextStyle(fontSize: 12.0, color: Colors.black87),
                  ),
                  Text(location, style: const TextStyle(fontSize: 12.0, color: Colors.black54)),
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
  State<FeedEventos> createState() => _FeedEventos();
}

class _FeedEventos extends State<FeedEventos> {
  final List<Evento> listaBookmarked = []; //lista de eventos salvos pelo usuário

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feed de Eventos')),
      body: ListView.builder(
        itemCount: listaEventos.length,
        itemBuilder: (context, index) {
          final isBookmarked = listaBookmarked.contains(listaEventos[index]);
          return ListTile(
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    EventDetailPage(evento: listaEventos[index])));
            },
            title: Evento(
              title: listaEventos[index].title, 
              description: listaEventos[index].description, 
              startTime: listaEventos[index].startTime, 
              startDate: listaEventos[index].startDate, 
              location: listaEventos[index].location,
            ),
            trailing: IconButton(
          onPressed: (){
            setState(() {
              if (isBookmarked){
                listaBookmarked.remove(listaEventos[index]);
              }
              else{
                listaBookmarked.add(listaEventos[index]);
              }});
            },
          icon: isBookmarked
          ? const Icon(Icons.bookmark) : const Icon(Icons.bookmark_border_outlined),
          ),
          );
        },
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

List<Evento> listaEventos = [
  Evento( title: 'Evento 1',
          description: 'Festa de inauguração da Empresa X.',
          startDate: '28 de Setembro',
          startTime: '16:00h',
          location: 'Rua Carlos Gomes, 761'),
  Evento( title: 'Evento 2',
          description: 'Hip-hop hits 2000 - artista 1, artista 2, artista 3, artista 4, artista 5.',
          startDate: '16 de Setembro',
          startTime: '22:00h',
          location: 'Casa NTX'),
  Evento( title: 'Evento 3',
          description: 'Tributo Miles Davis',
          startDate: '8 de Setembro',
          startTime: '21:00h',
          location: 'Ocidente'),  
  Evento( title: 'Evento 4',
          description: 'Tributo Miles Davis',
          startDate: '8 de Setembro',
          startTime: '21:00h',
          location: 'Ocidente'),                
];

