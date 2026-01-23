import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class RecentActivity extends StatelessWidget {
  const RecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'RECENT QUOTATIONS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: AppColors.colorAccent,
                  letterSpacing: 1.0,
                ),
              ),
              TextButton(
                onPressed: () => context.push(RouteNames.quotationHistory),
                style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
                child: const Text(
                  'VIEW LOGS',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.grey.withOpacity(0.1)),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            separatorBuilder: (context, index) => Divider(height: 1, color: AppColors.grey.withOpacity(0.1)),
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => context.push(RouteNames.quotationDetail),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: CircleAvatar(
                  backgroundColor: AppColors.redBg.withOpacity(0.1),
                  radius: 20,
                  child: const Icon(Icons.description_outlined, color: AppColors.colorCompanyPrimary, size: 20),
                ),
                title: Text(
                  'Customer ID #00${index + 82}',
                  style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
                ),
                subtitle: const Text('Generated • Today, 09:15 AM', style: TextStyle(fontSize: 11)),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      '₹45,200',
                      style: TextStyle(fontWeight: FontWeight.w900, color: AppColors.black, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.greenBg.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'SENT',
                        style: TextStyle(fontSize: 9, color: AppColors.green, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}