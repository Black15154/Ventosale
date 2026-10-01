import 'package:flutter/material.dart';

class BoutonDefault extends StatelessWidget {
  final IconData? icons;
  final String text;
  final Color? colortext;
  final Color? colorBackground;
  final Color? colorBorder;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double sizeText;
  final double borderRadius;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsetsGeometry padding;

  const BoutonDefault({
    super.key,
    this.icons,
    required this.text,
    this.colorBackground,
    this.colorBorder,
    this.onPressed,
    this.width,
    this.height,
    this.sizeText = 20,
    this.borderRadius = 15,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.padding = EdgeInsets.zero,
    this.colortext,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 390,
      height: height ?? 70,
      child: FilledButton(
        onPressed: onPressed ?? () {},
        style: FilledButton.styleFrom(
          backgroundColor: colorBackground ?? const Color(0xFFE50914),
          foregroundColor: colortext ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          side: BorderSide(
            color: colorBorder ?? Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: sizeText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (icons != null) ...[
                const SizedBox(width: 8),
                Icon(icons, size: 25),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
