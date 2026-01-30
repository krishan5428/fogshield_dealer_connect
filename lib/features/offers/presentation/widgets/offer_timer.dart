import 'package:flutter/material.dart';

class OfferTimer extends StatelessWidget {
  final DateTime expiryDate;

  const OfferTimer({super.key, required this.expiryDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.timer_outlined, color: Colors.white, size: 12),
          SizedBox(width: 4),
          Text(
            '12h : 45m', // Mock static timer
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}