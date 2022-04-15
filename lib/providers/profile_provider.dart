import 'package:gacela_am/models/services/profile_service.dart';

import '../models/agent.dart';

class ProfileProvider {
  late Agent agent;
  late String token;

  ProfileProvider({
    required this.agent,
    required this.token,
  });

  Future<Map<String, dynamic>> changePassword(
      String? oldPassword, String? newPassword) async {
    final ProfileService profileService =
        ProfileService(agent: agent, token: token);

    return await profileService.changePassword(oldPassword, newPassword);
  }

  Future<Map<String, dynamic>> changeEmail(String? newEmail) async {
    final ProfileService profileService =
        ProfileService(agent: agent, token: token);

    return await profileService.changeEmail(newEmail);
  }
}
