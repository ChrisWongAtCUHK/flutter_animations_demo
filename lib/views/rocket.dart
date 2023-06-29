import 'package:flutter/material.dart';

class RocketScreen extends StatefulWidget {
  const RocketScreen({super.key});

  @override
  State<RocketScreen> createState() => _RocketScreenState();
}

class _RocketScreenState extends State<RocketScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '🚀',
              style: theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            Text(
              '0',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontSize: 70,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'm/s',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
