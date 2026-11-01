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
      title: 'Tangail Cadet Academy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E2A7F)),
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
      ),
      home: const DeleteAccountPage(),
    );
  }
}
