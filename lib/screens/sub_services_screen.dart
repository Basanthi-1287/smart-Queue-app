import 'package:flutter/material.dart';
import '../providers/queue_provider.dart';
import '../models/ticket.dart';
import 'queue_detail_screen.dart';

class SubServicesScreen extends StatelessWidget {
  final String serviceName;

  const SubServicesScreen({super.key, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    final List<String> subServices = _getSubServicesFor(serviceName);

    return Scaffold(
      appBar: AppBar(
        title: Text('$serviceName Sub-Services'),
      ),
      body: ListView.builder(
        itemCount: subServices.length,
        itemBuilder: (context, index) {
          final subService = subServices[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(subService, style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QueueDetailScreen(
                      department: serviceName,
                      subService: subService,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  List<String> _getSubServicesFor(String department) {
    switch (department) {
      case 'College':
        return ['Fee Payment', 'Document Verification', 'Exam Cell', 'Library'];
      case 'Hospital':
        return ['General Checkup', 'Emergency', 'Pharmacy', 'Lab Testing'];
      case 'Bank':
        return ['Cash Deposit', 'Account Opening', 'Loan Inquiry', 'Customer Support'];
      case 'Airport':
        return ['Check-in', 'Baggage Drop', 'Security Clearance', 'Customs'];
      default:
        return ['General Service'];
    }
  }
}