import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_status_badge.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/swipe_action_buttons.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';

class QuotationListItem extends StatelessWidget {
  final int index;
  const QuotationListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final statuses = [QuotationStatus.sent, QuotationStatus.draft, QuotationStatus.accepted, QuotationStatus.rejected];
    final status = statuses[index % 4];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey.withOpacity(0.2)),
      ),
      child: InkWell(
        onTap: () => context.push(RouteNames.quotationDetail),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'QT-2026-00${82 + index}',
                    style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13, color: AppColors.colorCompanyPrimary),
                  ),
                  QuotationStatusBadge(status: status),
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
                          'Customer Name ${index + 1}',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const Text('22 Jan 2026 • 10:30 AM', style: TextStyle(fontSize: 11, color: AppColors.disabledGrey)),
                      ],
                    ),
                  ),
                  Text(
                    '₹${(index + 1) * 45200}',
                    style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                  ),
                ],
              ),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.inventory_2_outlined, size: 14, color: AppColors.disabledGrey),
                      SizedBox(width: 4),
                      Text('3 Items', style: TextStyle(fontSize: 11, color: AppColors.disabledGrey)),
                    ],
                  ),
                  SwipeActionButtons(
                    onDelete: () {},
                    onShare: () {},
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