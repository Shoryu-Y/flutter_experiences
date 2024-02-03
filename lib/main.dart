import 'package:experiences/features/custom_transition/turn_page_app.dart';
import 'package:experiences/features/drift/drift_app.dart';
import 'package:experiences/features/example/example_app.dart';
import 'package:experiences/features/inherited/example.dart';
import 'package:experiences/features/inherited/inherited_view.dart';
import 'package:experiences/features/isolate/isolate_app.dart';
import 'package:experiences/features/storage_web_image/image_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IsolateApp(),
    );
  }
}
