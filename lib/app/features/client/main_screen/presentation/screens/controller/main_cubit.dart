import 'package:bookly_x_client/app/core/data/lang_pref.dart';
import 'package:bookly_x_client/app/features/client/bookings/presentation/screens/bookings_screen.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/screens/client_home_screen.dart';
import 'package:bookly_x_client/app/features/client/offers/presentation/screens/offers_screen.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<int> {
  MainCubit() : super(0);
  int selectedIndex = 0;
  List<Widget> pages = [
    const ClientHomeScreen(),
    Center(child: Text(tr.explore)),
    BookingsScreen(),
    OffersScreen(),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              isArabic
                  ? LangPrefs().setLangToEnglish()
                  : LangPrefs().setLangToArabic();

              globalRefContainer.invalidate(langPrefsProvider);
            },
            child: Text(
              tr.changeLanguage,
            ),
          ),
        ],
      ),
    ),
  ];
  void changeIndex(int index) {
    emit(index);
    selectedIndex = index;
  }
}
