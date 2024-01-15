import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keda/presentation/providers/reservation_provider.dart';
import 'package:keda/presentation/widgets/custom_buttons.dart';
import 'package:keda/presentation/widgets/layout_screen.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ReservationWindowScreen extends StatelessWidget {
  const ReservationWindowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reservation = context.watch<ReservationProvider>();
    final String minutos = reservation.minutesReservation.toString();
    final fechaActual = DateTime.now();
    final List<DateTime> ventanasHorarias = [];

    for (int i = 0; i < 24; i++) {
      // Crear un nuevo DateTime con la hora actual y la hora iterada
      DateTime hora = DateTime(
        fechaActual.year,
        fechaActual.month,
        fechaActual.day,
        i,
      );
      // Agregar la hora a la lista
      ventanasHorarias.add(hora);
    }
    return LayoutCustom(contenido: [
      Expanded(
        flex: 1,
        child: Column(
          children: [
            const Text('Nombre de usuario'),
            const SizedBox(
              height: 20,
            ),
            Text('Reservar $minutos minutos el ${reservation.dayReservation} '),
          ],
        ),
      ),
      Expanded(
        flex: 2,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...ventanasHorarias.map((e) => CustomButton(
                    texto: " ${DateFormat.Hm().format(e)}",
                    customTab: () {
                      context.push(
                        '/forms',
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    ]);
  }
}
