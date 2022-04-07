import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../config/theme/colors.dart';
import '../../../config/theme/theme.dart';
import '../../widgets.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  static const route = "/";
  const HomeScreen({Key? key}) : super(key: key);
  final double _globalProgress = 0.7;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Bonjour agentName",
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline2,
        ),
        leading: IconButton(
          onPressed: () async =>
              Navigator.pushNamed(context, ProfileScreen.route),
          icon: const CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async =>
                await Navigator.pushNamed(context, NotificationsScreen.route),
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: GacelaTheme.hPadding),
          child: Column(
            children: [
              const SizedBox(height: GacelaTheme.vDivider),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    )
                  ],
                ),
                child: CircularPercentIndicator(
                  backgroundColor: Colors.white,
                  radius: screenSize.width * 0.2,
                  lineWidth: 20.0,
                  percent: _globalProgress,
                  center: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                        text: "${(_globalProgress * 100).toStringAsFixed(0)}%",
                        style: const TextStyle(
                            color: GacelaColors.gacelaBlue,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      const TextSpan(
                        text: "\nCompleté\naujourd'hui",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ]),
                  ),
                  progressColor: GacelaColors.gacelaBlue,
                ),
              ),
              const SizedBox(height: GacelaTheme.vDivider),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  gacelaCard(
                    width: screenSize.width * 0.4,
                    height: screenSize.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "9",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: GacelaColors.gacelaDeepBlue),
                        ),
                        const Text(
                          "Tâches à compléter",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  gacelaCard(
                    color: GacelaColors.gacelaLightOrange,
                    width: screenSize.width * 0.4,
                    height: screenSize.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "6",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: GacelaColors.gacelaDeepBlue),
                        ),
                        const Text(
                          "automobiles associés",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: GacelaTheme.vDivider),
              Row(
                children: [
                  Text(
                    "Les tâches qui vous attendent...",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: GacelaTheme.vDivider),
              Column(
                children: [
                  gacelaListTile(
                    progress: 0.3,
                    title: "Obstacle",
                    description: "Intervenez pour débloquer le passage",
                  ),
                  gacelaListTile(
                    cardColor: GacelaColors.gacelaPurple,
                    progress: 0.9,
                    title: "Obstacle",
                    description: "Intervenez pour débloquer le passage",
                  ),
                  gacelaListTile(
                    cardColor: GacelaColors.gacelaPurple,
                    progress: 0.6,
                    title: "Obstacle",
                    description: "Intervenez pour débloquer le passage",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
