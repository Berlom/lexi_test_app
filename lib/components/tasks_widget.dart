// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../models/event_data_source_model.dart';
import '../vm/event_provider_model.dart';
import '../views/event_viewing_page_view.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({Key? key}) : super(key: key);

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final selectedEvents = provider.eventsOfSelectedDate;
    if (selectedEvents.isEmpty) {
      return Center(
        child: Text(
          'pas dévénements trouvée',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      );
    }
    return
        // SfCalendarTheme(
        //  data: SfCalendarThemeData(
        //brightness: Brightness.dark, backgroundColor: Colors.grey
        //   ),
        SfCalendar(
      view: CalendarView.timelineDay,
      dataSource: EventDataSource(provider.events),
      initialDisplayDate: provider.selectedDate,
      appointmentBuilder: appointmentBuilder,
      headerHeight: 0,
      todayHighlightColor: Colors.black,
      selectionDecoration: BoxDecoration(color: Colors.transparent),
      onTap: (details) {
        if (details.appointments == null) return;
        final event = details.appointments!.first;
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EventViewingPage(event: event),
        ));
      },
    );
  }

  Widget appointmentBuilder(
      BuildContext context, CalendarAppointmentDetails details) {
    final event = details.appointments.first;
    return Container(
        width: details.bounds.width,
        height: details.bounds.height,
        decoration: BoxDecoration(
            color: event.backgroundColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            event.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
