import 'package:flutter/material.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: LoginScreen())
    );
  }
}
