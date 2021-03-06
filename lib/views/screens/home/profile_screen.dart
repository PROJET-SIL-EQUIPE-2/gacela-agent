import 'package:flutter/material.dart';
import 'package:gacela_am/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'edit_profile_screen.dart';
import '../../../config/theme/colors.dart';
import '../../../config/theme/theme.dart';

class ProfileScreen extends StatelessWidget {
  static const route = "/profile";
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Mon compte",
          style: Theme.of(context).textTheme.headline2,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(height: 1, color: GacelaColors.gacelaGrey),
          const SizedBox(height: GacelaTheme.vDivider),
          Consumer<AuthProvider>(
            builder: (_, auth, __) => ListTile(
              onTap: () async =>
                  await Navigator.pushNamed(context, EditProfileScreen.route),
              title: Text(
                "${auth.user?.familyName} ${auth.user?.name}",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline2,
              ),
              subtitle: Text(
                "${auth.user?.email}",
                style: Theme.of(context).textTheme.headline4,
              ),
              trailing: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/images/agent.png"),
              ),
            ),
          ),
          const SizedBox(height: GacelaTheme.vDivider),
          const Divider(height: 1, color: GacelaColors.gacelaGrey),
          const SizedBox(height: GacelaTheme.vDivider),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: GacelaTheme.hPadding),
            child: Text(
              "G??n??ral",
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: GacelaColors.gacelaDeepBlue),
            ),
          ),
          const SizedBox(height: GacelaTheme.vDivider),
          ListTile(
            title: const Text("R??gulation de l'entreprise"),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Aide et support"),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Votre avis"),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            onTap: () {},
          ),
          ListTile(
            title: const Text("D??connexion"),
            onTap: () async =>
                await Provider.of<AuthProvider>(context, listen: false)
                    .logout(),
          ),
        ],
      ),
    );
  }
}
