import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/expandable_section.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/customer_details_section.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/products_summary_table.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/terms_conditions_section.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_meta_info.dart';
import 'package:fogshield_dealer_connect/core/database/app_database.dart';

class QuotationSummary extends StatelessWidget {
  final Quotation quotation;
  final List<QuotationItem> items;

  const QuotationSummary({
    super.key,
    required this.quotation,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Meta info receives the real ID and Date
        QuotationMetaInfo(
          quotationId: quotation.id,
          date: quotation.createdAt,
        ),
        const SizedBox(height: 16),

        ExpandableSection(
          title: 'Customer Details',
          icon: Icons.person_pin_outlined,
          child: CustomerDetailsSection(quotation: quotation),
        ),
        ExpandableSection(
          title: 'Products & Pricing',
          icon: Icons.inventory_2_outlined,
          child: ProductsSummaryTable(
            items: items,
            totalAmount: quotation.totalAmount,
          ),
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