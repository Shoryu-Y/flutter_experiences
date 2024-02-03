import 'dart:isolate';

import 'package:experiences/features/commons/timer.dart';
import 'package:flutter/material.dart';

class IsolateApp extends StatefulWidget {
  const IsolateApp({super.key});

  @override
  State<IsolateApp> createState() => _IsolateAppState();
}

class _IsolateAppState extends State<IsolateApp> {
  int elapsedMicroseconds = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Elasped micro seconds: $elapsedMicroseconds'),
            Text(
              'frame(): ${(elapsedMicroseconds / (1000000 / 60)).toStringAsFixed(3)}',
            ),
            TextButton(
              onPressed: () async {
                final elapsed = await measure(() async {
                  await Isolate.run(() {
                  });
                });
                setState(() {
                  elapsedMicroseconds = elapsed;
                });
              },
              child: const Text('isolate'),
            ),
            TextButton(
              onPressed: () async {
                final elapsed = await measure(() async {
                });
                setState(() {
                  elapsedMicroseconds = elapsed;
                });
              },
              child: const Text('concurrency'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
