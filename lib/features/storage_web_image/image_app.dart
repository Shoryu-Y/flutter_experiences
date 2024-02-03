import 'package:flutter/material.dart';

class ImageApp extends StatefulWidget {
  const ImageApp({super.key});

  @override
  State<ImageApp> createState() => _ImageAppState();
}

class _ImageAppState extends State<ImageApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network('https://firebasestorage.googleapis.com/v0/b/logimile-app-c5672.appspot.com/o/news%2Fimages%2F0014001936825760-web.jpg?alt=media&token=d9f04029-44f0-46c1-a4fc-8498e95d90c3'),
      ),
    );
  }
}
