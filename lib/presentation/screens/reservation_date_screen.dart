import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keda/presentation/widgets/layout_screen.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:keda/presentation/providers/reservation_provider.dart';
import 'package:provider/provider.dart';

class ReservationDateScreen extends StatefulWidget {
  const ReservationDateScreen({super.key});

  @override
  State<ReservationDateScreen> createState() => _ReservationDateScreenState();
}

class _ReservationDateScreenState extends State<ReservationDateScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final reservation = context.watch<ReservationProvider>();
    final String minutos = reservation.minutesReservation.toString();

    return LayoutCustom(
      contenido: [
        Expanded(
            flex: 1,
            child: Column(
              children: [
                const Text('Nombre de usuario'),
                const SizedBox(
                  height: 20,
                ),
                Text('Tiempo reservado $minutos minutos el $_selectedDay'),
              ],
            )),
        Expanded(
          flex: 1,
          child: TableCalendar(
            calendarFormat: _calendarFormat,
            focusedDay: _focusedDay,
            firstDay: DateTime(2022, 1, 1),
            lastDay: DateTime(2030, 12, 31),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                reservation.actualizarDatos(dayReservation: selectedDay);
              });

              context.push('/window');
            },
          ),
        ),
      ],
    );
  }
}
