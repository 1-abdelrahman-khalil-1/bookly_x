import 'dart:convert';

import 'package:bookly_x_client/app/core/constants/constants.dart';
import 'package:bookly_x_client/app/core/data/pref.dart';
import 'package:bookly_x_client/app/core/enums/user_type.dart';
import 'package:bookly_x_client/app/core/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = Provider<UserModel>((ref) {
  return UserModel.fromJson(UserPrefs.getUser());
});
const sharedTokenId = 'token';
const testToken =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZXNzaW9uSWQiOjksInRva2VuIjoiY2ZhZWQ2MzYtYWZlYS00Yjg2LTgxZWYtN2NmMWVmZDEzNWFmIiwiaWF0IjoxNjk3Mjk4NTc0fQ.YaUz-9-9zESDfuJW968jV5Q276_RKmXyttmPZIOYfzM';

class UserPrefs {
  UserPrefs._();

  static final prefs = SharedPrefs.instance;

  static Future<void> setUserToken(String token) async {
    await prefs.setString(sharedTokenId, 'Bearer $token');
  }

  static Future<void> setRefreshToken(String refreshToken) async {
    await prefs.setString('refreshToken', refreshToken);
  }

  static Future<void> setUser(Json user) async {
    await prefs.setString('user', jsonEncode(user));
  }

  static Future<void> setRememberMe(bool rememberMe) async {
    await prefs.setBool('rememberMe', rememberMe);
  }

  static bool get rememberMe => prefs.getBool('rememberMe') ?? false;

  static Future<void> setUserType(UserType type) async {
    await prefs.setString('userType', type.name);
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

  static String getRefreshToken() => prefs.getString('refreshToken') ?? '';
  static String getUserToken() => prefs.getString(sharedTokenId) ?? '';
  static UserType getUserType() =>
      UserType.fromString(prefs.getString('userType') ?? '');

  /// Logout user by clearing all user-related data
  static Future<void> logout() async {
    await prefs.remove(sharedTokenId);
    await prefs.remove('user');
    await prefs.remove('refreshToken');
    await prefs.remove('rememberMe');
    await prefs.remove('userType');
  }

  static Future<void> setUserTopic(List<String> topics) async {
    await prefs.setStringList('topics', topics);
  }

  static List<String>? getUserTopic() => prefs.getStringList('topics');

  static bool get isUserLoggedIn => getUserToken().isNotEmpty;

  static bool get isUserStaff => getUserType() == UserType.staff;
}
