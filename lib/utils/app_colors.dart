import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff1a3a8f);
  static const Color secondColor = Color(0xff090e1f);
  static const Color thirdColor = Color(0xff1A3A8F);

  static const Color bgPrincipal = Color(0xFF111827);

  /// Fond surface 2 — Cartes, inputs, lignes de liste, méthodes de paiement
  static const Color bgSurface2 = Color(0xFF1A2236);

  /// Fond surface 3 — Bouton "Rescanner" dans le scanner
  static const Color bgSurface3 = Color(0xFF223055);

  /// Gradient login : 160deg, #090e1f → #0f2560 → #1a3a8f
  static const List<Color> gradientLogin = [
    Color(0xFF090E1F),
    Color(0xFF0F2560),
    Color(0xFF1A3A8F),
  ];

  // ---------------------------------------------------------------------
  // Bleu Cobalt — Couleur primaire
  // ---------------------------------------------------------------------

  /// Gradient boutons primaires (base sombre), gradient carte CA
  static const Color cobaltFonce = Color(0xFF1A3A8F);

  /// Gradient boutons primaires (lumière), filtre actif, carte méthode sélectionnée
  static const Color cobaltMoyen = Color(0xFF2D55C8);

  /// Gradient login milieu
  static const Color cobaltLoginMilieu = Color(0xFF0F2560);

  /// Icônes actives nav, liens, accents UI, texte icône logo, bordures scanner
  static const Color cobaltClair = Color(0xFF60A5FA);

  /// Bordures cartes, séparateurs, barres de stock vides
  static const Color cobaltBordure20 = Color(0x332D55C8); // rgba(45,85,200,0.2)

  /// Bordures subtiles, séparateurs dans les fiches
  static const Color cobaltBordure15 = Color(
    0x262D55C8,
  ); // rgba(45,85,200,0.15)

  /// Fond icône logo login
  static const Color cobaltFondIconeLogo = Color(
    0x592D55C8,
  ); // rgba(45,85,200,0.35)

  /// Bordure carte CA dashboard
  static const Color cobaltBordureCarteCA = Color(
    0x4D5D88FF,
  ); // rgba(93,136,255,0.3)

  /// Labels badges paiement (Visa, MC…), barre signal mobile
  static const Color cobaltLabelBadge = Color(0xFF93C5FD);

  /// Barres réseau/batterie actives
  static const Color cobaltBarresActives = Color(
    0x9993C5FD,
  ); // rgba(147,197,253,0.6)

  // ---------------------------------------------------------------------
  // Bleu-gris — Textes secondaires
  // ---------------------------------------------------------------------

  /// Onglets nav inactifs, filtres inactifs, texte méthode de paiement non sélectionnée
  static const Color bleuGrisTexteSecondaire = Color(0xFF64748B);

  /// Icônes nav inactives, icône méthode de paiement non sélectionnée
  static const Color bleuGrisIconeInactive = Color(0xFF4B5563);

  /// Sous-titre logo, label email login — text-blue-300/60
  static const Color bleu300Opacite60 = Color(0x9993C5FD);

  /// Labels uppercase (ESPACE DE VENTE, etc.) — text-blue-300/50
  static const Color bleu300Opacite50 = Color(0x8093C5FD);

  /// Textes tertiaires, sous-labels, dates — text-blue-300/40
  static const Color bleu300Opacite40 = Color(0x6693C5FD);

  /// Placeholder inputs, heure status bar — text-blue-300/30
  static const Color bleu300Opacite30 = Color(0x4D93C5FD);

  /// Séparateur "ou continuer avec" — text-blue-300/20
  static const Color bleu300Opacite20 = Color(0x3393C5FD);

  // ---------------------------------------------------------------------
  // Vert Émeraude — Statuts validés / revenus
  // ---------------------------------------------------------------------

  /// Bouton encaisser (gradient base), badge "En stock", icône check paiement accepté, badge "Payée" dot
  static const Color emeraude = Color(0xFF10B981);

  /// Bouton encaisser (gradient lumière)
  static const Color emeraudeFonce = Color(0xFF059669);

  /// Fond cercle check paiement accepté
  static const Color emeraudeFond15 = Color(
    0x2610B981,
  ); // rgba(16,185,129,0.15)

  /// Ombre portée bouton encaisser, bordure bouton "Partager"
  static const Color emeraudeOmbre25 = Color(
    0x4010B981,
  ); // rgba(16,185,129,0.25)

  /// Bordure carte résultat scan
  static const Color emeraudeBordure30 = Color(
    0x4D10B981,
  ); // rgba(16,185,129,0.3)

  /// Fond bouton "Partager"
  static const Color emeraudeFondBouton12 = Color(
    0x1F10B981,
  ); // rgba(16,185,129,0.12)

  /// Texte "+18.4%", badge "Payée", statut actif client, stock en stock — text-emerald-400
  static const Color emeraudeTexte400 = Color(0xFF34D399);

  /// Fond badge "En stock" / "Payée" — bg-emerald-500/15
  static const Color emeraudeFondBadge15 = Color(0x2610B981);

  // ---------------------------------------------------------------------
  // Amber — Alertes / factures en attente
  // ---------------------------------------------------------------------

  /// Bordure gauche alertes, encours client élevé, icône action rapide "Fiche client"
  static const Color amber = Color(0xFFF59E0B);

  /// Badge "En attente", encours >10 000€, badge "Stock bas" — text-amber-400
  static const Color amberTexte400 = Color(0xFFFBBF24);

  /// Fond badge "En attente" / "Stock bas" — bg-amber-500/15
  static const Color amberFondBadge15 = Color(0x26F59E0B);

  /// Bordure carte encours client positif
  static const Color amberBordure30 = Color(0x4DF59E0B); // rgba(245,158,11,0.3)

  // ---------------------------------------------------------------------
  // Rouge — Ruptures / retard
  // ---------------------------------------------------------------------

  /// Badge notification cloche (3 alertes) — bg-red-500
  static const Color rouge = Color(0xFFEF4444);

  /// Badge "En retard", stock = 0, alerte impayés — text-red-400
  static const Color rougeTexte400 = Color(0xFFF87171);

  /// Fond badge "En retard" — bg-red-500/15
  static const Color rougeFondBadge15 = Color(0x26EF4444);

  /// Barre de stock vide (rupture) — bg-red-500
  static const Color rougeBarreStockVide = Color(0xFFEF4444);

  // ---------------------------------------------------------------------
  // Violet — Catégorie secondaire
  // ---------------------------------------------------------------------

  /// Avatar client B2C, gradient bouton Scanner — rgba(124,58,237,0.2)
  static const Color violetFond20 = Color(0x337C3AED);

  /// Gradient bouton Scanner (base), gradient résultat scan
  static const Color violet = Color(0xFF7C3AED);

  /// Gradient bouton Scanner (lumière)
  static const Color violetFonce = Color(0xFF5B21B6);

  /// Badge type B2C — text-purple-400
  static const Color violetTexte400 = Color(0xFFA78BFA);

  /// Fond badge type B2C — bg-purple-500/20
  static const Color violetFondBadge20 = Color(0x33A855F7);

  /// KPI "Clients actifs" — text-a78bfa
  static const Color violetKpi = Color(0xFFA78BFA);

  // ---------------------------------------------------------------------
  // Blanc / Neutre
  // ---------------------------------------------------------------------

  /// Fond QR code (contraste), texte sur fonds colorés
  static const Color blanc = Color(0xFFFFFFFF);

  /// Titres, valeurs importantes, texte sur cartes sombres — text-white
  static const Color texteBlanc = Color(0xFFFFFFFF);

  /// Labels méthodes paiement non sélectionnées
  static const Color grisNeutre = Color(0xFF9CA3AF);

  // ---------------------------------------------------------------------
  // Résumé des rôles sémantiques (alias pratiques)
  // ---------------------------------------------------------------------

  /// Fond app — surface de base
  static const Color fondApp = bgPrincipal;

  /// Cartes/inputs — niveau +1
  static const Color surfaceCarte = bgSurface2;

  /// Primaire — actions, navigation
  static const Color primaire = cobaltMoyen;
  static const Color primaireFonce = cobaltFonce;

  /// Succès — payé, validé, en stock
  static const Color succes = emeraude;

  /// Alerte — attente, stock bas, encours
  static const Color alerte = amber;

  /// Danger — retard, rupture
  static const Color danger = rouge;

  /// Info — liens, actif, neutre positif
  static const Color info = cobaltClair;

  /// Secondaire — B2C, scanner, accent violet
  static const Color secondaire = violet;
}
