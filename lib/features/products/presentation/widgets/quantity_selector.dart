import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class QuantitySelector extends StatefulWidget {
  final Function(int) onChanged;
  final int initialValue;

  const QuantitySelector({
    super.key,
    required this.onChanged,
    this.initialValue = 1,
  });

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialValue;
  }

  @override
  void didUpdateWidget(QuantitySelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Sync internal state if the parent widget updates the value (e.g. cart cleared)
    if (widget.initialValue != oldWidget.initialValue) {
      _quantity = widget.initialValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton(Icons.remove, () {
            // Changed from > 1 to > 0 to allow removing the item (setting to 0)
            if (_quantity > 0) {
              setState(() => _quantity--);
              widget.onChanged(_quantity);
            }
          }),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '$_quantity',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          _buildButton(Icons.add, () {
            setState(() => _quantity++);
            widget.onChanged(_quantity);
          }),
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(icon, size: 20, color: AppColors.colorCompanyPrimary),
      ),
    );
  }
}