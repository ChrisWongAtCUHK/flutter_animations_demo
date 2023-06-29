import 'package:flutter/material.dart';
import 'package:flutter_animations_demo/views/home.dart';
import 'package:flutter_animations_demo/views/rocket.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/rocket': (context) => const RocketScreen(),
      },
    );
  }
}
