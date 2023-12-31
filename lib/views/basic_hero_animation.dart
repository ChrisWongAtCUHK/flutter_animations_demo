// [Standard hero animation code](https://docs.flutter.dev/ui/animations/hero-animations#standard-hero-animation-code)
import 'package:flutter/material.dart';

class BasicHeroAnimationScreen extends StatelessWidget {
  const BasicHeroAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Flippers Page'),
                    ),
                    body: Hero(
                      tag: 'flippers',
                      child: Image.asset(
                        'images/flippers-alpha.png',
                      ),
                    ),
                  );
                },
              ),
            );
          },
          // Main route
          child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.topLeft,
            // Use background color to emphasize that it's a new route.
            color: Colors.lightBlueAccent,
            child: Hero(
              tag: 'flippers',
              child: SizedBox(
                width: 100,
                child: Image.asset(
                  'images/flippers-alpha.png',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
