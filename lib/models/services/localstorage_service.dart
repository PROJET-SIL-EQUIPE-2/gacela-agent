import 'dart:convert';

import 'package:gacela_am/models/agent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  /// Save user info in the localstorage of the device
  /// @param token      auth token
  /// @param userId     represent the user id
  /// returns true if saved else false
  Future<bool> saveUser(String? token, Agent? user) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final body = {
        "gacela_token": token,
        "user_id": user?.id.toString(),
        "email": user?.email,
        "phone_number": user?.phoneNumber,
        "family_name": user?.familyName,
        "name": user?.name,
      };
      await prefs.setString(
        "gacela_agent",
        json.encode(body),
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// Get user info from the localstorage
  /// return User data from localstorage else null
  static Future<Map<String, dynamic>?> getUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final userAsString = prefs.getString("gacela_agent");
      if (userAsString == null) return null;
      final userData = json.decode(userAsString);
      return userData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static clearLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
