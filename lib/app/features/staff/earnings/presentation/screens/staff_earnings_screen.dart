import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/features/staff/earnings/presentation/widgets/earnings_dashboard_widget.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';

class StaffEarningsScreen extends StatefulWidget {
  const StaffEarningsScreen({super.key});

  @override
  State<StaffEarningsScreen> createState() => _StaffEarningsScreenState();
}

class _StaffEarningsScreenState extends State<StaffEarningsScreen> {
  int _selectedTabIndex = 1; // Default to Weekly based on design

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        initialIndex: _selectedTabIndex,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TabBar(
                  onTap: (i) => setState(() => _selectedTabIndex = i),
                  labelColor: AppColors.white,
                  unselectedLabelColor: AppColors.textMain,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: AppColors.dodgerBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  dividerColor: Colors.transparent,
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                  unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w500, fontFamily: 'Inter'),
                  tabs: [
                    Tab(text: tr.daily),
                    Tab(text: tr.weekly),
                    Tab(text: tr.monthly),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  EarningsDashboardWidget(filterType: 'daily'),
                  EarningsDashboardWidget(filterType: 'weekly'),
                  EarningsDashboardWidget(filterType: 'monthly'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
