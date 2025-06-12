import 'package:flutter/material.dart';
import 'package:flutter_application_1/evento/event.dart';
import 'package:flutter_application_1/provider/bookmarked_events_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/widgets/ticket_card.dart';
import 'package:flutter_application_1/pages/auth_screen.dart';
import 'package:flutter_application_1/provider/confirmed_events_provider.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  bool _isEditing = false;

  String _userName = 'Vitor Lautert';
  String _userEmail = 'vitor@example.com';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _nameController = TextEditingController(text: _userName);
    _emailController = TextEditingController(text: _userEmail);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _toggleEditMode() {
    setState(() {
      _isEditing = !_isEditing;
      if (!_isEditing) {
        _userName = _nameController.text;
        _userEmail = _emailController.text;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Perfil salvo com sucesso!')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var bookmarkedEventsProvider = Provider.of<BookmarkedEventosProvider>(
      context,
    );
    List<Evento> myBookmarkedEvents = bookmarkedEventsProvider.bookmarkedEvents;

    var confirmedEventsProvider = Provider.of<ConfirmedEventosProvider>(
      context,
    );
    List<Evento> myConfirmedEvents = confirmedEventsProvider.confirmedEvents;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: _toggleEditMode,
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthScreen()),
                  (Route<dynamic> route) => false,
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Sair', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 60, color: Colors.white),
                ),
                const SizedBox(height: 10),
                _isEditing
                    ? TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Nome'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    : Text(
                      _userName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                _isEditing
                    ? TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      keyboardType: TextInputType.emailAddress,
                    )
                    : Text(
                      _userEmail,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
              ],
            ),
          ),
          const Divider(),
          TabBar(
            controller: _tabController,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: const [
              Tab(text: 'Eventos Salvos', icon: Icon(Icons.bookmark)),
              Tab(
                text: 'Meus Ingressos',
                icon: Icon(Icons.confirmation_number),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                myBookmarkedEvents.isEmpty
                    ? const Center(
                      child: Text(
                        'Nenhum evento salvo ainda.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                    : ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: myBookmarkedEvents.length,
                      itemBuilder: (context, index) {
                        Evento event = myBookmarkedEvents[index];
                        return EventoTile(event: event);
                      },
                    ),
                myConfirmedEvents.isEmpty
                    ? const Center(
                      child: Text(
                        'Você ainda não comprou ingressos.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                    : ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: myConfirmedEvents.length,
                      itemBuilder: (context, index) {
                        Evento event = myConfirmedEvents[index];
                        return Column(
                          children: [
                            TicketCard(
                              eventName: event.title,
                              ticketType: 'Entrada Geral',
                              date: event.startDate,
                              time: event.startTime,
                              location: event.location,
                            ),
                            const SizedBox(height: 16.0),
                          ],
                        );
                      },
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
