import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const UniventApp());
}

class UniventApp extends StatelessWidget {
  const UniventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Univent',
      debugShowCheckedModeBanner:
          false, // Menghilangkan pita "DEBUG" di pojok kanan atas
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFE2B6E),
          primary: const Color(0xFFFE2B6E),
          secondary: const Color(0xFF232A3B),
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const UniventHomePage(),
    );
  }
}
