import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:ventosales/screen/catalogue.dart';
import 'package:ventosales/screen/clients.dart';
import 'package:ventosales/screen/facture.dart';
import 'package:ventosales/screen/paiement.dart';
import 'package:ventosales/utils/app_colors.dart';
import 'package:ventosales/widgets/box_resum.dart';
import 'package:ventosales/widgets/card_alert.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
              child: AppBarDashboard(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CardTurnover(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Boxresum(
                    firsttext: 'VENTES',
                    secondtext: '24',
                    thirdtext: 'aujourd\'hui',
                    colorfirsttext: AppColors.bleu300Opacite60,
                    colorsecondtext: AppColors.info,
                    colorthirdtext: AppColors.bleu300Opacite60,
                  ),
                  Boxresum(
                    firsttext: 'PANIER MOY.',
                    secondtext: '617,00\$',
                    thirdtext: 'HT',
                    colorfirsttext: AppColors.bleu300Opacite60,
                    colorsecondtext: AppColors.emeraude,
                    colorthirdtext: AppColors.bleu300Opacite60,
                  ),
                  Boxresum(
                    firsttext: 'CLIENTS\nACTIF',
                    secondtext: '6',
                    thirdtext: 'ce mois',
                    colorfirsttext: AppColors.bleu300Opacite60,
                    colorsecondtext: AppColors.blanc,
                    colorthirdtext: AppColors.bleu300Opacite60,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Align(
                alignment: AlignmentGeometry.topStart,
                child: Text(
                  'ALERTES',
                  style: TextStyle(color: AppColors.bleu300Opacite60),
                ),
              ),
            ),
            CardAlert(
              height: 70,
              widht: double.infinity,
              coloricon: AppColors.alerte,
              fisrttext: '2 produits en rupture / stock bas',
              secondtext: 'Verifie le catalogue',
              iconData1: Icons.warning_amber,
              iconData2: Icons.arrow_forward_ios,
            ),
            CardAlert(
              height: 70,
              widht: double.infinity,
              coloricon: AppColors.danger,
              fisrttext: '3 factures non réglées',
              secondtext: 'Dont 1 en retard',
              iconData1: Icons.warning_amber,
              iconData2: Icons.arrow_forward_ios,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              child: Align(
                alignment: AlignmentGeometry.topStart,
                child: Text(
                  'ACTIONS RAPIDES',
                  style: TextStyle(color: AppColors.bleu300Opacite60),
                ),
              ),
            ),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                GestureDetector(
                  onTap: () {
                    pushScreen(
                      context,
                      screen: const Facture(),
                      withNavBar: true, // Garantit que la barre reste affichée
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: BoxActionFast(
                    iconcolor: AppColors.primaire,
                    text: 'Nouvelle\nfacture',
                    icon: Icons.description,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Paiement()),
                  ),
                  child: BoxActionFast(
                    iconcolor: AppColors.emeraude,
                    text: 'Encaisser',
                    icon: Icons.card_giftcard,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Catalogue()),
                  ),
                  child: BoxActionFast(
                    iconcolor: AppColors.violetFond20,
                    text: 'Scanner\nproduit',
                    icon: Icons.description,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Clients()),
                    );
                  },
                  child: BoxActionFast(
                    iconcolor: AppColors.alerte,
                    text: 'Fiche client',
                    icon: Icons.people_alt_outlined,
                  ),
                ),
              ],
            ),
            /* GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              padding: const EdgeInsets.all(10.0),
              children: const [
                BoxActionFast(
                  iconcolor: AppColors.violetFond20,
                  text: 'Nouvelle\nfacture',
                  icon: Icons.description,
                ),
                BoxActionFast(
                  iconcolor: AppColors.emeraude,
                  text: 'Encaisser',
                  icon: Icons.card_giftcard,
                ),
                BoxActionFast(
                  iconcolor: AppColors.violetFond20,
                  text: 'Nouvelle\nfacture',
                  icon: Icons.description,
                ),
                BoxActionFast(
                  iconcolor: AppColors.violetFond20,
                  text: 'Nouvelle\nfacture',
                  icon: Icons.description,
                ),
              ],
            ), */
          ],
        ),
      ),
    );
  }
}

class BoxActionFast extends StatelessWidget {
  final Color iconcolor;
  final IconData icon;
  final String text;

  const BoxActionFast({
    super.key,
    required this.iconcolor,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 66,
      decoration: BoxDecoration(
        color: AppColors.bgSurface3,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: AppColors.bleu300Opacite20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, color: iconcolor),
          ),
          Text(text, style: TextStyle(color: AppColors.blanc)),
        ],
      ),
    );
  }
}

class CardTurnover extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.primaire,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CHIFFRE D\'AFFAIRES DU JOUR',
              style: TextStyle(
                fontSize: 12,
                color: const Color.fromARGB(255, 148, 157, 181),
              ),
            ),
            Text(
              '14 820,00 \$',
              style: TextStyle(
                color: AppColors.blanc,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Icon(Icons.keyboard_arrow_up, color: AppColors.emeraude),
                  Text(
                    '+18.4%',
                    style: TextStyle(
                      color: AppColors.emeraude,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),

                  Text(
                    'vs hier',
                    style: TextStyle(
                      color: AppColors.bleuGrisTexteSecondaire,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    '|',
                    style: TextStyle(
                      color: AppColors.bleuGrisTexteSecondaire,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 20),

                  Text(
                    'Mois:',
                    style: TextStyle(
                      color: AppColors.bleuGrisTexteSecondaire,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 15),

                  Text(
                    '89 340, 00 \$',
                    style: TextStyle(
                      color: AppColors.texteBlanc,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarDashboard extends StatelessWidget {
  const AppBarDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MERCREDI 11 DÉC.',
              style: TextStyle(color: const Color.fromARGB(255, 148, 157, 181)),
            ),
            Text(
              'Bonjour, Sophie 👋',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.texteBlanc,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.bgSurface3,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Icon(
            Icons.notifications_none_outlined,
            color: const Color.fromARGB(255, 76, 106, 190),
            size: 25,
          ),
        ),
      ],
    );
  }
}
