import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/queue_provider.dart';
import '../models/ticket.dart';

class QueueDetailScreen extends StatelessWidget {
  final String department;
  final String subService;

  const QueueDetailScreen({
    super.key,
    required this.department,
    required this.subService,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$department Queue Ticket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      department.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subService,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const Divider(height: 32),
                    const Text(
                      'Your Token Number',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'A-104',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 150,
                      width: 150,
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(Icons.qr_code, size: 100, color: Colors.black87),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Estimated Wait Time: ~15 mins',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.check_circle),
                label: const Text('Confirm & Add to My Queues', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  final newTicket = Ticket(
                    id: int.parse(DateTime.now().millisecondsSinceEpoch.toString().substring(0, 9)),
                    serviceType: department,
                    number: 'A-104',
                    timestamp: DateTime.now(),
                  );

                  Provider.of<QueueProvider>(context, listen: false).addTicket(newTicket);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ticket successfully added to active queues!')),
                  );

                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}