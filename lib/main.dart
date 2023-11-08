import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notification_wrapper/notification_wrapper.dart';
import 'package:notification_wrapper_test/app/app.bottomsheets.dart';
import 'package:notification_wrapper_test/app/app.dialogs.dart';
import 'package:notification_wrapper_test/app/app.locator.dart';
import 'package:notification_wrapper_test/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NotificationWrapperWidget(
      onNotificationReceived: (value) {},
      onGetToken: (value) {},
      child: MaterialApp(
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [StackedService.routeObserver],
      ),
    );
  }
}
