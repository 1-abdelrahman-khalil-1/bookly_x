import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/features/staff/earnings/presentation/widgets/monthly_trend_chart_card.dart';
import 'package:bookly_x/app/features/staff/earnings/presentation/widgets/recent_services_list.dart';
import 'package:bookly_x/app/features/staff/earnings/presentation/widgets/total_earnings_summary_card.dart';
import 'package:bookly_x/app/features/staff/earnings/presentation/widgets/weekly_earnings_chart_card.dart';
import 'package:flutter/material.dart';

class EarningsDashboardWidget extends StatelessWidget {
  const EarningsDashboardWidget({super.key, required this.filterType});

  final String filterType;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        const TotalEarningsSummaryCard(),
        16.h,
        const WeeklyEarningsChartCard(),
        16.h,
        const MonthlyTrendChartCard(),
        16.h,
        const RecentServicesList(),
        24.h,
      ],
    );
  }
}
