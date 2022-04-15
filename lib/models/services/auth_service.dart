import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../agent.dart';
import '../errors/failure.dart';

class AuthService {
  /// La connexion d'un locataire
  /// @param email      the email of the user
  /// @param password   the password of the user
  /// return a user if the email and password are true else return a Failure exception
  Future<Map<String, dynamic>?> login(String? email, String? password) async {
    final String url = '${dotenv.get("BASE_URL")}/mobile_login/agent';
    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "email": email,
            "password": password,
          }));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {"user": agentFromJson(response.body), "token": data["token"]};
      } else {
        final data = jsonDecode(response.body);
        throw Failure(data["errors"][0]["msg"], code: response.statusCode);
      }
    } on SocketException {
      throw Failure('No Internet connection 😑');
    } on HttpException {
      throw Failure("Couldn't find the post 😱");
    } on FormatException {
      throw Failure("Bad response format 👎");
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// reset le password d'un locataire
  /// @param email      the email of the user
  /// returns a message if success else returns a failure
  Future<String?> resetPassword(String? email) async {
    final String url = '${dotenv.get("BASE_URL")}/mobile_passwordReset/agent';
    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "email": email,
          }));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data["message"];
      } else {
        final data = jsonDecode(response.body);
        throw Failure(data["message"], code: response.statusCode);
      }
    } on SocketException {
      throw Failure('No Internet connection 😑');
    } on HttpException {
      throw Failure("Couldn't find the post 😱");
    } on FormatException {
      throw Failure("Bad response format 👎");
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// save fcm token
  /// @param token      fcm token
  /// @param agentId    agent id
  /// returns return true if the token is saved else returns a failure
  Future<bool?> saveNotificationToken(String? token, int? agentId) async {
    final String url = '${dotenv.get("BASE_URL")}/notifications/save-token';
    try {
      final response = await http.put(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "agent_id": agentId,
            "token": token,
          }));

      if (response.statusCode == 200) {
        return true;
      } else {
        final data = jsonDecode(response.body);
        throw Failure(data["errors"][0]["msg"], code: response.statusCode);
      }
    } on SocketException {
      throw Failure('No Internet connection 😑');
    } on HttpException {
      throw Failure("Couldn't find the post 😱");
    } on FormatException {
      throw Failure("Bad response format 👎");
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
