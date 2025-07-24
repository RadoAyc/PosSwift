import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/l10n/app_localizations.dart'; // Import AppLocalizations

class BarcodeInputRow extends StatelessWidget {
  final String? initialValue;
  final ValueChanged<String> onChanged;
  final VoidCallback onDelete;
  final String? Function(String?)? validator; // Validator takes String?

  const BarcodeInputRow({
    Key? key,
    this.initialValue,
    required this.onChanged,
    required this.onDelete,
    this.validator, // Accept validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              initialValue: initialValue,
              decoration: InputDecoration(
                labelText: local.barcodeLabel, // Localized label
                border: const OutlineInputBorder(),
              ),
              onChanged: onChanged,
              validator: validator, // Apply validator
              keyboardType: TextInputType.number, // Barcodes are typically numeric
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Allow only digits for barcodes
              ],
            ),
          ),
          const SizedBox(width: 8.0),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
            tooltip: local.deleteBarcodeButtonTooltip, // Localized tooltip
          ),
        ],
      ),
    );
  }
}
