import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:myapp/l10n/app_localizations.dart';

class InvoiceAttachmentPicker extends StatefulWidget {
  final File? attachment;
  final ValueChanged<File?> onAttachmentPicked;

  const InvoiceAttachmentPicker({
    Key? key,
    required this.attachment,
    required this.onAttachmentPicked,
  }) : super(key: key);

  @override
  _InvoiceAttachmentPickerState createState() => _InvoiceAttachmentPickerState();
}

class _InvoiceAttachmentPickerState extends State<InvoiceAttachmentPicker> {
  File? _selectedFile;
  
  @override
  void initState() {
    super.initState();
    _selectedFile = widget.attachment;
  }

  Future<void> _pickFile(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg'], //to allow only given types
      );
// if the results exist will be allowed to be made and will change the attachemnt back  if
      if (result != null && result.files.isNotEmpty) {
        setState(() {
          _selectedFile = File(result.files.first.path!);
          widget.onAttachmentPicked(_selectedFile);
        });
      } else {
        // User canceled the picker
        print('User canceled the file picking');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;  //create new version to avoid past errors
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(local.invoiceAttachmentLabel, style: Theme.of(context).textTheme.titleMedium), // To change value
        const SizedBox(height: 8), // what to do to load that message
        if (_selectedFile != null)
          Row(
            children: [
              const Icon(Icons.attach_file),  // This the icon for seeing the files on file
              const SizedBox(width: 8),   //The new code must be created in case ther is an error to ensure nothing falls
              Expanded(child: Text(_selectedFile!.path.split('/').last)),//The main file
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),//What the icon must do
                onPressed: () {
                  setState(() {
                    _selectedFile = null;
                    widget.onAttachmentPicked(null);
                  });
                },
                 tooltip: local.deleteItemTooltip,
                ),
            ],
          )
        else
          OutlinedButton.icon(
            onPressed: () => _pickFile(context),
            icon: const Icon(Icons.attach_file),
            label: Text(local.addAttachmentButtonLabel),//If there it has to display if its attached/able
          ),
      ],
    );
  }
}