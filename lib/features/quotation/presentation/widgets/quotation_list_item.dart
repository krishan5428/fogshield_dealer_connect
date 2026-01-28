import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';
import 'package:fogshield_dealer_connect/core/database/app_database.dart';

class QuotationListItem extends StatelessWidget {
  final Quotation quotation;

  const QuotationListItem({super.key, required this.quotation});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey.withOpacity(0.2)),
      ),
      child: InkWell(
        onTap: () => context.push(RouteNames.quotationDetail, extra: quotation.id),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    quotation.id,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                      color: AppColors.colorCompanyPrimary,
                    ),
                  ),
                  // Note: QuotationStatusBadge removed per requirement
                  Text(
                    DateFormat('dd MMM yyyy').format(quotation.createdAt),
                    style: const TextStyle(fontSize: 11, color: AppColors.disabledGrey),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.lightGrey,
                    radius: 18,
                    child: const Icon(Icons.person_outline, size: 18, color: AppColors.colorAccent),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          quotation.customerName,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          DateFormat('hh:mm a').format(quotation.createdAt),
                          style: const TextStyle(fontSize: 11, color: AppColors.disabledGrey),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '₹${quotation.totalAmount.toStringAsFixed(0)}',
                    style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}