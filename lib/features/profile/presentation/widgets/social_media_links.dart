import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class SocialMediaLinks extends StatelessWidget {
  const SocialMediaLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialIcon(icon: Icons.facebook_rounded, color: Colors.blue.shade800),
        const SizedBox(width: 20),
        _SocialIcon(icon: Icons.camera_alt_rounded, color: Colors.pink.shade400),
        const SizedBox(width: 20),
        _SocialIcon(icon: Icons.alternate_email_rounded, color: Colors.blue.shade400),
        const SizedBox(width: 20),
        _SocialIcon(icon: Icons.play_arrow_rounded, color: Colors.red.shade700),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _SocialIcon({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 28),
      ),
    );
  }
}