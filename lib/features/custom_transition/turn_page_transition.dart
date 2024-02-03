import 'package:flutter/material.dart';

class CustomTransition extends StatelessWidget {
  const CustomTransition({
    super.key,
    required this.animation,
    required this.child,
  });

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(animation: animation),
      child: child,
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  const MyCustomClipper({required this.animation});

  final Animation<double> animation;

  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    final animationProgress = animation.value;

    final path = Path()
      ..lineTo(width, 0) // 画面左上から右上へ
      ..lineTo(width, height * animationProgress) // 画面右上から右下へ
      ..lineTo(0, height * animationProgress) // 画面右下から左下へ
      ..close();

    return path;
  }

  @override
  bool shouldReclip(MyCustomClipper oldClipper) {
    return true;
  }
}
