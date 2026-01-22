import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_list_item.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_filter_chips.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_search_bar.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_sort_dropdown.dart';
import 'package:fogshield_dealer_connect/core/widgets/list_pagination_loader.dart';

class QuotationHistoryPage extends StatelessWidget {
  const QuotationHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Quotation Logs'),
      body: Column(
        children: [
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: const Column(
              children: [
                QuotationSearchBar(),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('FILTERS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1.0)),
                    QuotationSortDropdown(),
                  ],
                ),
              ],
            ),
          ),
          const QuotationFilterChips(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              physics: const BouncingScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                if (index == 5) return const ListPaginationLoader();
                return QuotationListItem(index: index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.colorCompanyPrimary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}