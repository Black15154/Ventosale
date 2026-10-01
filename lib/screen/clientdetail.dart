import 'package:flutter/material.dart';
import 'package:ventosales/screen/clients.dart';
import 'package:ventosales/utils/app_colors.dart';

class Clientdetail extends StatelessWidget {
  final Cardresumvente cardresumvente;

  const Clientdetail({super.key, required this.cardresumvente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondApp,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                        cardresumvente.nomtitrecard,
                        style: TextStyle(
                          color: AppColors.blanc,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  BoxdeviseBCDB2B(
                    colorcontainer: cardresumvente.colorcontainer,
                    textcontainersecond: cardresumvente.textcontainersecond,
                    colortextcontainer: cardresumvente.colortextcontainer,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child:
                  cardresumvente.colorcontainer == AppColors.cobaltFondIconeLogo
                  ? Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColors.bleu300Opacite20,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentGeometry.topStart,
                              child: Text('ENTREPRISE'),
                            ),
                            Text(
                              cardresumvente.producttitrecard,
                              style: TextStyle(
                                color: AppColors.texteBlanc,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : null,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.bleu300Opacite20,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentGeometry.topStart,
                        child: Text('E-MAIL'),
                      ),
                      Text(
                        's.marchand@mf.fr',
                        style: TextStyle(
                          color: AppColors.texteBlanc,
                          fontSize: 16,
                        ),
                      ),
                      Divider(color: AppColors.bleu300Opacite20),
                      Align(
                        alignment: AlignmentGeometry.topStart,
                        child: Text('TÉLÉPHONE'),
                      ),
                      Text(
                        '+33 6 12 34 56 78',
                        style: TextStyle(
                          color: AppColors.texteBlanc,
                          fontSize: 16,
                        ),
                      ),
                      Divider(color: AppColors.bleu300Opacite20),
                      Align(
                        alignment: AlignmentGeometry.topStart,
                        child: Text('VILLE'),
                      ),
                      Text(
                        'Lyon',
                        style: TextStyle(
                          color: AppColors.texteBlanc,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.bleu300Opacite20,
                  border: Border.all(
                    color: cardresumvente.isactif
                        ? AppColors.amberBordure30
                        : AppColors.bgSurface3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentGeometry.topStart,
                        child: Text('ENCOURS FINANCIER'),
                      ),
                      Text(
                        cardresumvente.prix,
                        style: TextStyle(
                          color: AppColors.texteBlanc,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        cardresumvente.isactif ? 'Montant du en cours' : '',
                        style: TextStyle(color: AppColors.alerte, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.bleu300Opacite20,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentGeometry.topStart,
                        child: Text('STATUT'),
                      ),
                      Align(
                        alignment: AlignmentGeometry.topStart,
                        child: Pointcolor(isactif: cardresumvente.isactif),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Bouttonclientdetail(
                  backgroundcolor: AppColors.primaire,
                  text: ' Nouvelle facture',
                  textcolor: AppColors.blanc,
                  bordercolor: AppColors.cobaltBordure15,
                ),
                Bouttonclientdetail(
                  backgroundcolor: AppColors.bleu300Opacite20,
                  text: ' Historique',
                  textcolor: AppColors.bleu300Opacite60,
                  bordercolor: AppColors.cobaltBordure15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Bouttonclientdetail extends StatelessWidget {
  final Color backgroundcolor;
  final String text;
  final Color textcolor;
  final Color bordercolor;

  const Bouttonclientdetail({
    super.key,
    required this.backgroundcolor,
    required this.text,
    required this.textcolor,
    required this.bordercolor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: 170,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: bordercolor),
          color: backgroundcolor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textcolor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
