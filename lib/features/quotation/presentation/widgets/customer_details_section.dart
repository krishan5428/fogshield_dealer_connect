import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/edit_section_button.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';

class CustomerDetailsSection extends StatelessWidget {
  const CustomerDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Customer Information', style: TextStyle(fontWeight: FontWeight.bold)),
            EditSectionButton(onTap: () => context.push(RouteNames.quotationForm)),
          ],
        ),
        const SizedBox(height: 12),
        _buildInfoRow(Icons.person_outline, 'John Wick', 'Customer Name'),
        _buildInfoRow(Icons.phone_android_rounded, '+91 9899446573', 'Phone Number'),
        _buildInfoRow(Icons.location_on_outlined, '123, Continental Hotel, Sector 5, Gurugram, 122018', 'Billing Address'),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String value, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: AppColors.colorAccent),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 10, color: AppColors.disabledGrey)),
                Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}