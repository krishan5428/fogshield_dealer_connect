import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/widgets/expandable_section.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/customer_details_section.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/products_summary_table.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/terms_conditions_section.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_meta_info.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/providers/cart_providers.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/providers/quotation_form_providers.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class QuotationSummary extends ConsumerWidget {
  const QuotationSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch cart state to get the real-time total
    final cartState = ref.watch(cartProvider);

    return Column(
      children: [
        const QuotationMetaInfo(),
        const SizedBox(height: 16),

        const ExpandableSection(
          title: 'Customer Details',
          icon: Icons.person_pin_outlined,
          child: CustomerDetailsSection(),
        ),
        const ExpandableSection(
          title: 'Products & Pricing',
          icon: Icons.inventory_2_outlined,
          child: ProductsSummaryTable(),
        ),
        const ExpandableSection(
          title: 'Terms & Conditions',
          icon: Icons.gavel_rounded,
          child: TermsConditionsSection(),
        ),
      ],
    );
  }
}