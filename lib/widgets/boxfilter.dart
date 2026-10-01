import 'package:flutter/material.dart';

class Boxfilter extends StatelessWidget {
  final String text;
  final Color textcolor;
  final Color colorcontainer;
  final double? _borderRadius;
  final double? _width;
  final double? _height;

  const Boxfilter({
    super.key,
    required this.text,
    required this.textcolor,
    required this.colorcontainer,
    this._borderRadius,
    this._width,
    this._height,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Container(
            height: _height ?? 30,
            width: _width ?? 70,
            decoration: BoxDecoration(
              color: colorcontainer,
              borderRadius: BorderRadius.all(
                Radius.circular(_borderRadius ?? 20),
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold, color: textcolor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
