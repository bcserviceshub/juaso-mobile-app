import 'package:flutter/material.dart';

class DiagonalBackground extends StatelessWidget {
  final double height;
  final Color color;
  final double leftHeightPercentage;
  final double rightHeightPercentage;
  final List<double>? gradientStops;
  final List<double>? opacityStops;

  const DiagonalBackground({
    super.key,
    required this.height,
    required this.color,
    this.leftHeightPercentage = 0.75,
    this.rightHeightPercentage = 0.98,
    this.gradientStops = const [0.0, 0.5, 1.0],
    this.opacityStops = const [1.0, 0.7, 0.3],
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _DiagonalClipper(
        leftHeightPercentage: leftHeightPercentage,
        rightHeightPercentage: rightHeightPercentage,
      ),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              color,
              color.withOpacity(opacityStops![1]),
              color.withOpacity(opacityStops![2]),
            ],
            stops: gradientStops,
          ),
        ),
      ),
    );
  }
}

class _DiagonalClipper extends CustomClipper<Path> {
  final double leftHeightPercentage;
  final double rightHeightPercentage;

  _DiagonalClipper({
    required this.leftHeightPercentage,
    required this.rightHeightPercentage,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * leftHeightPercentage);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * ((leftHeightPercentage + rightHeightPercentage) / 2),
      size.width,
      size.height * rightHeightPercentage,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
} 