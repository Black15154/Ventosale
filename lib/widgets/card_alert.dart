import 'package:flutter/material.dart';
import 'package:ventosales/screen/catalogue.dart';
import 'package:ventosales/utils/app_colors.dart';

class CardAlert extends StatelessWidget {
  final Color coloricon;
  final String fisrttext;
  final String secondtext;
  final double widht;
  final double height;
  final IconData? iconData2;
  final IconData? iconData1;

  const CardAlert({
    super.key,
    required this.coloricon,
    required this.fisrttext,
    required this.secondtext,
    required this.widht,
    required this.height,
    this.iconData2,
    this.iconData1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        width: widht,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.bgSurface3,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border(left: BorderSide(color: coloricon, width: 4)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(iconData1, color: coloricon),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentGeometry.topStart,
                    child: Text(
                      fisrttext,
                      style: TextStyle(
                        color: AppColors.blanc,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.topStart,
                    child: Text(
                      secondtext,
                      style: TextStyle(
                        color: AppColors.bleu300Opacite60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(flex: 5),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Catalogue()),
                ),
                child: Icon(
                  /* Icons.arrow_forward_ios */ iconData2,
                  color: coloricon,
                  size: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
