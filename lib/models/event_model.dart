import 'dart:ui';

class Event {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;
  final bool isAllDay;
  Event(
      {required this.title,
      required this.backgroundColor,
      required this.description,
      required this.from,
      required this.isAllDay,
      required this.to});
}
