import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keda/presentation/providers/reservation_provider.dart';
import 'package:keda/presentation/widgets/custom_buttons.dart';
import 'package:keda/presentation/widgets/layout_screen.dart';
import 'package:provider/provider.dart';

class ReservationTimeScreen extends StatelessWidget {
  const ReservationTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final reservation = context.watch<ReservationProvider>();
    final List<double> ventanasHorarias = [5, 10, 15, 30, 45, 60];
    return LayoutCustom(
      contenido: [
        Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  'Hola',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Bienvenido a mi página de reservaciones. Siga las instrucciones para agregar un evento a mi agenda.',
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ...ventanasHorarias.map((e) => CustomButton(
                      texto: "${e.toString()} Minutos",
                      customTab: () {
                        reservation.actualizarDatos(
                            minutesReservation: e.toDouble());
                        context.push('/date');
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
