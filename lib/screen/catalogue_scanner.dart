import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ventosales/screen/scanner_overlay_painter.dart';
import 'package:ventosales/utils/app_colors.dart';

class CatalogueScanner extends StatefulWidget {
  const CatalogueScanner({super.key});

  @override
  State<CatalogueScanner> createState() => _CatalogueScannerState();
}

class _CatalogueScannerState extends State<CatalogueScanner> {
  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondApp,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.bleu300Opacite60,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Scanner QR / Code-barres',
                    style: TextStyle(
                      color: AppColors.blanc,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),

            Widgetmobillecscanner(),
            Butonnsimulerscan(),
          ],
        ),
      ),
    );
  }
}

class Widgetmobillecscanner extends StatelessWidget {
  const Widgetmobillecscanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: SizedBox(
            height: 250,
            width: 250,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(5),
              child: MobileScanner(
                controller: MobileScannerController(
                  detectionSpeed: DetectionSpeed.normal,
                  returnImage: true,
                ),
                onDetect: (capture) {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Butonnsimulerscan extends StatelessWidget {
  const Butonnsimulerscan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF773CEA), Color(0xFF3353CB)],
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                'Simuler un scan',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
