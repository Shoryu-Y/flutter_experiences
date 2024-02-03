import 'package:experiences/features/example/second_page.dart';
import 'package:flutter/material.dart';

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('1st Page'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            // MaterialPageRoute(
            //   builder: (context) => SecondPage(),
            // ),
            PageRouteBuilder(
              pageBuilder: (context, _, __) => const SecondPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          );
        },
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
