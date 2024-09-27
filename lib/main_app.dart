import 'package:desafio_dev_mobile_sti3/presentation/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.teal,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal),
          ),
        ),
        useMaterial3: false,
      ),
      home: const HomeView(),
    );
  }
}
