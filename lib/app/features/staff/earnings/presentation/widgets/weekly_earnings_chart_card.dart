import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyEarningsChartCard extends StatefulWidget {
  const WeeklyEarningsChartCard({super.key});

  @override
  State<WeeklyEarningsChartCard> createState() =>
      _WeeklyEarningsChartCardState();
}

class _WeeklyEarningsChartCardState extends State<WeeklyEarningsChartCard> {
  int touchedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tr.weeklyEarnings,
                  style: context.bold16Primary
                      .copyWith(color: AppColors.textMain)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.zumthor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '+12% ${tr.vsLastWeek}',
                  style: context.regular12Primary.copyWith(
                    color: AppColors.dodgerBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          32.h,
          SizedBox(
            height: 160,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 500,
                minY: 0,
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (group) => AppColors.textMain,
                    tooltipPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    tooltipMargin: 8,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        '\$${rod.toY.toInt()}',
                        context.bold12White.copyWith(fontFamily: 'Inter'),
                      );
                    },
                  ),
                  touchCallback: (FlTouchEvent event, barTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          barTouchResponse == null ||
                          barTouchResponse.spot == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          barTouchResponse.spot!.touchedBarGroupIndex;
                    });
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        final style = context.medium12TextSub
                            .copyWith(fontFamily: 'Inter');
                        String text;
                        switch (value.toInt()) {
                          case 0:
                            text = 'M';
                            break;
                          case 1:
                            text = 'T';
                            break;
                          case 2:
                            text = 'W';
                            break;
                          case 3:
                            text = 'T';
                            break;
                          case 4:
                            text = 'F';
                            break;
                          case 5:
                            text = 'S';
                            break;
                          case 6:
                            text = 'S';
                            break;
                          default:
                            text = '';
                            break;
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            text,
                            style: touchedIndex == value.toInt()
                                ? context.bold12TextMain
                                    .copyWith(fontFamily: 'Inter')
                                : style,
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 250,
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(
                      color: AppColors.textBorders,
                      strokeWidth: 1,
                    );
                  },
                ),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    bottom: BorderSide(color: AppColors.textBorders),
                  ),
                ),
                barGroups: [
                  _buildBarGroup(0, 200),
                  _buildBarGroup(1, 150),
                  _buildBarGroup(2, 300),
                  _buildBarGroup(3, 480), // touched default
                  _buildBarGroup(4, 250),
                  _buildBarGroup(5, 100),
                  _buildBarGroup(6, 200),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _buildBarGroup(int x, double y) {
    final isTouched = touchedIndex == x;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: isTouched ? AppColors.textMain : AppColors.catskillWhite,
          width: 24,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
      ],
      showingTooltipIndicators: isTouched ? [0] : [],
    );
  }
}
