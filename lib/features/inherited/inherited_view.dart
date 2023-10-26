import 'package:experiences/features/inherited/fake_inherited_widget.dart';
import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() {
    print('ParentWidget.createState');
    return _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget> {
  int count = 0;

  @override
  void initState() {
    print('ParentWidget.initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('ParentWidget.didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ParentWidget oldWidget) {
    print('ParentWidget.didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('ParentWidget.dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('ParentWidget.build');
    return Inherited1(
      count: count,
      child: Scaffold(
        body: const Center(
          child: ChildWidget(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('PRESSED BUTTON');
            setState(() {
              count++;
            });
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  const ChildWidget({super.key});

  @override
  State<ChildWidget> createState() {
    print('ChildWidget.createState');
    return _ChildWidgetState();
  }
}

class _ChildWidgetState extends State<ChildWidget> {
  @override
  void initState() {
    print('ChildWidget.initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('ChildWidget.didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ChildWidget oldWidget) {
    print('ChildWidget.didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('ChildWidget.dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('ChildWidget.build');
    return Text(
      Inherited1.of(context).count.toString(),
      style: TextStyle(fontSize: 32),
    );
  }
}

class Inherited1 extends FakeInheritedWidget {
  const Inherited1({
    super.key,
    required this.count,
    required super.child,
  });

  final int count;

  static Inherited1 of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType()!;

  @override
  bool updateShouldNotify(Inherited1 oldWidget) {
    final updateShouldNotify = oldWidget.count != count;
    print('InheritedWidget.updateShouldNotify:$updateShouldNotify');
    return updateShouldNotify;
  }
}
