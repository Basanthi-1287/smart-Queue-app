import 'package:flutter/foundation.dart';
import '../models/ticket.dart';

class QueueProvider extends ChangeNotifier {
  final List<Ticket> _activeTickets = [];

  List<Ticket> get activeTickets => _activeTickets;

  void addTicket(Ticket ticket) {
    _activeTickets.add(ticket);
    notifyListeners();
  }

  void removeTicket(String id) {
    _activeTickets.removeWhere((ticket) => ticket.id == id);
    notifyListeners();
  }
}