import 'package:flutter/material.dart';
import 'package:ventosales/utils/app_colors.dart';

class DropdownSelection extends StatefulWidget {
  const DropdownSelection({super.key});

  @override
  State<DropdownSelection> createState() => _DropdownSelectionState();
}

class _DropdownSelectionState extends State<DropdownSelection> {
  final List<String> location = [
    'BTP Solid — Agence Lyon Sud',
    'BTP Solid — Agence marseille Sud',
    'BTP Solid — Agence paris Sud',
    'BTP Solid — Agence limoges Sud',
  ];

  String? _selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      initialValue: _selectedLanguage,
      style: TextStyle(color: Colors.white),
      hint: Text(location[0], style: TextStyle(color: Colors.white)),
      dropdownColor: Colors.black,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        prefixIcon: const Icon(
          Icons.home,
          color: AppColors.cobaltBordureCarteCA,
        ),
      ),

      items: location.map((String location) {
        return DropdownMenuItem(value: location, child: Text(location));
      }).toList(),

      onChanged: (value) {
        setState(() {
          _selectedLanguage = value;
        });
      },
    );
  }
}
