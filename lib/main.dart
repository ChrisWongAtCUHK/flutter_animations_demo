import 'package:flutter/material.dart';
import 'package:flutter_animations_demo/views/animatedcontainer_demo.dart';
import 'package:flutter_animations_demo/views/home.dart';
import 'package:flutter_animations_demo/views/rocket.dart';
import 'package:flutter_animations_demo/views/error_shake.dart';
import 'package:flutter_animations_demo/views/hero_animation.dart';
import 'package:flutter_animations_demo/views/basic_hero_animation.dart';

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
        '/error_shake': (context) => const ErrorShakeScreen(),
        '/animatedcontainer_demo': (context) => const AnimatedContainerScreen(),
        '/hero_animation': (context) => const HeroAnimationScreen(),
        '/basic_hero_animation': (context) => const BasicHeroAnimationScreen(),
      },
    );
  }
}
