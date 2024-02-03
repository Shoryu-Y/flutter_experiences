import 'package:experiences/features/custom_transition/turn_page_transition.dart';
import 'package:flutter/material.dart';

class CustomTransitionApp extends StatefulWidget {
  const CustomTransitionApp({super.key});

  @override
  State<CustomTransitionApp> createState() => _CustomTransitionAppState();
}

class _CustomTransitionAppState extends State<CustomTransitionApp>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Stack(
        children: [
          FirstPage(),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          // controller.animateTo(0.9);
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: const Duration(seconds: 1),
              pageBuilder: (context, animation, __) {
                return const NextPage();
              },
              transitionsBuilder: (_, animation, __, child) {
                return CustomTransition(
                  animation: animation,
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

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.lightBlueAccent,
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('text 1'),
            Text('text 2'),
            Text('text 3'),
          ],
        ),
      ),
    );
  }
}
