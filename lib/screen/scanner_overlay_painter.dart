import 'package:flutter/material.dart';

class ScannerOverlayPainter extends CustomPainter {
  final Color borderColor;
  final double borderLength; // Longueur des branches des coins
  final double borderWidth;
  final double borderRadius;

  ScannerOverlayPainter({
    this.borderColor = const Color(0xFF4A80F6),
    this.borderLength = 25.0,
    this.borderWidth = 3.5,
    this.borderRadius = 16.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double w = size.width;
    final double h = size.height;
    final double r = borderRadius;
    final double l = borderLength;

    final Path path = Path();

    // 1. Coin Haut-Gauche
    path.moveTo(0, r + l);
    path.lineTo(0, r);
    path.quadraticBezierTo(0, 0, r, 0);
    path.lineTo(r + l, 0);

    // 2. Coin Haut-Droit
    path.moveTo(w - r - l, 0);
    path.lineTo(w - r, 0);
    path.quadraticBezierTo(w, 0, w, r);
    path.lineTo(w, r + l);

    // 3. Coin Bas-Droit
    path.moveTo(w, h - r - l);
    path.lineTo(w, h - r);
    path.quadraticBezierTo(w, h, w - r, h);
    path.lineTo(w - r - l, h);

    // 4. Coin Bas-Gauche
    path.moveTo(r + l, h);
    path.lineTo(r, h);
    path.quadraticBezierTo(0, h, 0, h - r);
    path.lineTo(0, h - r - l);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
