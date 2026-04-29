import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ClientManagePreferencesScreen extends StatefulWidget {
  const ClientManagePreferencesScreen({super.key});

  @override
  State<ClientManagePreferencesScreen> createState() =>
      _ClientManagePreferencesScreenState();
}

class _ClientManagePreferencesScreenState
    extends State<ClientManagePreferencesScreen> {
  bool _favoriteServices = true;
  bool _offersAndDeals = true;
  bool _languageUpdates = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: tr.manageFavorites),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          children: [
            SwitchListTile.adaptive(
              title: Text(tr.favorites),
              subtitle: Text(tr.manageFavorites),
            value: _favoriteServices,
            onChanged: (value) => setState(() => _favoriteServices = value),
          ),
          SwitchListTile.adaptive(
            title: Text(tr.offers),
            subtitle: Text(tr.availableOffers),
            value: _offersAndDeals,
            onChanged: (value) => setState(() => _offersAndDeals = value),
          ),
          SwitchListTile.adaptive(
            title: Text(tr.language),
            subtitle: Text(tr.chooseYourPreferredLanguage),
            value: _languageUpdates,
            onChanged: (value) => setState(() => _languageUpdates = value),
          ),
        ],
      ),
    ));
  }
}


