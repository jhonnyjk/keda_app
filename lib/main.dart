import 'package:flutter/material.dart';
import 'package:keda/config/router/app_router.dart';
import 'package:keda/config/theme/app_theme.dart';
import 'package:keda/presentation/providers/reservation_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ReservationProvider(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getAppTheme(),
        title: 'Material App',
      ),
    );
  }
}
