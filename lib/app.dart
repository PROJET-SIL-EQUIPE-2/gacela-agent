import 'package:flutter/material.dart';
import 'package:gacela_am/config/routes/routes.dart';
import 'package:gacela_am/config/theme/theme.dart';
import 'package:gacela_am/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class GacelaAMApp extends StatelessWidget {
  const GacelaAMApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gacela',
        theme: GacelaTheme.gacelaTheme,
        routes: Routes.routes,
        initialRoute: "/main",
/*         debugShowCheckedModeBanner: false,
 */      ),
    );
  }
}
