import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:ventosales/screen/catalogue_scanner.dart';
import 'package:ventosales/screen/clients.dart';
import 'package:ventosales/utils/app_colors.dart';

class Catalogue extends StatefulWidget {
  const Catalogue({super.key});

  @override
  State<Catalogue> createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  final List<Bigcontainercatalogue> Listbigcontainercatalogue = [
    Bigcontainercatalogue(
      id: 'PRD-001',
      statutstock: 'En stock',
      prix: '29,88 \$',
      prixHT: '24,90 \$',
      titrecontainer: 'Clé à molette Pro 250mm',
      soustitrecontainer: 'Outillage',
      quantite: 50,
    ),
    Bigcontainercatalogue(
      id: 'PRD-002',
      statutstock: 'Stock bas',
      prix: '106,80 \$',
      prixHT: '89,00 \$',
      titrecontainer: 'Perceuse sans fil 18V',
      soustitrecontainer: 'Électroportatif',
      quantite: 20,
    ),
    Bigcontainercatalogue(
      id: 'PRD-003',
      statutstock: 'En stock',
      prix: '29,88 \$',
      prixHT: '24,90 \$',
      titrecontainer: 'Tournevis isoler 1000V',
      soustitrecontainer: 'Outillage',
      quantite: 10,
    ),
    Bigcontainercatalogue(
      id: 'PRD-004',
      statutstock: 'En stock',
      prix: '15,00 \$',
      prixHT: '12,50 \$',
      titrecontainer: 'Casque de chantier EN397',
      soustitrecontainer: 'EPI',
      quantite: 2,
    ),
    Bigcontainercatalogue(
      id: 'PRD-005',
      statutstock: 'En stock',
      prix: '9,96 \$',
      prixHT: '8,30 \$',
      titrecontainer: 'Gants anti-coupure T9',
      soustitrecontainer: 'EPI',
      quantite: 30,
    ),
  ];

  final TextEditingController _searchController = TextEditingController();
  List<Bigcontainercatalogue> _filteredCatalogue = [];

  @override
  void initState() {
    super.initState();
    _filteredCatalogue = List.from(Listbigcontainercatalogue);
  }

  void _filterCatalogue(String query) {
    final lowerQuery = query.toLowerCase().trim();
    setState(() {
      _filteredCatalogue = Listbigcontainercatalogue.where((item) {
        final matchesName = item.titrecontainer.toLowerCase().contains(
          lowerQuery,
        );
        final matchesCategory = item.soustitrecontainer.toLowerCase().contains(
          lowerQuery,
        );
        final matchesId = item.id.toLowerCase().contains(lowerQuery);

        return matchesName || matchesCategory || matchesId;
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
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Catalogue',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blanc,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final String? codeScanne = await pushScreen<String>(
                        context,
                        screen: const CatalogueScanner(),
                        withNavBar: true,
                      );

                      if (codeScanne != null && codeScanne.isNotEmpty) {
                        _searchController.text = codeScanne;
                        _filterCatalogue(codeScanne);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColors.secondaire,
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.qr_code_scanner_rounded,
                            color: AppColors.texteBlanc,
                            size: 20,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Scanner',
                            style: TextStyle(
                              color: AppColors.texteBlanc,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
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
                    onChanged: _filterCatalogue,
                    style: const TextStyle(color: AppColors.blanc),
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.search_outlined,
                        color: AppColors.bgPrincipal,
                        size: 26,
                      ),
                      hintText: 'Réf., nom, catégorie...',
                      hintStyle: const TextStyle(color: AppColors.bgPrincipal),
                      border: InputBorder.none,
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(
                                Icons.close_rounded,
                                color: AppColors.bgPrincipal,
                                size: 20,
                              ),
                              onPressed: () {
                                _searchController.clear();
                                _filterCatalogue('');
                              },
                            )
                          : null,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: _filteredCatalogue.isEmpty
                  ? const Center(
                      child: Text(
                        'Aucun produit trouvé',
                        style: TextStyle(color: Colors.white54),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _filteredCatalogue.length,
                      itemBuilder: (context, index) {
                        final item = _filteredCatalogue[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Bigcontainercatalogue(
                            id: item.id,
                            statutstock: item.statutstock,
                            prix: item.prix,
                            prixHT: item.prixHT,
                            titrecontainer: item.titrecontainer,
                            soustitrecontainer: item.soustitrecontainer,
                            quantite: item.quantite,
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

class Bigcontainercatalogue extends StatelessWidget {
  final String id;
  final String statutstock;
  final String prix;
  final String prixHT;
  final String titrecontainer;
  final String soustitrecontainer;
  final int quantite;

  const Bigcontainercatalogue({
    super.key,
    required this.id,
    required this.statutstock,
    required this.prix,
    required this.prixHT,
    required this.titrecontainer,
    required this.soustitrecontainer,
    required this.quantite,
  });

  Color get couleur {
    if (quantite <= 2) return AppColors.rougeBarreStockVide;
    if (quantite > 2 && quantite <= 20) return AppColors.alerte;
    return AppColors.emeraude;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        height: 125,
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
                  BoxdeviseBCDB2B(
                    colorcontainer: couleur.withOpacity(0.25),
                    textcontainersecond: statutstock,
                    colortextcontainer: couleur,
                  ),
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
                  Text(
                    titrecontainer,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.blanc,
                    ),
                  ),
                  Text(
                    prixHT,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.bgSurface3,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentGeometry.topStart,
                child: Text(soustitrecontainer),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 310,
                    child: StockProgressBar(quantite: quantite),
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

class StockProgressBar extends StatelessWidget {
  final int quantite;

  const StockProgressBar({super.key, required this.quantite});

  Color get couleur {
    if (quantite <= 2) return AppColors.rougeBarreStockVide;
    if (quantite > 2 && quantite <= 20) return AppColors.alerte;
    return AppColors.emeraude;
  }

  @override
  Widget build(BuildContext context) {
    double iscomplet() {
      if (quantite >= 50) return 1.0;
      if (quantite >= 10 && quantite < 50) return 0.5;
      return 0.2;
    }

    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: iscomplet(),
              minHeight: 8,
              backgroundColor: Colors.grey.shade800,
              valueColor: AlwaysStoppedAnimation<Color>(couleur),
            ),
          ),
        ),
        Text(
          '$quantite u.',
          style: TextStyle(fontWeight: FontWeight.bold, color: couleur),
        ),
      ],
    );
  }
}
