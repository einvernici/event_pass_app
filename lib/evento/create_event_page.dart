import 'package:flutter/material.dart';
import 'package:flutter_application_1/evento/event.dart';
import 'package:flutter_application_1/provider/event_provider.dart';
import 'package:provider/provider.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _locationController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newEvent = Evento(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        description: _descriptionController.text,
        startDate: _dateController.text,
        startTime: _timeController.text,
        location: _locationController.text,
      );

      Provider.of<EventProvider>(context, listen: false).addEvent(newEvent);

      Navigator.pop(context); // Volta pra HomePage
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Evento')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (value) => value!.isEmpty ? 'Insira um título' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Descrição'),
              ),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(labelText: 'Data'),
              ),
              TextFormField(
                controller: _timeController,
                decoration: const InputDecoration(labelText: 'Hora'),
              ),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Local'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Criar Evento'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
