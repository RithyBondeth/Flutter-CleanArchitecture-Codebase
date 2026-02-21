import 'package:flutter/material.dart';
import 'package:flutter_cleanarchitecture_codebase/routes/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
      ),
      routerConfig: appRouter.config(),
    );
  }
}
