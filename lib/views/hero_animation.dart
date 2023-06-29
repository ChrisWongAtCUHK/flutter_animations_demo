// [Flutter Hero Widget](https://www.youtube.com/watch?v=166ZnmJC6N0)
import 'package:flutter/material.dart';

class HeroAnimationScreen extends StatelessWidget {
  const HeroAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Animation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              // this must be equal to the other tag
              tag: 'tag-1',
              child: Container(
                color: Colors.orangeAccent,
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
