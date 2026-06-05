import 'package:auto_route/auto_route.dart';
import 'package:bookly_x/app/core/extensions/date_time_exensions.dart';
import 'package:bookly_x/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x/app/features/common/screens/notifications/data/models/notification_model.dart';
import 'package:bookly_x/app/features/common/screens/notifications/presentation/widgets/empty_notifications_widget.dart';
import 'package:bookly_x/app/features/common/screens/notifications/presentation/widgets/notification_item.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = NotificationModel.mockNotifications;

    return Scaffold(
      appBar: CustomAppbar(title: tr.notifications),
      body: notifications.isEmpty
          ? const EmptyNotificationsWidget()
          : ListView(
              padding: const EdgeInsets.all(16),
              children: _buildGroupedList(context, notifications),
            ),
    );
  }

  List<Widget> _buildGroupedList(
      BuildContext context, List<NotificationModel> notifications) {
    // Group notifications by groupingLabel (Today, Yesterday, Older)
    final grouped = groupBy(
      notifications,
      (NotificationModel n) => n.createdAt.groupingLabel,
    );

    final List<Widget> children = [];

    grouped.forEach((label, items) {
      children.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 12, top: 4),
          child: Text(
            label,
            style: context.bold16Black,
          ),
        ),
      );

      children.addAll(
        items.map(
          (notification) => NotificationItem(
            notification: notification,
            onTap: () {},
          ),
        ),
      );
    });

    return children;
  }
}
