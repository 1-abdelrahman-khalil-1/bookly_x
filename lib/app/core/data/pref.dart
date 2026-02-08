import 'package:shared_preferences/shared_preferences.dart';

import 'agent_pref.dart';

class SharedPrefs {
  SharedPrefs._();

  static late final SharedPreferences instance;

  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
    await UserAgentPrefs.init();
  }
}
