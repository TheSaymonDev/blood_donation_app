import 'package:flutter/material.dart';


class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.25, size.height *0.50, size.width * 0.50, size.height *0.75);

    path.quadraticBezierTo(size.width * 0.75, size.height * 1, size.width, size.height * 0.50);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}