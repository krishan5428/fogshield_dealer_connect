import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class ZoomControls extends StatelessWidget {
  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;
  final VoidCallback onReset;

  const ZoomControls({
    super.key,
    required this.onZoomIn,
    required this.onZoomOut,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildFab(Icons.add, onZoomIn),
        const SizedBox(height: 12),
        _buildFab(Icons.remove, onZoomOut),
        const SizedBox(height: 12),
        _buildFab(Icons.fullscreen_exit_rounded, onReset),
      ],
    );
  }

  Widget _buildFab(IconData icon, VoidCallback onTap) {
    return FloatingActionButton.small(
      heroTag: null,
      onPressed: onTap,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.colorCompanyPrimary,
      elevation: 4,
      child: Icon(icon),
    );
  }
}