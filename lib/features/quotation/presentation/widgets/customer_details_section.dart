import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/database/app_database.dart';

class CustomerDetailsSection extends StatelessWidget {
  final Quotation quotation;

  const CustomerDetailsSection({super.key, required this.quotation});

  @override
  Widget build(BuildContext context) {
    // Construct Billing Address String
    final billingAddr = [
      if (quotation.billingAddress.isNotEmpty) quotation.billingAddress,
      if (quotation.billingCity.isNotEmpty) quotation.billingCity,
      if (quotation.billingState.isNotEmpty) quotation.billingState,
    ].join(', ') + (quotation.billingPincode.isNotEmpty ? ' - ${quotation.billingPincode}' : '');

    // Construct Shipping Address String
    final shippingAddr = quotation.sameAsBilling
        ? 'Same as Billing'
        : [
      if (quotation.shippingAddress.isNotEmpty) quotation.shippingAddress,
      if (quotation.shippingCity.isNotEmpty) quotation.shippingCity,
      if (quotation.shippingState.isNotEmpty) quotation.shippingState,
    ].join(', ') + (quotation.shippingPincode.isNotEmpty ? ' - ${quotation.shippingPincode}' : '');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        _buildInfoRow(
          Icons.person_outline,
          quotation.customerName,
          'Customer Name',
        ),
        _buildInfoRow(
          Icons.phone_android_rounded,
          quotation.phoneNumber,
          'Phone Number',
        ),
        if (quotation.email != null && quotation.email!.isNotEmpty)
          _buildInfoRow(
            Icons.email_outlined,
            quotation.email!,
            'Email Address',
          ),
        if (quotation.companyName.isNotEmpty)
          _buildInfoRow(
            Icons.business_rounded,
            quotation.companyName,
            'Company Name',
          ),
        if (quotation.gstNumber != null && quotation.gstNumber!.isNotEmpty)
          _buildInfoRow(
            Icons.receipt_long_outlined,
            quotation.gstNumber!,
            'GST Number',
          ),

        const Divider(height: 24, thickness: 0.5),

        // Billing Address Row
        _buildInfoRow(
          Icons.location_on_outlined,
          billingAddr.isEmpty ? 'Not Provided' : billingAddr,
          'Billing Address',
        ),

        // Shipping Address Row
        _buildInfoRow(
          Icons.local_shipping_outlined,
          shippingAddr,
          'Shipping Address',
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
                    fontSize: 13,
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