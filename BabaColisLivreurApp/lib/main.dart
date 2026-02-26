import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const BabaColisLivreurApp());
}

class BabaColisLivreurApp extends StatelessWidget {
  const BabaColisLivreurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BabaColis Livreurs",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginScreen(),
    );
  }
}
