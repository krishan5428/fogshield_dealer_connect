import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';

class FormActions extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onSaveDraft;
  final bool isNextLoading;

  const FormActions({
    super.key,
    required this.onNext,
    required this.onSaveDraft,
    this.isNextLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'SAVE DRAFT',
              isOutlined: true,
              onPressed: onSaveDraft,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CustomButton(
              text: 'NEXT',
              isLoading: isNextLoading,
              onPressed: onNext,
            ),
          ),
        ],
      ),
    );
  }
}