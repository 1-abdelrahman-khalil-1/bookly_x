import 'package:auto_route/auto_route.dart';
import 'package:bookly_x/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ClientNotificationPreferencesScreen extends StatefulWidget {
  const ClientNotificationPreferencesScreen({super.key});

  @override
  State<ClientNotificationPreferencesScreen> createState() =>
      _ClientNotificationPreferencesScreenState();
}

class _ClientNotificationPreferencesScreenState
    extends State<ClientNotificationPreferencesScreen> {
  bool _bookingAlerts = true;
  bool _offerAlerts = true;
  final bool _appNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(title: tr.manageNotificationPreferences),
        body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Column(
            children: [
              SwitchListTile.adaptive(
                title: Text(tr.bookings),
                subtitle: Text(tr.notifications),
                value: _bookingAlerts,
                onChanged: (value) => setState(() => _bookingAlerts = value),
              ),
              SwitchListTile.adaptive(
                title: Text(tr.offers),
                subtitle: Text(tr.notifications),
                value: _offerAlerts,
                onChanged: (value) => setState(() => _offerAlerts = value),
              ),
            ],
          ),
        ));
  }
}
