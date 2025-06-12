import 'package:flutter/material.dart';
import 'package:flutter_application_1/evento/event.dart';
import 'package:flutter_application_1/evento/event_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/provider/event_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    var eventProvider = Provider.of<EventProvider>(context);

    var filteredEvents = searchTerm.isEmpty
        ? []
        : eventProvider.listaEventos.where((evento) {
            final query = searchTerm.toLowerCase();
            return evento.title.toLowerCase().contains(query) ||
                evento.description.toLowerCase().contains(query) ||
                evento.startDate.toLowerCase().contains(query) ||
                evento.startTime.toLowerCase().contains(query) ||
                evento.location.toLowerCase().contains(query);
          }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Buscar Eventos')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Digite para buscar eventos',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchTerm = value;
                });
              },
            ),
          ),
          Expanded(
            child: searchTerm.isEmpty
                ? const Center(child: Text('Digite algo para buscar eventos'))
                : filteredEvents.isEmpty
                    ? const Center(child: Text('Nenhum evento encontrado'))
                    : ListView.builder(
                        itemCount: filteredEvents.length,
                        itemBuilder: (context, index) {
                          final evento = filteredEvents[index];
                          return ListTile(
                            title: EventoTile(event: evento),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EventDetailPage(evento: evento),
                                ),
                              );
                            },
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
