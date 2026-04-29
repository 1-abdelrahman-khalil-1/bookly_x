import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:bookly_x_client/app/features/staff/alerts/presentation/widgets/staff_notification_card.dart';

@RoutePage()
class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(tr.alerts, style: context.bold20Black),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr.manageYourBookingRequests,
              style: context.regular14Black.copyWith(color: const Color(0xFF6B7280)),
            ),
            24.h,
            Expanded(
              child: ListView(
                children: [
                  StaffNotificationCard(
                    userName: 'Rachel Green',
                    userImage: 'https://i.pravatar.cc/150?img=5',
                    status: NotificationStatus.pending,
                    date: '28 Nov 2024',
                    time: '10:00 ${tr.am}',
                    duration: '30',
                    timeAgo: '10 ${tr.minAgo}',
                    onAccept: () {},
                    onReject: () {},
                  ),
                  StaffNotificationCard(
                    userName: 'Ross Geller',
                    userImage: 'https://i.pravatar.cc/150?img=11',
                    status: NotificationStatus.rejected,
                    date: '28 Nov 2024',
                    time: '11:00 ${tr.am}',
                    duration: '45',
                    timeAgo: '2 ${tr.hourAgo}',
                    onAccept: () {},
                    onReject: () {},
                  ),
                  StaffNotificationCard(
                    userName: 'Monica Geller',
                    userImage: 'https://i.pravatar.cc/150?img=9',
                    status: NotificationStatus.accepted,
                    date: '29 Nov 2024',
                    time: '02:00 ${tr.pm}',
                    duration: '60',
                    timeAgo: '1 ${tr.ago}', // 1 day ago maybe?
                    onAccept: () {},
                    onReject: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
