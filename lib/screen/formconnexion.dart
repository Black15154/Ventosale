import 'package:flutter/material.dart';
import 'package:ventosales/screen/controller_page.dart';
import 'package:ventosales/utils/app_colors.dart';
import 'package:ventosales/utils/app_str.dart';
import 'package:ventosales/utils/button_icon.dart';
import 'package:ventosales/utils/default_button.dart';

import '../widgets/dropdown_selection.dart';

class Formconnexion extends StatefulWidget {
  const Formconnexion({super.key});

  @override
  State<Formconnexion> createState() => _FormconnexionState();
}

class _FormconnexionState extends State<Formconnexion> {
  final _formkey = GlobalKey();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondApp,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF090E1F), Color(0xFF0F2560), Color(0xFF1A3A8F)],
              stops: [0.0, 0.6, 1.0],
            ),
          ),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 70),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(10),
                        child: Image(
                          width: 50,
                          height: 50,
                          image: AssetImage('assets/images/istockphoto-.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      AppStr.ventosale,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      AppStr.gestioncomercial,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.thirdColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 700,
                  decoration: BoxDecoration(
                    color: AppColors.bgPrincipal,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Formulaire(
                      formkey: _formkey,
                      emailCtrl: _emailCtrl,
                      passCtrl: _passCtrl,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Formulaire extends StatelessWidget {
  const Formulaire({
    super.key,
    required this._formkey,
    required this._emailCtrl,
    required this._passCtrl,
  });

  final GlobalKey<State<StatefulWidget>> _formkey;
  final TextEditingController _emailCtrl;
  final TextEditingController _passCtrl;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentGeometry.topStart,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'ESPACE VENTE',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.cobaltFonce,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownSelection(),
          ),
          Align(
            alignment: AlignmentGeometry.topStart,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStr.addrmail,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.cobaltFonce,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              controller: _emailCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.cobaltBordure15,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),

              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Veulliez entrer votre e-mail';
                }
                return null;
              },
            ),
          ),

          SizedBox(height: 10),

          Align(
            alignment: AlignmentGeometry.topStart,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStr.motpass,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.cobaltFonce,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              controller: _passCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Veulliez entrer votre mot de passe';
                }
                return null;
              },
            ),
          ),
          Align(
            alignment: AlignmentGeometry.topEnd,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Mot de passe oublié ?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.cobaltFonce,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 15,
            ),
            child: BoutonDefault(
              colorBackground: AppColors.cobaltFonce,
              height: 60,
              text: AppStr.seconnecter,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
            child: Row(
              children: [
                Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    AppStr.oucontinueravec,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColors.cobaltClair,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(color: Colors.grey, thickness: 1),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: ButtonIcon(
                    width: 165,
                    height: 60,
                    icons: Icons.g_mobiledata_rounded,
                    text: AppStr.faceid,
                    iconColors: AppColors.cobaltLabelBadge,
                    colorBorder: AppColors.cobaltBordure15,
                    sizeicons: 50,
                    borderRadius: 15,
                    colorBackground: AppColors.bgSurface2,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: ButtonIcon(
                    colorBorder: AppColors.cobaltBordure15,
                    width: 165,
                    height: 60,
                    icons: Icons.g_mobiledata,
                    text: AppStr.touchid,
                    iconColors: AppColors.cobaltLabelBadge,
                    sizeicons: 50,
                    borderRadius: 15,
                    colorBackground: AppColors.bgSurface2,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
