import 'package:flutter/material.dart';
import 'package:transport/src/routes/route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(89, 50, 234, 1),
        ),
        useMaterial3: true,
      ),
      routerConfig: goRouter,
    );
  }
}
