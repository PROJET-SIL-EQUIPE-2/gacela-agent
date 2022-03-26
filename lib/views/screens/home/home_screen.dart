import 'package:flutter/material.dart';
import 'package:gacela_am/views/screens/home/profile_screen.dart';
import 'package:provider/provider.dart';

import '../../../config/theme/theme.dart';
import '../../../providers/auth_provider.dart';
import '../../widgets.dart';

class HomeScreen extends StatelessWidget {
  static const route = "/";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: GacelaTheme.hPadding),
        child: Consumer<AuthProvider>(
          builder: (ctx, auth, _) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: gacelaButton(
                  text: "profile",
                  onPressed: () async {
                    await Navigator.pushNamed(context, ProfileScreen.route);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
