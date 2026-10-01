import 'package:flutter/material.dart';
import 'package:ventosales/utils/app_colors.dart';
import 'package:ventosales/utils/default_button.dart';

class PaiementValide extends StatefulWidget {
  const PaiementValide({super.key});

  @override
  State<PaiementValide> createState() => _PaiementValideState();
}

class _PaiementValideState extends State<PaiementValide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondApp,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.emeraude, width: 2),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.emeraude.withOpacity(0.15),
                      child: Icon(Icons.check, color: AppColors.emeraude),
                    ),
                  ),
                ),
              ),
              Text(
                'Paiement accepté',
                style: TextStyle(
                  color: AppColors.emeraude,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '617,40 \$',
                style: TextStyle(
                  color: AppColors.blanc,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'BTP Solutions - 08:48',
                  style: TextStyle(
                    color: AppColors.bgSurface3,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BoutonDefault(
                      width: 176,
                      height: 60,
                      text: 'Reçu par SMS',
                      borderRadius: 15,
                      colorBackground: AppColors.primaire,
                      colortext: AppColors.blanc,
                      sizeText: 15,
                    ),
                    BoutonDefault(
                      onPressed: () => Navigator.pop(context),
                      width: 176,
                      height: 60,
                      text: 'Nouvel enc.',
                      borderRadius: 15,
                      colorBackground: AppColors.bgSurface3,
                      colortext: AppColors.blanc,
                      colorBorder: AppColors.bleu300Opacite20,
                      sizeText: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
