import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../config/theme/colors.dart';
import '../../../config/theme/theme.dart';
import '../../../models/notifier_state.dart';
import '../../../providers/auth_provider.dart';
import '../../../utilities/validation.dart';
import '../../screens.dart';
import '../../widgets.dart';

class LoginScreen extends StatefulWidget {
  static const route = "/login";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = "";
  String _password = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    void _submit() async {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        await Provider.of<AuthProvider>(context, listen: false)
            .login(_email, _password);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: GacelaTheme.hPadding),
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/logo.svg",
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  Text(
                    "Agent App",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: GacelaColors.gacelaGrey),
                  ),
                  Text(
                    "Connectez-vous",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(height: 2 * GacelaTheme.vDivider),
                  Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: GacelaTheme.hPadding),
                        child: Column(
                          children: [
                            gacelaTextFormField(
                              hintText: "Adresse e-mail",
                              onSaved: (value) {
                                _email = value?.trim() ?? "";
                              },
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) => emailValidation(
                                  value, "L'adresse email est erron??"),
                            ),
                            const SizedBox(height: GacelaTheme.vDivider),
                            gacelaTextFormField(
                              hintText: "Mot de passe",
                              onSaved: (value) {
                                _password = value?.trim() ?? "";
                              },
                              obscureText: true,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) => notEmptyField(value, 8,
                                  "Le mot de passe doit ??tre +8 caract??re"),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                gacelaLinkButton(
                                  text: "Mot de passe oubli?? ?",
                                  onPressed: () async {
                                    Navigator.pushNamed(
                                        context, ResetPasswordScreen.route);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 2 * GacelaTheme.vDivider),
                          ],
                        ),
                      )),
                  Consumer<AuthProvider>(
                    builder: (ctx, authProvider, _) {
                      if (authProvider.state == NotifierState.initial) {
                        return gacelaButton(
                          text: "Connexion",
                          onPressed: _submit,
                        );
                      } else if (authProvider.state == NotifierState.loading) {
                        return const CircularProgressIndicator();
                      } else if (authProvider.failure != null) {
                        return Column(
                          children: [
                            gacelaErrorText(
                                text: authProvider.failure!.message),
                            gacelaButton(
                              text: "Connexion",
                              onPressed: _submit,
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
