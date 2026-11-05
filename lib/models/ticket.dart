class Ticket {
  final int id;
  final String serviceType;
  final String number;
  final DateTime timestamp;

  Ticket({
    required this.id,
    required this.serviceType,
    required this.number,
    required this.timestamp,
  });
}