import 'package:flutter/material.dart';
import 'package:test_flutter/utils/get_screen_size.dart';
import 'package:test_flutter/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceInfo.updateDeviceInfo();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teste Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
        useMaterial3: true,
      ),
      initialRoute: Routes.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
