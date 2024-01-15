import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keda/presentation/screens/form_screen.dart';
import 'package:keda/presentation/screens/screens.dart';

// GoRouter configuration
class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({super.key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(1.5, 0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.ease),
                ),
              ),
              child: child,
            );
          },
        );
}

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: ReservationTimeScreen(),
        );
      },
    ),
    GoRoute(
      path: '/date',
      pageBuilder: (context, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: ReservationDateScreen(),
        );
      },
    ),
    GoRoute(
      path: '/window',
      pageBuilder: (context, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: ReservationWindowScreen(),
        );
      },
    ),
    GoRoute(
      path: '/forms',
      pageBuilder: (context, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: FormScreen(),
        );
      },
    ),
  ],
);
