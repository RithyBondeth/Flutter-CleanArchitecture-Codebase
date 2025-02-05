import 'package:flutter/material.dart';
import 'package:ie_portal_agent_mobile/config/themes/app_themes.dart';
import 'package:ie_portal_agent_mobile/presentation/pages/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}
