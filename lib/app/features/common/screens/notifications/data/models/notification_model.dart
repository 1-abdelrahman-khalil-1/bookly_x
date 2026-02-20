import 'package:bookly_x_client/app/features/common/screens/notifications/data/models/enum/notification_type.dart';

class NotificationModel {
  final int id;
  final String title;
  final String body;
  final DateTime createdAt;
  final bool isRead;
  final NotificationType type;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.isRead,
    required this.type,
  });
  //copy with is read
  NotificationModel copyWith({bool? isRead}) {
    return NotificationModel(
      id: id,
      title: title,
      body: body,
      createdAt: createdAt,
      isRead: isRead ?? this.isRead,
      type: type,
    );
  }
  // Mock data for testing
  static List<NotificationModel> get mockNotifications {
    final now = DateTime.now();
    return [
      NotificationModel(
        id: 1,
        title: 'Booking Confirmed',
        body:
            'Your appointment with Elite Barber Studio has been confirmed for tomorrow at 10:00 AM.',
        createdAt: now.subtract(const Duration(hours: 2)), // Today
        isRead: false,
        type: NotificationType.booking,
      ),
      NotificationModel(
        id: 2,
        title: 'Special Offer',
        body: 'Get 20% off on all massage services this weekend!',
        createdAt: now.subtract(const Duration(hours: 5)), // Today
        isRead: true,
        type: NotificationType.promo,
      ),
      NotificationModel(
        id: 3,
        title: 'Appointment Reminder',
        body: 'Don\'t forget your appointment today at 3:00 PM.',
        createdAt: now.subtract(const Duration(days: 1, hours: 3)), // Yesterday
        isRead: true,
        type: NotificationType.reminder,
      ),
      NotificationModel(
        id: 4,
        title: 'Payment Successful',
        body: 'Your payment of \$45.00 has been processed successfully.',
        createdAt: now.subtract(const Duration(days: 1, hours: 8)), // Yesterday
        isRead: true,
        type: NotificationType.payment,
      ),
      NotificationModel(
        id: 5,
        title: 'Welcome to Bookly',
        body: 'Thanks for joining! Start booking your favorite services now.',
        createdAt: now.subtract(const Duration(days: 5)), // Older
        isRead: true,
        type: NotificationType.info,
      ),
    ];
  }
}
