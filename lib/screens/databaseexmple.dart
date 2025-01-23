import 'package:flutter/material.dart';
import '../database_helper.dart';

class TicketGeneratorScreen extends StatefulWidget {
  const TicketGeneratorScreen({super.key});

  @override
  State<TicketGeneratorScreen> createState() => _TicketGeneratorScreenState();
}

class _TicketGeneratorScreenState extends State<TicketGeneratorScreen> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> tickets = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  void addTicket() async {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _titleController.text.isNotEmpty &&
        _dateController.text.isNotEmpty) {
      await dbHelper.insertTicket(
        _nameController.text,
        _emailController.text,
        _titleController.text,
        _dateController.text,
      );
      _nameController.clear();
      _emailController.clear();
      _titleController.clear();
      _dateController.clear();
      loadTickets();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, llena todos los campos')),
      );
    }
  }

  void loadTickets() async {
    tickets = await dbHelper.getTickets();
    setState(() {});
  }

  void deleteTicket(int id) async {
    await dbHelper.deleteTicket(id);
    loadTickets();
  }

  @override
  void initState() {
    super.initState();
    loadTickets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generador de Boletos"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Correo Electrónico',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Título del Boleto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: 'Fecha del Evento',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: addTicket,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text("Generar Boleto"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  final ticket = tickets[index];
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(ticket['title']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nombre: ${ticket['name']}"),
                          Text("Correo: ${ticket['email']}"),
                          Text("Fecha: ${ticket['date']}"),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteTicket(ticket['id']),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
