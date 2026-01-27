import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';

class DiscountSection extends StatefulWidget {
  final Function(double) onDiscountApplied;

  const DiscountSection({super.key, required this.onDiscountApplied});

  @override
  State<DiscountSection> createState() => _DiscountSectionState();
}

class _DiscountSectionState extends State<DiscountSection> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText;
  bool _isApplied = false;

  void _applyDiscount() {
    final code = _controller.text.trim().toUpperCase();

    // Logic for SECDLR10 to SECDLR50
    if (code.startsWith('SECDLR')) {
      final numericPart = code.replaceFirst('SECDLR', '');
      final discountValue = int.tryParse(numericPart);

      if (discountValue != null &&
          discountValue >= 10 &&
          discountValue <= 50 &&
          discountValue % 10 == 0) {

        // Pass the percentage (e.g., 0.20 for 20%) back to the parent
        widget.onDiscountApplied(discountValue / 100);

        setState(() {
          _errorText = null;
          _isApplied = true;
        });
        return;
      }
    }

    setState(() {
      _errorText = 'Invalid dealer code';
      _isApplied = false;
    });
    // Reset discount if invalid code entered
    widget.onDiscountApplied(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightGrey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: _isApplied ? Border.all(color: AppColors.connectionGreen, width: 1) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Apply Dealer Discount',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 13, color: AppColors.black),
              ),
              if (_isApplied)
                const Icon(Icons.check_circle, color: AppColors.connectionGreen, size: 16),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    fillColor: AppColors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    errorText: _errorText,
                    errorStyle: const TextStyle(fontSize: 10),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              CustomButton(
                text: _isApplied ? 'REPLACE' : 'APPLY',
                isFullWidth: false,
                size: ButtonSize.small,
                onPressed: _applyDiscount,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}