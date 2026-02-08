import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import 'pref.dart';

final userAgentProvider = Provider((ref) {
  return UserAgentPrefs();
});

class UserAgentPrefs {
  static final prefs = SharedPrefs.instance;
  static const userAgentKey = 'userAgent';

  static Future<void> init() async {
    final user = await userAgent();
    await prefs.setString(userAgentKey, user);
  }

  static String get getUserAgent {
    final us = prefs.getString(userAgentKey) ?? '';
    return us;
  }
}
