import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:myapp/l10n/app_localizations.dart'; // Import AppLocalizations

class ProductImagePicker extends StatelessWidget {
  final Uint8List? imageBytes; // Change to Uint8List
  final ValueChanged<Uint8List?> onImageSelected; // Callback for selected bytes

  const ProductImagePicker({
    Key? key,
    this.imageBytes,
    required this.onImageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(local.productImageLabel), // Localized label
        const SizedBox(height: 8.0),
        Container(
          width: 100, // Thumbnail width
          height: 100, // Thumbnail height
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: imageBytes != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.memory(
                    imageBytes!,
                    fit: BoxFit.cover,
                  ),
                )
              : Icon(
                  Icons.image,
                  size: 50,
                  color: Colors.grey[400],
                ),
        ),
        const SizedBox(height: 8.0),
        ElevatedButton.icon(
          onPressed: () {
            // This button will trigger the image picking logic in the provider.
            // The provider will then call setProductImageBytes which notifies listeners.
            // The actual image picking will happen in ProductFormProvider.pickProductImage().
            // This onPressed could ideally trigger a direct call to provider.pickProductImage()
            // if we pass the provider instance or a specific callback to this widget.
            // For now, onImageSelected is used as a placeholder which should eventually
            // receive bytes from the provider's picking logic.
            // TODO: Refine this to directly trigger provider.pickProductImage()
            // by passing a VoidCallback for "pick image" action from AddProductPage.
          },
          icon: const Icon(Icons.photo_library),
          label: Text(local.chooseImageButtonLabel), // Localized label
        ),
        // TODO: Optional: Add drag-and-drop image area
      ],
    );
  }
}
