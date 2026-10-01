import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ventosales/utils/app_colors.dart';

class AppStr {
  static const String addrmail = "ADRESSE E-MAIL";
  static const String motpass = "MOT DE PASSE";
  static const String espacedevente = "ESPACE VENTE";
  static const String mdpoublie = "Mot de passe oublié ?";
  static const String seconnecter = "Se connecter";
  static const String oucontinueravec = "ou continuer avec";
  static const String ventosale = "VentoSales";
  static const String gestioncomercial = "Gestion commerciale terrain";
  static const String faceid = "Face ID";
  static const String touchid = "Touch ID";
  static const String familleTitre = 'DM Sans';
  static const String familleMono = 'JetBrains Mono';

  static TextStyle dmSans({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.texteBlanc,
    double? letterSpacing,
    double? height,
  }) {
    return GoogleFonts.dmSans(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  /// Light — 300
  static TextStyle dmSansLight({
    double fontSize = 14,
    Color color = AppColors.texteBlanc,
  }) => dmSans(fontSize: fontSize, fontWeight: FontWeight.w300, color: color);

  /// Regular — 400 (corps de texte)
  static TextStyle dmSansRegular({
    double fontSize = 14,
    Color color = AppColors.texteBlanc,
  }) => dmSans(fontSize: fontSize, fontWeight: FontWeight.w400, color: color);

  /// Medium — 500 (labels, boutons)
  static TextStyle dmSansMedium({
    double fontSize = 14,
    Color color = AppColors.texteBlanc,
  }) => dmSans(fontSize: fontSize, fontWeight: FontWeight.w500, color: color);

  /// Semibold — 600 (sous-titres, éléments actifs)
  static TextStyle dmSansSemibold({
    double fontSize = 16,
    Color color = AppColors.texteBlanc,
  }) => dmSans(fontSize: fontSize, fontWeight: FontWeight.w600, color: color);

  /// Bold — 700 (titres principaux)
  static TextStyle dmSansBold({
    double fontSize = 20,
    Color color = AppColors.texteBlanc,
  }) => dmSans(fontSize: fontSize, fontWeight: FontWeight.w700, color: color);

  // ---------------------------------------------------------------------
  // JetBrains Mono — Police de données
  // Usage : montants financiers (fmt()), références produits (PRD-001),
  // IDs de factures (FAC-2024-090), heure barre de statut,
  // montant input encaissement.
  // Graisses utilisées : 400 (regular), 500 (medium), 600 (semibold)
  // ---------------------------------------------------------------------

  static TextStyle jetBrainsMono({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.texteBlanc,
    double? letterSpacing,
  }) {
    return GoogleFonts.jetBrainsMono(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  /// Regular — 400
  static TextStyle monoRegular({
    double fontSize = 14,
    Color color = AppColors.texteBlanc,
  }) => jetBrainsMono(
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    color: color,
  );

  /// Medium — 500
  static TextStyle monoMedium({
    double fontSize = 14,
    Color color = AppColors.texteBlanc,
  }) => jetBrainsMono(
    fontSize: fontSize,
    fontWeight: FontWeight.w500,
    color: color,
  );

  /// Semibold — 600 (montants mis en avant)
  static TextStyle monoSemibold({
    double fontSize = 16,
    Color color = AppColors.texteBlanc,
  }) => jetBrainsMono(
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
    color: color,
  );

  // ---------------------------------------------------------------------
  // Styles sémantiques prêts à l'emploi
  // ---------------------------------------------------------------------

  /// Titre principal d'écran (ex: "Tableau de bord")
  static TextStyle titrePage = dmSansBold(fontSize: 22);

  /// Titre de carte / section
  static TextStyle titreCarte = dmSansSemibold(fontSize: 16);

  /// Corps de texte standard
  static TextStyle corpsTexte = dmSansRegular(fontSize: 14);

  /// Label uppercase (ex: "ESPACE DE VENTE")
  static TextStyle labelUppercase = dmSansMedium(
    fontSize: 11,
    color: AppColors.bleu300Opacite50,
  ).copyWith(letterSpacing: 0.8);

  /// Texte tertiaire / sous-label / date
  static TextStyle texteTertiaire = dmSansRegular(
    fontSize: 12,
    color: AppColors.bleu300Opacite40,
  );

  /// Placeholder d'input
  static TextStyle placeholder = dmSansRegular(
    fontSize: 14,
    color: AppColors.bleu300Opacite30,
  );

  /// Montant financier (ex: fmt() résultats)
  static TextStyle montant = monoSemibold(fontSize: 18);

  /// Référence produit / ID facture (ex: PRD-001, FAC-2024-090)
  static TextStyle reference = monoRegular(
    fontSize: 13,
    color: AppColors.bleu300Opacite60,
  );

  /// Heure barre de statut
  static TextStyle heureStatusBar = monoMedium(
    fontSize: 13,
    color: AppColors.bleu300Opacite30,
  );

  /// Montant dans l'input d'encaissement
  static TextStyle montantEncaissement = monoSemibold(
    fontSize: 28,
    color: AppColors.emeraudeTexte400,
  );

  /// Texte de badge (statuts : Payée, En attente, En retard…)
  static TextStyle badge = dmSansSemibold(fontSize: 11);
}
