import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_text_field.dart';

class QuantityDialog extends StatefulWidget {
  final int initialQuantity;
  const QuantityDialog({super.key, required this.initialQuantity});

  @override
  State<QuantityDialog> createState() => _QuantityDialogState();
}

class _QuantityDialogState extends State<QuantityDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialQuantity.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Update Quantity'),
      content: CustomTextField(
        label: 'Quantity',
        controller: _controller,
        keyboardType: TextInputType.number,
        hint: 'Enter number',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('CANCEL'),
        ),
        CustomButton(
          text: 'UPDATE',
          isFullWidth: false,
          onPressed: () => Navigator.pop(context, int.tryParse(_controller.text)),
        ),
      ],
    );
  }
}