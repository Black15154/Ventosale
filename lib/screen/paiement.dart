import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:ventosales/screen/paiement_valide.dart';
import 'package:ventosales/utils/app_colors.dart';
import 'package:ventosales/utils/default_button.dart';
import 'package:ventosales/widgets/boxfilter.dart';

class Paiement extends StatefulWidget {
  const Paiement({super.key});

  @override
  State<Paiement> createState() => _PaiementState();
}

class _PaiementState extends State<Paiement> {
  final List<Cardpaiement> ListCardpaiement = [
    Cardpaiement(
      icon: Icons.handshake,
      text: 'Tap-to-Pay',
      soustext: 'Sans contact NFC',
    ),
    Cardpaiement(
      icon: Icons.qr_code_2,
      text: 'QR code',
      soustext: 'Paiement scan',
    ),
    Cardpaiement(
      icon: Icons.swap_horiz,
      text: 'Virement',
      soustext: 'IBAN / SEPA',
    ),
    Cardpaiement(
      icon: Icons.attach_money,
      text: 'Espèces',
      soustext: 'Rendu monnaie',
    ),
  ];
  int? isactive;

  textpaiement(isactive) {
    if (isactive == 0) {
      return Nfccard(
        colorcontainer: AppColors.bleu300Opacite20,
        colortext: AppColors.bleu300Opacite60,
        icon: Icons.wifi,
        iconcolor: AppColors.bleu300Opacite60,
        text: 'Approchez la carte ou l\'appareil du terminal\n NFC',
      );
    }
    if (isactive == 1) {
      return qrcard(text: 'Faites scanner ce QR par le client');
    }
    return SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondApp,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Align(
                  alignment: AlignmentGeometry.topStart,
                  child: Text(
                    'Encaissement',
                    style: TextStyle(
                      color: AppColors.blanc,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentGeometry.topStart,
                child: Text(
                  'BTP Solution EURL - Facture FAC-2024-080-90',
                  style: TextStyle(
                    color: AppColors.bgSurface3,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              CardEncaissement(prix: '617, 40', portefeuile: '123,48'),
              Align(
                alignment: AlignmentGeometry.topStart,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    'MODE DE PAIEMENT',
                    style: TextStyle(
                      color: AppColors.bleu300Opacite20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 300,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: ListCardpaiement.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 1.3,
                  ),
                  itemBuilder: (context, index) {
                    final isselected = index == isactive;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isactive = index;
                        });
                      },
                      child: Cardpaiement(
                        icon: ListCardpaiement[index].icon,
                        text: ListCardpaiement[index].text,
                        soustext: ListCardpaiement[index].soustext,
                        iconcolor: isselected
                            ? AppColors.bleu300Opacite20
                            : null,
                        colorcontainer: isselected
                            ? AppColors.primaire
                            : AppColors.bgSurface3,
                        colortext: isselected
                            ? AppColors.texteBlanc
                            : AppColors.blanc,
                        colorsoustext: isselected
                            ? AppColors.bleu300Opacite20
                            : AppColors.bgSurface2,
                      ),
                    );
                  },
                ),
              ),
              textpaiement(isactive),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: BoutonDefault(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaiementValide()),
                  ),
                  text: 'Encaisser 617,40 \$',
                  colorBackground: AppColors.emeraude,
                  colortext: AppColors.blanc,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardEncaissement extends StatelessWidget {
  final String prix;
  final String tva = '20%';
  final String portefeuile;
  const CardEncaissement({
    super.key,
    required this.prix,
    required this.portefeuile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.bgSurface3,
          border: Border.all(color: AppColors.bleu300Opacite20),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: AlignmentGeometry.topStart,
                child: Text(
                  'MONTANT À ENCAISSER',
                  style: TextStyle(
                    color: AppColors.bleu300Opacite20,
                    fontSize: 15,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '\$',
                      style: TextStyle(
                        color: AppColors.bleu300Opacite20,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Text(
                    prix,
                    style: TextStyle(
                      color: AppColors.blanc,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Divider(color: AppColors.bleu300Opacite20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TVA ($tva)',
                    style: TextStyle(color: AppColors.bleu300Opacite20),
                  ),
                  Text(
                    '$portefeuile, \$',
                    style: TextStyle(color: AppColors.bleu300Opacite20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Cardpaiement extends StatelessWidget {
  final IconData icon;
  final String text;
  final String soustext;
  final Color? colorcontainer;
  final Color? iconcolor;
  final Color? colortext;
  final Color? colorsoustext;
  const Cardpaiement({
    super.key,
    required this.icon,
    required this.text,
    required this.soustext,
    this.colorcontainer,
    this.colortext,
    this.colorsoustext,
    this.iconcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      width: 175,
      decoration: BoxDecoration(
        color: colorcontainer,
        border: Border.all(color: AppColors.bleu300Opacite20),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Icon(icon, size: 40, color: iconcolor),
            Text(
              text,
              style: TextStyle(color: colortext, fontWeight: FontWeight.bold),
            ),
            Text(soustext, style: TextStyle(color: colorsoustext)),
          ],
        ),
      ),
    );
  }
}

class Nfccard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color colorcontainer;
  final Color iconcolor;
  final Color colortext;
  const Nfccard({
    super.key,
    required this.icon,
    required this.text,
    required this.colorcontainer,
    required this.iconcolor,
    required this.colortext,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.blue.withOpacity(0.4),
      strokeWidth: 1.5,
      dashPattern: [6, 3],
      borderType: BorderType.RRect,
      radius: Radius.circular(16),
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorcontainer,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Icon(icon, size: 40, color: iconcolor),
              Text(
                text,
                style: TextStyle(color: colortext, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Boxfilter(
                    height: 20,
                    width: 40,
                    text: 'Visa',
                    textcolor: AppColors.bleu300Opacite60,
                    colorcontainer: colorcontainer,
                  ),
                  Boxfilter(
                    height: 20,
                    width: 35,
                    text: 'MC',
                    textcolor: AppColors.bleu300Opacite60,
                    colorcontainer: colorcontainer,
                  ),
                  Boxfilter(
                    height: 20,
                    width: 35,
                    text: 'CB',
                    textcolor: AppColors.bleu300Opacite60,
                    colorcontainer: colorcontainer,
                  ),
                  Boxfilter(
                    height: 20,
                    width: 85,
                    text: 'Apple Pay',
                    textcolor: AppColors.bleu300Opacite60,
                    colorcontainer: colorcontainer,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class cardpaiement extends StatelessWidget {
  final IconData icon;
  final String text;
  final String soustext;
  final Color? colorcontainer;
  final Color? iconcolor;
  final Color? colortext;
  final Color? colorsoustext;
  const cardpaiement({
    super.key,
    required this.icon,
    required this.text,
    required this.soustext,
    this.colorcontainer,
    this.colortext,
    this.colorsoustext,
    this.iconcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      width: 175,
      decoration: BoxDecoration(
        color: colorcontainer,
        border: Border.all(color: AppColors.bleu300Opacite20),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Icon(icon, size: 40, color: iconcolor),
            Text(
              text,
              style: TextStyle(color: colortext, fontWeight: FontWeight.bold),
            ),
            Text(soustext, style: TextStyle(color: colorsoustext)),
          ],
        ),
      ),
    );
  }
}

class qrcard extends StatelessWidget {
  final String text;
  const qrcard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.bgSurface3,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10),
                child: Image.asset(
                  'assets/images/images.png',
                  fit: BoxFit.cover,
                  height: 130,
                ),
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color: AppColors.bleu300Opacite60,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
