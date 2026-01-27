import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/edit_section_button.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';
// FIX: Removed the double slash '//' in the import path below
import 'package:fogshield_dealer_connect/features/quotation/presentation/providers/quotation_form_providers.dart';

class CustomerDetailsSection extends ConsumerWidget {
  const CustomerDetailsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watching the global quotation form state
    final formState = ref.watch(quotationFormProvider);

    // Helper to handle empty fields with a professional placeholder
    String displayValue(String? value) =>
        (value == null || value.trim().isEmpty) ? 'Not Provided' : value;

    // Safely construct the address string with improved formatting
    String fullAddress = '';
    final addressParts = [
      if (formState.billingAddress.isNotEmpty) formState.billingAddress,
      if (formState.billingCity.isNotEmpty) formState.billingCity,
      if (formState.billingState.isNotEmpty) formState.billingState,
    ];

    if (addressParts.isNotEmpty) {
      fullAddress = addressParts.join(', ');
      if (formState.billingPincode.isNotEmpty) {
        fullAddress += ' - ${formState.billingPincode}';
      }
    } else {
      fullAddress = 'Address not provided';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Customer Information',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 13,
                color: AppColors.black,
              ),
            ),
            EditSectionButton(onTap: () => context.push(RouteNames.quotationForm)),
          ],
        ),
        const SizedBox(height: 12),

        // Data rows now correctly pull from the unified provider instance
        _buildInfoRow(
          Icons.person_outline,
          displayValue(formState.customerName),
          'Customer Name',
        ),
        _buildInfoRow(
          Icons.phone_android_rounded,
          displayValue(formState.phoneNumber),
          'Phone Number',
        ),
        _buildInfoRow(
          Icons.email_outlined,
          displayValue(formState.email),
          'Email Address',
        ),
        _buildInfoRow(
          Icons.location_on_outlined,
          fullAddress,
          'Billing Address',
        ),

        // Only show company name if it was actually entered
        if (formState.companyName.isNotEmpty)
          _buildInfoRow(
            Icons.business_rounded,
            formState.companyName,
            'Company Name',
          ),
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
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.disabledGrey,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}