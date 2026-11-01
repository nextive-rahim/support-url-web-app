import 'package:flutter/material.dart';

import 'delete_account_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shikkhangon',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0054A6)),
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
      ),
      home: const DeleteAccountPage(),
    );
  }
}
