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
            ListTile(
              trailing: const Hero(
                // this must be equal to the other tag
                tag: 'tag-1',
                child: Icon(Icons.person),
              ),
              onTap: () => Navigator.pushNamed(context, '/hero_animation'),
              title: const Text('Go to Hero Animation'),
            ),
            ListTile(
              title: const Text('Basic Hero Animation'),
              onTap: () =>
                  Navigator.pushNamed(context, '/basic_hero_animation'),
            ),
          ],
        ),
      ),
    );
  }
}
