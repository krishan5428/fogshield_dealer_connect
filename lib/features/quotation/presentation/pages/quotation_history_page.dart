import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_list_item.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_search_bar.dart';
import 'package:fogshield_dealer_connect/core/providers/app_database_provider.dart';
import 'package:fogshield_dealer_connect/core/database/app_database.dart';

final historySearchProvider = StateProvider<String>((ref) => "");
final historySortProvider = StateProvider<String>((ref) => "Latest");

final filteredHistoryProvider = Provider<AsyncValue<List<Quotation>>>((ref) {
  final historyAsync = ref.watch(quotationHistoryStreamProvider);
  final query = ref.watch(historySearchProvider).toLowerCase();
  final sortOrder = ref.watch(historySortProvider);

  return historyAsync.whenData((list) {
    var filtered = list.where((q) {
      return q.customerName.toLowerCase().contains(query) ||
          q.id.toLowerCase().contains(query);
    }).toList();

    switch (sortOrder) {
      case 'Oldest':
        filtered.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        break;
      case 'High Amount':
        filtered.sort((a, b) => b.totalAmount.compareTo(a.totalAmount));
        break;
      case 'Low Amount':
        filtered.sort((a, b) => a.totalAmount.compareTo(b.totalAmount));
        break;
      default:
        filtered.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
    }
    return filtered;
  });
});

@RoutePage()
class QuotationHistoryPage extends ConsumerWidget {
  const QuotationHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(filteredHistoryProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Quotation History'),
      body: Column(
        children: [
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: QuotationSearchBar(
                    onChanged: (value) => ref.read(historySearchProvider.notifier).state = value,
                  ),
                ),
                const SizedBox(width: 12),
                _buildFilterButton(context, ref),
              ],
            ),
          ),
          Expanded(
            child: historyAsync.when(
              data: (quotations) {
                if (quotations.isEmpty) {
                  return const Center(child: Text('No results found', style: TextStyle(color: AppColors.disabledGrey)));
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: quotations.length,
                  itemBuilder: (context, index) => QuotationListItem(quotation: quotations[index]),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<String>(
      icon: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: AppColors.white, shape: BoxShape.circle, border: Border.all(color: AppColors.grey.withOpacity(0.3))),
        child: const Icon(Icons.tune_rounded, color: AppColors.colorAccent, size: 20),
      ),
      onSelected: (value) => ref.read(historySortProvider.notifier).state = value,
      itemBuilder: (context) => ['Latest', 'Oldest', 'High Amount', 'Low Amount']
          .map((choice) => PopupMenuItem(value: choice, child: Text(choice))).toList(),
    );
  }
}