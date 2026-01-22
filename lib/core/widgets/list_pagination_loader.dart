import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/loading_indicator.dart';

class ListPaginationLoader extends StatelessWidget {
  const ListPaginationLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            LoadingIndicator(size: 20, strokeWidth: 2),
            SizedBox(width: 12),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 12, color: AppColors.disabledGrey, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}