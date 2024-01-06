import 'package:flutter/material.dart';

class AppIndicatorBlueScopeNews extends StatelessWidget {
  const AppIndicatorBlueScopeNews({
    Key? key,
    this.color = Colors.blue,
    this.strokeWidth = 2.5,
    this.radius = 24,
  }) : super(key: key);
  final Color? color;
  final double strokeWidth;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: radius,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
