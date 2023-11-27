import 'package:flutter/material.dart';

import '../controllers/data_store.dart';

class DeleteDialog extends StatefulWidget {
  final String itemName;
  final int index;
  final DataStore store;

  const DeleteDialog({required this.itemName, required this.index, required this.store});

  @override
  State<DeleteDialog> createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Confirmação'),
      content:
          Text('Tem certeza que deseja deletar o texto: ${widget.itemName}?'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            // Perform the deletion logic here
            widget.store.deleteItem(widget.index);
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Ok'),
        ),
      ],
    );
  }
}
