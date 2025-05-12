
import 'package:flutter/material.dart';

class AppCustomLoading extends StatelessWidget {
  final Color  color;
  const AppCustomLoading({super.key, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: Center(
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}