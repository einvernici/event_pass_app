import 'package:flutter/material.dart';
import 'package:flutter_application_1/evento/event_detail_page.dart';
import 'package:flutter_application_1/evento/event.dart';
import 'package:flutter_application_1/evento/create_event_page.dart';
import 'package:flutter_application_1/provider/bookmarked_events_provider.dart';
import 'package:flutter_application_1/provider/event_provider.dart';
import 'package:flutter_application_1/widgets/navigation_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    final eventos = eventProvider.listaEventos;
    final bookmarkedEventsProvider =
        Provider.of<BookmarkedEventosProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed de Eventos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateEventPage()),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: eventos.length,
        itemBuilder: (context, index) {
          final evento = eventos[index];
          final isBookmarked =
              bookmarkedEventsProvider.bookmarkedEvents.contains(evento);

          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventDetailPage(evento: evento),
                ),
              );
            },
            title: EventoTile(event: evento),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: isBookmarked ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    if (isBookmarked) {
                      bookmarkedEventsProvider.removeBookmarkedList(evento);
                    } else {
                      bookmarkedEventsProvider.addToBookmarkedList(evento);
                    }
                  },
                ),
                // Mostra botão de deletar só para eventos criados (id numérico)
                if (int.tryParse(evento.id) != null)
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("Remover Evento"),
                          content: const Text("Tem certeza que deseja remover este evento?"),
                          actions: [
                            TextButton(
                              child: const Text("Cancelar"),
                              onPressed: () => Navigator.pop(context),
                            ),
                            TextButton(
                              child: const Text("Remover", style: TextStyle(color: Colors.red)),
                              onPressed: () {
                                Provider.of<EventProvider>(context, listen: false)
                                    .removeEvent(evento.id);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
