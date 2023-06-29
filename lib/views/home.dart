import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Animations Demo')),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Rocket Demo'),
              onTap: () => Navigator.pushNamed(context, '/rocket'),
            ),
          ],
        ),
      ),
    );
  }
}
