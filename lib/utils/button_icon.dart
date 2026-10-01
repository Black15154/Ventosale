import 'package:flutter/material.dart';
import 'package:ventosales/utils/app_colors.dart';

class ButtonIcon extends StatelessWidget {
  final IconData icons;
  final Color? iconColors;
  final String? text;
  final double? sizeicons;
  final Color? colorBackground;
  final Color colorBorder;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final MainAxisAlignment mainAxisAlignment;

  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const ButtonIcon({
    super.key,
    required this.icons,
    this.colorBackground,
    required this.colorBorder,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius = 7,
    this.padding = EdgeInsets.zero,
    this.sizeicons,
    required this.mainAxisAlignment,
    this.text,
    this.iconColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colorBorder, width: 2),
        color: colorBackground, //const Color.fromARGB(255, 102, 101, 101),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      height: height ?? 70,
      width: width ?? 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                icons /* Icons.g_mobiledata */,
                size: sizeicons,
                color: iconColors,
              ),
              Text(
                text!,
                style: TextStyle(
                  color: AppColors.cobaltLabelBadge,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
