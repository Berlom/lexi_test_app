import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../utils.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [
    Event(
      title: 'Learn Flutter',
      description: 'Watch Flutter YouTube Videos',
      from: DateTime.now(),
      to: DateTime.now().add(const Duration(hours: 2)),
      backgroundColor: Colors.red,
      isAllDay: false,
    ),
    Event(
      title: 'Meeting With Daniel',
      description: 'Tea Time! 🍵',
      from: DateTime.now().subtract(const Duration(hours: 6)),
      to: DateTime.now().add(const Duration(hours: 4)),
      backgroundColor: Colors.red,
      isAllDay: false,
    )
  ];

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<Event> get eventsOfSelectedDate => _events.where(
        (event) {
          final selected = Utils.removeTime(_selectedDate);
          final from = Utils.removeTime(event.from);
          final to = Utils.removeTime(event.to);

          return from.isAtSameMomentAs(selectedDate) ||
              to.isAtSameMomentAs(selectedDate) ||
              (selected.isAfter(from) && selected.isBefore(to));
        },
      ).toList();

  List<Event> get events => _events;

  void addEvent(Event event) {
    _events.add(event);

    notifyListeners();
  }

  void deleteEvent(Event event) {
    _events.remove(event);

    notifyListeners();
  }

  void editEvent(Event newEvent, Event oldEvent) {
    final index = _events.indexOf(oldEvent);
    _events[index] = newEvent;

    notifyListeners();
  }
}


// class EventProvider extends ChangeNotifier {
//   final List<Event> _events = [];

//   List<Event> get events => _events;
//   DateTime _selectedDate = DateTime.now();
//   DateTime get selectedDate => _selectedDate;
//   void setDate(DateTime date) => _selectedDate = date;
//   // List<Event> get eventsOfSelectedDate => _events;
//   List<Event> get eventsOfSelectedDate => _events.where(
//         (event) {
//           final selected = Utils.removeTime(_selectedDate);
//           final from = Utils.removeTime(event.from);
//           final to = Utils.removeTime(event.to);

//           return from.isAtSameMomentAs(selectedDate) ||
//               to.isAtSameMomentAs(selectedDate) ||
//               (selected.isAfter(from) && selected.isBefore(to));
//         },
//       ).toList();

//   void addEvent(Event event) {
//     _events.add(event);
//     notifyListeners();
//   }

//   void deleteEvent(Event event) {
//     _events.remove(event);
//   }

//   void editEvent(Event newEvent, Event oldEvent) {
//     final index = _events.indexOf(oldEvent);
//     _events[index] = newEvent;
//     notifyListeners();
//   }
// }
