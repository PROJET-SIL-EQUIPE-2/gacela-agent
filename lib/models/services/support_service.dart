import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gacela_am/models/support.dart';
import 'package:http/http.dart' as http;

import '../errors/failure.dart';

class SupportService {
  // get support list
  Future<List<Support>> getDemandesSupport(int? agentId) async {
    final String url = '${dotenv.get("BASE_URL")}/supports/$agentId';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> supportsAsMap = data["data"]["supports"];
        List<Support> supports = [];
        for (var element in supportsAsMap) {
          Support support = Support.fromJson(element);
          supports.add(support);
        }
        return supports;
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

  // get support list
  Future<bool> readDemandesSupport(int? demandeId) async {
    final String url = '${dotenv.get("BASE_URL")}/supports/$demandeId';
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
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
