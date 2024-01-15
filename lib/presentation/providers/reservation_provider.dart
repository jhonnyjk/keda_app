import 'package:flutter/material.dart';

class ReservationProvider extends ChangeNotifier {
  double _minutesReservation = 30;
  DateTime _dayReservation = DateTime.now();
  DateTime _initialReservation = DateTime.now();

  double get minutesReservation => _minutesReservation;
  DateTime get dayReservation => _dayReservation;
  DateTime get initialReservation => _initialReservation;

  void actualizarDatos({
    double? minutesReservation,
    DateTime? dayReservation,
    DateTime? initialReservation,
  }) {
    _minutesReservation = minutesReservation ?? _minutesReservation;
    _dayReservation = dayReservation ?? _dayReservation;
    _initialReservation = initialReservation ?? _initialReservation;

    notifyListeners();
  }
}
