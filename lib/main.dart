import 'package:crud_operations/utils/app.dart';
import 'package:crud_operations/utils/colorr.dart';
import 'package:crud_operations/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_function/widget/keyboard/keyboard_dismiss.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismiss(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: App.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colorr.primary,
            background: Colorr.white,
            primary: Colorr.primary),
        useMaterial3: true,
      ),
      routes: Routes.routes(),
      initialRoute: Routes.root,
    ));
  }
}
