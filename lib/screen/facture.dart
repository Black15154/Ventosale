import 'package:flutter/material.dart';
import 'package:ventosales/screen/clients.dart';
import 'package:ventosales/utils/app_colors.dart';
import 'package:ventosales/widgets/boxfilter.dart';
import 'package:ventosales/widgets/card_alert.dart';

class Facture extends StatefulWidget {
  const Facture({super.key});

  @override
  State<Facture> createState() => _FactureState();
}

class _FactureState extends State<Facture> {
  final List<String> Categorie = [
    'Toutes',
    'Payées',
    'En attente',
    'En retard',
  ];

  final List<Bigcontainerfacture> ListBigcontainerfacture = [
    Bigcontainerfacture(
      id: 'FAC-2024-089',
      statutstock: 'Payée',
      prix: '3 640,00',
      titrecontainer: 'Groupe Leclerc SA',
      echeance: 'Echéance 28/12/2024',
    ),
    Bigcontainerfacture(
      id: 'FAC-2024-089',
      statutstock: 'En attente',
      prix: '1 040,00',
      titrecontainer: 'Groupe Leclerc SA',
      echeance: 'Echéance 28/12/2024',
    ),
    Bigcontainerfacture(
      id: 'FAC-2024-090',
      statutstock: 'En retard',
      prix: '3 840,00',
      titrecontainer: 'Groupe Leclerc SA',
      echeance: 'Echéance 28/12/2024',
    ),
    Bigcontainerfacture(
      id: 'FAC-2024-091',
      statutstock: 'En attente',
      prix: '3 540,00',
      titrecontainer: 'Groupe Leclerc SA',
      echeance: 'Echéance 28/12/2024',
    ),
    Bigcontainerfacture(
      id: 'FAC-2024-092',
      statutstock: 'Payée',
      prix: '310,00',
      titrecontainer: 'Groupe Leclerc SA',
      echeance: 'Echéance 28/12/2024',
    ),
  ];
  int? isactive;
  String selectedFilter = 'Toutes';
  List<Bigcontainerfacture> get filteredFactures {
    if (selectedFilter == 'Toutes') {
      return ListBigcontainerfacture;
    } else if (selectedFilter == 'Payées') {
      return ListBigcontainerfacture.where((f) => f.statutstock == 'Payée')
          .toList();
    } else if (selectedFilter == 'En attente') {
      return ListBigcontainerfacture.where((f) => f.statutstock == 'En attente')
          .toList();
    } else if (selectedFilter == 'En retard') {
      return ListBigcontainerfacture.where((f) => f.statutstock == 'En retard')
          .toList();
    }
    return ListBigcontainerfacture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondApp,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Align(
                alignment: AlignmentGeometry.topStart,
                child: Text(
                  'Factures',
                  style: TextStyle(
                    color: AppColors.blanc,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardAlert(
                  height: 70,
                  widht: 170,
                  coloricon: AppColors.alerte,
                  fisrttext: 'EN ATTENTE',
                  secondtext: '1 846,20 \$',
                ),
                CardAlert(
                  height: 70,
                  widht: 170,
                  coloricon: AppColors.danger,
                  fisrttext: 'EN RETARD',
                  secondtext: '8 920,00 \$',
                ),
              ],
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: Categorie.length,
                itemBuilder: (context, index) {
                  final filter = Categorie[index];
                  final isselecte = index == isactive;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isactive = index;
                        selectedFilter = filter;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Boxfilter(
                        text: filter,
                        colorcontainer: isselecte
                            ? AppColors.primaire
                            : AppColors.bgSurface3,
                        textcolor: isselecte
                            ? AppColors.blanc
                            : AppColors.bleuGrisTexteSecondaire,
                      ),
                    ),
                  );
                },
              ),
            ),

            Expanded(
              child: SizedBox(
                height: 500,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: filteredFactures.length,
                  itemBuilder: (context, index) {
                    return Bigcontainerfacture(
                      id: filteredFactures[index].id,
                      statutstock: filteredFactures[index].statutstock,
                      prix: filteredFactures[index].prix,
                      titrecontainer: filteredFactures[index].titrecontainer,
                      echeance: filteredFactures[index].echeance,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Bigcontainerfacture extends StatelessWidget {
  final String id;
  final String statutstock;
  final String prix;
  final String titrecontainer;
  final String echeance;

  const Bigcontainerfacture({
    super.key,
    required this.id,
    required this.statutstock,
    required this.prix,
    required this.titrecontainer,
    required this.echeance,
  });

  Color status(String statut) {
    switch (statut) {
      case 'En attente':
        return AppColors.alerte;
      case 'En retard':
        return AppColors.rouge;
      default:
        return AppColors.emeraude;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AppColors.bgSurface3,
          border: Border.all(color: AppColors.bleu300Opacite20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(id),

                  SizedBox(width: 120),
                  Text(
                    prix,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.blanc,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titrecontainer,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blanc,
                        ),
                      ),
                      Text(
                        echeance,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.bgSurface3,
                        ),
                      ),
                    ],
                  ),
                  BoxdeviseBCDB2B(
                    colorcontainer: status(statutstock).withOpacity(0.25),
                    textcontainersecond: '$statutstock',
                    colortextcontainer: status(statutstock),
                    pointcolor: Pointcolo(color: status(statutstock)),
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

class Pointcolo extends StatelessWidget {
  final Color color;
  const Pointcolo({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(radius: 3, backgroundColor: color),
        ),
      ],
    );
  }
}
