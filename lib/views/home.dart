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
            ListTile(
              title: const Text('Error Shake Effect'),
              onTap: () => Navigator.pushNamed(context, '/error_shake'),
            ),
            ListTile(
              title: const Text('AnimatedContainer Demo'),
              onTap: () =>
                  Navigator.pushNamed(context, '/animatedcontainer_demo'),
            ),
          ],
        ),
      ),
    );
  }
}
