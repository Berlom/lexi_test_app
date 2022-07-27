// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../components/custom_appbar_view.dart';
import '../models/event_data_source_model.dart';
import '../vm/event_provider_model.dart';
import '../vm/calendar_view_model.dart';
import 'tasks_widget.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return Scaffold(
      appBar: CustomAppBar(
        backgroudColor: Colors.lightBlue,
        title: 'Agenda',
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 700,
                  child: SfCalendar(
                    dataSource: EventDataSource(events),
                    view: CalendarView.month,
                    initialSelectedDate: DateTime.now(),
                    //cellBorderColor: Colors.transparent,
                    onLongPress: (details) {
                      final provider =
                          Provider.of<EventProvider>(context, listen: false);
                      provider.setDate(details.date!);
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => TasksWidget(),
                      );
                    },
                  ),
                ),
              ])),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => EventEditingPage())),
        child: Icon(Icons.add, color: Colors.white),
      ), // FloatingActionButton
    );
  }
}
