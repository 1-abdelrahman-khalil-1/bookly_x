import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/staff/schedule/presentation/widgets/empty_state_appointments.dart';
import 'package:bookly_x_client/app/features/staff/schedule/presentation/widgets/staff_appointment_card.dart';
import 'package:bookly_x_client/app/features/staff/schedule/presentation/widgets/staff_header_section.dart';
import 'package:bookly_x_client/app/features/staff/schedule/presentation/widgets/staff_stats_row.dart';
import 'package:bookly_x_client/app/features/staff/schedule/presentation/widgets/staff_week_schedule_section.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class StaffScheduleScreen extends StatelessWidget {
  const StaffScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverToBoxAdapter(child: StaffHeaderSection()),
              const SliverToBoxAdapter(child: StaffStatsRow()),
              SliverToBoxAdapter(child: 32.h),
              const SliverToBoxAdapter(child: StaffWeekScheduleSection()),
              SliverAppBar(
                pinned: true,
                floating: true,
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.white,
                elevation: 0,
                toolbarHeight: 0,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(72),
                  child: Container(
                    color: AppColors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.textBorders.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TabBar(
                        labelStyle: context.bold14Primary,
                        unselectedLabelStyle: context.regular14TextSub,
                        labelColor: AppColors.primary,
                        unselectedLabelColor: AppColors.textSub,
                        dividerColor: Colors.transparent,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withValues(alpha: 0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        tabs: [
                          Tab(text: tr.todaysSchedule),
                          Tab(text: tr.upcoming),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              _AppointmentsList(
                appointments: [
                  StaffAppointmentCard(
                    name: 'Michael Chen',
                    service: 'Executive Haircut',
                    time: '09:00 AM',
                    duration: '45 min',
                    imageUrl: 'https://i.pravatar.cc/150?u=michael',
                    note: 'Regular client, prefers low fade.',
                  ),
                  StaffAppointmentCard(
                    name: 'Sarah Williams',
                    service: 'Hair Styling & Color',
                    time: '10:30 AM',
                    duration: '120 min',
                    imageUrl: 'https://i.pravatar.cc/150?u=sarah_w',
                  ),
                ],
              ),
              EmptyStateAppointments(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppointmentsList extends StatelessWidget {
  const _AppointmentsList({super.key, required this.appointments});
  final List appointments;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        return appointments[index];
      },
    );
  }
}
