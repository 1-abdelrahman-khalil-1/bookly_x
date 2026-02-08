import 'dart:convert';

import 'package:bookly_x_client/app/core/constants/constants.dart';
import 'package:bookly_x_client/app/core/data/pref.dart';

const sharedTokenId = 'token';
const testToken =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZXNzaW9uSWQiOjksInRva2VuIjoiY2ZhZWQ2MzYtYWZlYS00Yjg2LTgxZWYtN2NmMWVmZDEzNWFmIiwiaWF0IjoxNjk3Mjk4NTc0fQ.YaUz-9-9zESDfuJW968jV5Q276_RKmXyttmPZIOYfzM';

class UserPrefs {
  UserPrefs._();

  static final prefs = SharedPrefs.instance;

  static Future<void> setUserToken(String token) async {
    await prefs.setString(sharedTokenId, 'Bearer $token');
  }

  static Future<void> setTempToken(String token) async {
    await prefs.setString('temp', 'Bearer $token');
  }

  static Future<void> setUser(Json user) async {
    await prefs.setString('user', jsonEncode(user));
  }

  static Future<void> setUserFcmToken(String fcm) async {
    await prefs.setString('fcm', fcm);
  }

  static String getUserFcmToken() => prefs.getString('fcm') ?? '';

  static Json getUser<T>() {
    final userString = prefs.getString('user');
    final Map<String, dynamic> userMap = jsonDecode(userString ?? '{}');
    return userMap;
  }

  static String getUserToken() => prefs.getString(sharedTokenId) ?? '';
  static String getTempToken() => prefs.getString('temp') ?? '';

  static Future<void> setAddressesMaxCount(int count) =>
      prefs.setInt('addressesMaxCount', count);

  static Future<void> setAddressesLength(int count) =>
      prefs.setInt('addressesLength', count);

  /// Logout user by clearing all user-related data
  static Future<void> logout() async {
    await prefs.remove(sharedTokenId);
    await prefs.remove('user');
    await prefs.remove('temp');
  }

  static Future<void> setUserTopic(List<String> topics) async {
    await prefs.setStringList('topics', topics);
  }

  static List<String>? getUserTopic() => prefs.getStringList('topics');

  static bool get isUserLoggedIn => getUserToken().isNotEmpty;

  // static UserModel? getCurrentUser() {
  //   final userJson = getUser();
  //   // if (userJson.isEmpty) return null;
  //   try {
  //     final user = UserModel.fromJson(userJson);
  //     return user;
  //   } catch (e) {
  //     return null;
  //   }
  // }
}
