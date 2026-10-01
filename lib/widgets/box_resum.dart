import 'package:flutter/material.dart';
import 'package:ventosales/utils/app_colors.dart';

class Boxresum extends StatelessWidget {
  final String firsttext;
  final String secondtext;
  final String thirdtext;
  final Color? colorfirsttext;
  final Color? colorsecondtext;
  final Color? colorthirdtext;

  const Boxresum({
    super.key,
    required this.firsttext,
    required this.secondtext,
    required this.thirdtext,
    this.colorfirsttext,
    this.colorsecondtext,
    this.colorthirdtext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.surfaceCarte,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: AppColors.bleu300Opacite20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                firsttext,
                style: TextStyle(
                  color: colorfirsttext,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                secondtext,
                style: TextStyle(
                  color: colorsecondtext,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              thirdtext,
              style: TextStyle(
                color: colorthirdtext,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
