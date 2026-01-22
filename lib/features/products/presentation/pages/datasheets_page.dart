import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/datasheet_card.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';

class DatasheetsPage extends StatelessWidget {
  const DatasheetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Technical Datasheets'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return DatasheetCard(
            title: 'Technical Guide SEC-FSG${index + 1}',
            sku: 'FS-G1B-V${index + 1}',
            fileSize: '2.4 MB',
            onTap: () => context.push(RouteNames.datasheetViewer),
            onDownload: () {},
          );
        },
      ),
    );
  }
}