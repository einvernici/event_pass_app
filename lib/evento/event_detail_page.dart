import 'package:flutter/material.dart';
import 'package:flutter_application_1/evento/event.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/provider/confirmed_events_provider.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key, required this.evento});

  final Evento evento;

  void _mostrarFormasPagamento(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.credit_card),
                title: const Text('Cartão de Crédito'),
                onTap: () {
                  _confirmarCompra(context);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.pix),
                title: const Text('PIX'),
                onTap: () {
                  _confirmarCompra(context);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
    );
  }

  void _confirmarCompra(BuildContext context) {
    final confirmedProvider = Provider.of<ConfirmedEventosProvider>(
      context,
      listen: false,
    );
    confirmedProvider.addToConfirmedList(evento);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ingresso comprado com sucesso!')),
    );
  }

  void _cancelarCompra(BuildContext context) {
    final confirmedProvider = Provider.of<ConfirmedEventosProvider>(
      context,
      listen: false,
    );
    confirmedProvider.removeFromConfirmedList(evento);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Ingresso cancelado.')));
  }

  @override
  Widget build(BuildContext context) {
    final confirmedProvider = Provider.of<ConfirmedEventosProvider>(context);
    final isConfirmed = confirmedProvider.isConfirmed(evento);

    return Scaffold(
      appBar: AppBar(title: Text(evento.title)),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                evento.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text('Data: ${evento.startDate}', textAlign: TextAlign.center),
              Text('Hora: ${evento.startTime}', textAlign: TextAlign.center),
              Text('Local: ${evento.location}', textAlign: TextAlign.center),
              const SizedBox(height: 24),
              CustomButton(
                text: isConfirmed ? 'Cancelar Ingresso' : 'Comprar Ingresso',
                onTap:
                    () =>
                        isConfirmed
                            ? _cancelarCompra(context)
                            : _mostrarFormasPagamento(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
