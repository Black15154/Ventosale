import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:ventosales/screen/catalogue.dart';
import 'package:ventosales/screen/clients.dart';
import 'package:ventosales/screen/dashboard.dart';
import 'package:ventosales/screen/facture.dart';
import 'package:ventosales/screen/paiement.dart';
import 'package:ventosales/utils/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _buildScreens() {
    return [
      const Dashboard(),
      const Clients(),
      const Catalogue(),
      const Facture(),
      const Paiement(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      backgroundColor: AppColors.alerte,
      tabs: [
        PersistentTabConfig(
          screen: const Dashboard(),
          item: ItemConfig(
            icon: const Icon(Icons.grid_view_rounded),
            title: "Accueil",
            activeForegroundColor: Colors.blue,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: const Clients(),
          item: ItemConfig(
            icon: const Icon(Icons.people_alt_rounded),
            title: "Clients",
            activeForegroundColor: Colors.blue,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: const Catalogue(),
          item: ItemConfig(
            icon: const Icon(Icons.inventory_2_rounded),
            title: "Catalogue",
            activeForegroundColor: Colors.blue,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: const Facture(),
          item: ItemConfig(
            icon: const Icon(Icons.description_rounded),
            title: "Factures",
            activeForegroundColor: Colors.blue,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: const Paiement(),
          item: ItemConfig(
            icon: const Icon(Icons.point_of_sale_rounded),
            title: "Paiement",
            activeForegroundColor: Colors.blue,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(color: AppColors.fondApp),
      ),
    );
  }
}
