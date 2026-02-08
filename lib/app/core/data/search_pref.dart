import 'pref.dart';

const sharedSearch = 'search';

class SearchPrefs {
  SearchPrefs._();

  static final prefs = SharedPrefs.instance;

  static Future<void> setSearch(List<String> search) =>
      prefs.setStringList(sharedSearch, search);

  static List<String> getSearch() => prefs.getStringList(sharedSearch) ?? [];

  static Future<void> deleteSearch() async => prefs.remove(sharedSearch);
}
