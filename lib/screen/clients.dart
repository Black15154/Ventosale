import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:ventosales/screen/clientdetail.dart';
import 'package:ventosales/screen/facture.dart';
import 'package:ventosales/utils/app_colors.dart';
import 'package:ventosales/widgets/boxfilter.dart';

class Clients extends StatefulWidget {
  const Clients({super.key});

  @override
  State<Clients> createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  final List<String> categorie = ['Tous', 'B2B', 'B2C'];

  final List<Cardresumvente> listCardresumvente = [
    Cardresumvente(
      colorcontainer: AppColors.cobaltFondIconeLogo,
      colortextcontainer: AppColors.cobaltBarresActives,
      nomtitrecard: 'Sophie Marchand',
      producttitrecard: 'Marchand & Fils SARL',
      prix: '4 200,00 \$',
      textcontainerfisrt: 'SM',
      textcontainersecond: 'B2B',
      isactif: true,
    ),
    Cardresumvente(
      colorcontainer: AppColors.cobaltFondIconeLogo,
      colortextcontainer: AppColors.cobaltBarresActives,
      nomtitrecard: 'Thomas Leclerc',
      producttitrecard: 'Groupe Leclerc',
      prix: '18 500,00 \$',
      textcontainerfisrt: 'TL',
      textcontainersecond: 'B2B',
      isactif: true,
    ),
    Cardresumvente(
      colorcontainer: AppColors.violet.withValues(alpha: 0.15),
      colortextcontainer: AppColors.blanc,
      nomtitrecard: 'Amina Bernali',
      producttitrecard: 'Marseille',
      prix: '320,00 \$',
      textcontainerfisrt: 'AB',
      textcontainersecond: 'B2C',
      isactif: true,
    ),
    Cardresumvente(
      colorcontainer: AppColors.cobaltFondIconeLogo,
      colortextcontainer: AppColors.cobaltBarresActives,
      nomtitrecard: 'Renault Indust..',
      producttitrecard: 'Renault Industrie SAS',
      prix: '67 200,00 \$',
      textcontainerfisrt: 'RI',
      textcontainersecond: 'B2B',
      isactif: true,
    ),
    Cardresumvente(
      colorcontainer: AppColors.violet.withValues(alpha: 0.15),
      colortextcontainer: AppColors.blanc,
      nomtitrecard: 'Julie Fontaine',
      producttitrecard: 'Bordeaux',
      prix: '0,00 \$',
      isactif: false,
      textcontainerfisrt: 'JF',
      textcontainersecond: 'B2C',
    ),
    Cardresumvente(
      colorcontainer: AppColors.cobaltFondIconeLogo,
      colortextcontainer: AppColors.cobaltBarresActives,
      nomtitrecard: 'BTP Solution',
      producttitrecard: 'BTP Solutions EURL',
      prix: '9 800,00 \$',
      textcontainerfisrt: 'BS',
      textcontainersecond: 'B2B',
      isactif: true,
    ),
  ];

  final TextEditingController _searchController = TextEditingController();
  List<Cardresumvente> _filteredClients = [];
  String _selectedCategory = 'Tous';

  @override
  void initState() {
    super.initState();
    _filteredClients = List.from(listCardresumvente);
  }

  // Application conjointe du filtre texte et du filtre catégorie (Tous / B2B / B2C)
  void _applyFilters() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredClients = listCardresumvente.where((client) {
        final matchesSearch =
            client.nomtitrecard.toLowerCase().contains(query) ||
            client.producttitrecard.toLowerCase().contains(query) ||
            client.textcontainerfisrt.toLowerCase().contains(query);

        final matchesType =
            _selectedCategory == 'Tous' ||
            client.textcontainersecond.toUpperCase() ==
                _selectedCategory.toUpperCase();

        return matchesSearch && matchesType;
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondApp,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TITRE
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'Clients',
                style: TextStyle(
                  color: AppColors.blanc,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),

            // BARRE DE RECHERCHE
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.bgSurface3,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (_) => _applyFilters(),
                    style: const TextStyle(color: AppColors.blanc),
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.search_outlined,
                        color: AppColors.bgPrincipal,
                        size: 26,
                      ),
                      hintText: 'Rechercher un client...',
                      hintStyle: TextStyle(color: AppColors.bgPrincipal),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),

            // BOUTONS DE FILTRES (Tous / B2B / B2C)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categorie.length,
                  itemBuilder: (context, index) {
                    final filter = categorie[index];
                    final isSelected = filter == _selectedCategory;
                    return GestureDetector(
                      onTap: () {
                        _selectedCategory = filter;
                        _applyFilters();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Boxfilter(
                          text: filter,
                          colorcontainer: isSelected
                              ? AppColors.primaire
                              : AppColors.bgSurface3,
                          textcolor: isSelected
                              ? AppColors.blanc
                              : AppColors.bleuGrisTexteSecondaire,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // LISTE DES CLIENTS FILTRÉS
            Expanded(
              child: _filteredClients.isEmpty
                  ? const Center(
                      child: Text(
                        'Aucun client trouvé',
                        style: TextStyle(color: Colors.white54),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _filteredClients.length,
                      itemBuilder: (context, index) {
                        final client = _filteredClients[index];
                        return GestureDetector(
                          onTap: () {
                            pushScreen(
                              context,
                              screen: Clientdetail(cardresumvente: client),
                              withNavBar: true,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Cardresumvente(
                              isactif: client.isactif,
                              colorcontainer: client.colorcontainer,
                              colortextcontainer: client.colortextcontainer,
                              nomtitrecard: client.nomtitrecard,
                              producttitrecard: client.producttitrecard,
                              prix: client.prix,
                              textcontainerfisrt: client.textcontainerfisrt,
                              textcontainersecond: client.textcontainersecond,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class Cardresumvente extends StatelessWidget {
  final Color colorcontainer;
  final Color colortextcontainer;
  final String textcontainerfisrt;
  final String textcontainersecond;
  final String nomtitrecard;
  final String producttitrecard;
  final String prix;
  final bool isactif;

  const Cardresumvente({
    super.key,
    required this.colorcontainer,
    required this.colortextcontainer,
    required this.nomtitrecard,
    required this.producttitrecard,
    required this.prix,
    required this.isactif,
    required this.textcontainerfisrt,
    required this.textcontainersecond,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.bgSurface3,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.bleu300Opacite20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Boxdevise(
                colorcontainer: colorcontainer,
                textcontainerfisrt: textcontainerfisrt,
                colortextcontainer: colortextcontainer,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          nomtitrecard, //'Sophie Marchand',
                          style: TextStyle(
                            color: AppColors.blanc,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      BoxdeviseBCDB2B(
                        colorcontainer: colorcontainer,
                        textcontainersecond: textcontainersecond,
                        colortextcontainer: colortextcontainer,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: Text(producttitrecard /* 'Mechant & Fils SARL' */),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      prix, //'4 200,00 \$',
                      style: TextStyle(
                        color: isactif
                            ? AppColors.amberTexte400
                            : AppColors.secondColor,
                      ),
                    ),
                  ),
                  Pointcolor(isactif: isactif),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pointcolor extends StatelessWidget {
  const Pointcolor({super.key, required this.isactif});

  final bool isactif;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(
            radius: 3,
            backgroundColor: isactif
                ? AppColors.emeraude
                : AppColors.bleuGrisIconeInactive,
          ),
        ),
        Text(isactif ? 'actif' : 'inactif'),
      ],
    );
  }
}

class BoxdeviseBCDB2B extends StatelessWidget {
  const BoxdeviseBCDB2B({
    super.key,
    required this.colorcontainer,
    required this.textcontainersecond,
    required this.colortextcontainer,
    this.pointcolor,
  });

  final Color colorcontainer;
  final String textcontainersecond;
  final Color colortextcontainer;
  final Pointcolo? pointcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorcontainer, //AppColors.cobaltFondIconeLogo,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
        child: Row(
          children: [
            ?pointcolor,
            Text(
              textcontainersecond,
              style: TextStyle(
                color: colortextcontainer,
              ), //AppColors.cobaltMoyen,
            ),
          ],
        ),
      ),
    );
  }
}

class Boxdevise extends StatelessWidget {
  const Boxdevise({
    super.key,
    required this.colorcontainer,
    required this.textcontainerfisrt,
    required this.colortextcontainer,
  });

  final Color colorcontainer;
  final String textcontainerfisrt;
  final Color colortextcontainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: colorcontainer, //AppColors.cobaltFondIconeLogo,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          textcontainerfisrt,
          style: TextStyle(
            color: colortextcontainer, //AppColors.cobaltLoginMilieu,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
