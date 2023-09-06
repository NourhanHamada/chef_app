import 'package:flutter/material.dart';

class LoginSecondCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 320);
    var firstStart = Offset(size.width - 400, size.height - 100);
    var firstEnd = Offset(size.width, size.height - 155);
    path.quadraticBezierTo(
      firstStart.dx,
      firstStart.dy,
      firstEnd.dx,
      firstEnd.dy,
    );

    var secondStart = Offset(size.width, size.height);
    var secondEnd = Offset(size.width, size.height);
    path.quadraticBezierTo(
      secondStart.dx,
      secondStart.dy,
      secondEnd.dx,
      secondEnd.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
