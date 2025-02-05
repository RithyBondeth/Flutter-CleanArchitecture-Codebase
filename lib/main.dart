import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ie_portal_agent_mobile/app/app.dart';

void main() async {
  // Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Error handling
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };

  // Run app inside error boundary
  runZonedGuarded(
    () async {
      // Initialize services if needed

      runApp(const App());
    },
    (error, stackTrace) {
      // Handle any errors that occur in the app
      debugPrint('Error from runZonedGuarded: $error');
    },
  );
}
