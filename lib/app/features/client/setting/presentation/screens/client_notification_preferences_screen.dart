import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
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
  bool _appNotifications = true;

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
              SwitchListTile.adaptive(
                title: Text(tr.notifications),
                subtitle: Text(tr.manageNotificationPreferences),
                value: _appNotifications,
                onChanged: (value) => setState(() => _appNotifications = value),
              ),
            ],
          ),
        ));
  }
}
