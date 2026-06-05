import 'package:auto_route/auto_route.dart';
import 'package:bookly_x/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ClientPrivacySecurityScreen extends StatefulWidget {
  const ClientPrivacySecurityScreen({super.key});

  @override
  State<ClientPrivacySecurityScreen> createState() =>
      _ClientPrivacySecurityScreenState();
}

class _ClientPrivacySecurityScreenState
    extends State<ClientPrivacySecurityScreen> {
  bool _privateAccount = true;
  bool _loginAlerts = true;
  bool _dataSharing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: tr.privacyAndSecurity),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          children: [
            SwitchListTile.adaptive(
              title: Text(tr.privacyAndSecurity),
              subtitle: Text(tr.managePrivacySettings),
              value: _privateAccount,
              onChanged: (value) => setState(() => _privateAccount = value),
            ),
            SwitchListTile.adaptive(
              title: Text(tr.notifications),
              subtitle: Text(tr.warning),
              value: _loginAlerts,
              onChanged: (value) => setState(() => _loginAlerts = value),
            ),
            SwitchListTile.adaptive(
              title: Text(tr.managePrivacySettings),
              subtitle: Text(tr.info),
              value: _dataSharing,
              onChanged: (value) => setState(() => _dataSharing = value),
            ),
          ],
        ),
      ),
    );
  }
}
