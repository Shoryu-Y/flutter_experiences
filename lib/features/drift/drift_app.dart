import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DriftApp extends StatefulWidget {
  const DriftApp({super.key});

  @override
  State<DriftApp> createState() => _DriftAppState();
}

class _DriftAppState extends State<DriftApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CupertinoButton(
            child: Text('cupertino'),
            onPressed: () {},
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('material'),
          ),
        ],
      ),
    );
  }
}
