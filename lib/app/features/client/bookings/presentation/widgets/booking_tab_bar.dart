import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class BookingTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;
  final List<String> tabs;

  const BookingTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.8),
        border: Border.all(color: Colors.black.withValues(alpha: 0.25)),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(6),
      child: Row(
        children: List.generate(
          tabs.length,
          (index) => Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: index < tabs.length - 1 ? 15 : 0),
              child: _buildTab(
                context,
                label: tabs[index],
                isActive: selectedIndex == index,
                onTap: () => onTabChange(index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(
    BuildContext context, {
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 37,
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.transparent,
            width: 1.108,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: isActive
              ? context.regular14White
              : context.regular14.copyWith(color: const Color(0xFF1A1A1A)),
        ),
      ),
    );
  }
}
