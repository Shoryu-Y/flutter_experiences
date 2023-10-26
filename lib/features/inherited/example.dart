import 'package:flutter/material.dart';

class Parent extends StatefulWidget {
  const Parent({super.key});

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return CountInherited(
      count: count,
      child: Scaffold(
        body: const Center(
          child: Child(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
            count++;
          }),
        ),
      ),
    );
  }
}

class CountInherited extends InheritedWidget {
  const CountInherited({
    super.key,
    required this.count,
    required super.child,
  });

  final int count;

  static CountInherited of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType()!;

  @override
  bool updateShouldNotify(CountInherited oldWidget) => oldWidget.count != count;
}

class Child extends StatefulWidget {
  const Child({super.key});

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    final counterInherited =
        context.dependOnInheritedWidgetOfExactType()! as CountInherited;
    return Text('${counterInherited.count}');
  }
}
