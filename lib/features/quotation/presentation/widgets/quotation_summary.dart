import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/expandable_section.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/customer_details_section.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/products_summary_table.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/terms_conditions_section.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_meta_info.dart';

class QuotationSummary extends StatelessWidget {
  const QuotationSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        QuotationMetaInfo(),
        SizedBox(height: 20),
        ExpandableSection(
          title: 'Customer Details',
          icon: Icons.person_pin_outlined,
          child: CustomerDetailsSection(),
        ),
        ExpandableSection(
          title: 'Products & Pricing',
          icon: Icons.inventory_2_outlined,
          child: ProductsSummaryTable(),
        ),
        ExpandableSection(
          title: 'Terms & Conditions',
          icon: Icons.gavel_rounded,
          child: TermsConditionsSection(),
        ),
      ],
    );
  }
}