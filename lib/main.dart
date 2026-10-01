import 'package:flutter/material.dart';
import 'package:ventosales/screen/catalogue.dart';
import 'package:ventosales/screen/controller_page.dart';
import 'package:ventosales/screen/dashboard.dart';
import 'package:ventosales/screen/clients.dart';
import 'package:ventosales/screen/facture.dart';
import 'package:ventosales/screen/formconnexion.dart';
import 'package:ventosales/screen/paiement.dart';
import 'package:ventosales/screen/paiement_valide.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Formconnexion(),
    );
  }
}
