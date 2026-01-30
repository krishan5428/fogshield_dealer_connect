import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class FloatingActionMenu extends StatefulWidget {
  final List<FloatingActionMenuItem> items;
  const FloatingActionMenu({super.key, required this.items});

  @override
  State<FloatingActionMenu> createState() => _FloatingActionMenuState();
}

class _FloatingActionMenuState extends State<FloatingActionMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isOpen = !_isOpen;
      _isOpen ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (_isOpen)
          ...widget.items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: FadeTransition(
                opacity: _controller,
                child: ScaleTransition(
                  scale: _controller,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                        ),
                        child: Text(
                          item.label,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 12),
                      FloatingActionButton.small(
                        heroTag: 'fab_$index',
                        onPressed: () {
                          _toggle();
                          item.onTap();
                        },
                        backgroundColor: AppColors.white,
                        foregroundColor: AppColors.colorCompanyPrimary,
                        child: Icon(item.icon),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        FloatingActionButton(
          onPressed: _toggle,
          backgroundColor: AppColors.colorCompanyPrimary,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _controller,
          ),
        ),
      ],
    );
  }
}

class FloatingActionMenuItem {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  FloatingActionMenuItem({
    required this.label,
    required this.icon,
    required this.onTap,
  });
}