import 'package:desafio_dev_mobile_sti3/presentation/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final Map<int, Color> colorSwatch = {
    50: const Color(0xFFE0F2F1),
    100: const Color(0xFFB2DFDB),
    200: const Color(0xFF80CBC4),
    300: const Color(0xFF4DB6AC),
    400: const Color(0xFF26A69A),
    500: const Color(0xFF009688),
    600: const Color(0xFF00897B),
    700: const Color(0xFF00796B),
    800: const Color(0xFF00695C),
    900: const Color(0xFF004D40),
  };

  late MaterialColor customMaterialColor;

  @override
  void initState() {
    super.initState();
    customMaterialColor = MaterialColor(0xFF014955, colorSwatch);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: customMaterialColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: AppBarTheme(
          backgroundColor: customMaterialColor,
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: customMaterialColor,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: customMaterialColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: customMaterialColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        useMaterial3: false,
      ),
      home: const HomeView(),
    );
  }
}
