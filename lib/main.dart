import 'package:flutter/material.dart';
import 'package:flutter_cleanarchitecture_codebase/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      routerConfig: appRouter.config(),
    );
  }
}
