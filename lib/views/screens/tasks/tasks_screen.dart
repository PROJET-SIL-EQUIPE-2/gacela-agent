import 'package:flutter/material.dart';
import 'package:gacela_am/config/theme/theme.dart';
import 'package:gacela_am/views/screens/home/home_screen.dart';
import 'package:gacela_am/views/screens/tasks/task_details.dart';
import '../../../config/theme/colors.dart';
import '../../widgets.dart';

class TasksScreen extends StatelessWidget {
  static const route = "/";
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
              indicatorColor: GacelaColors.gacelaDeepBlue,
              labelColor: GacelaColors.gacelaDeepBlue,
              unselectedLabelColor: GacelaColors.gacelaGrey,
              labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              tabs: [
                Tab(text: "Tous"),
                Tab(text: "Urgent"),
                Tab(text: "Important"),
                Tab(text: "élémentaire"),
              ]),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Mes taches",
            style: Theme.of(context).textTheme.headline2,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () => () {},
          ),
        ),
        body: TabBarView(children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: GacelaTheme.hPadding),
                child: Column(
                  children: [
                    const SizedBox(height: GacelaTheme.vDivider),
                    const SizedBox(height: GacelaTheme.vDivider),
                    Column(
                      children: [
                        gacelaListTile1(
                          progress: 0.3,
                          title: "Obstacle",
                          description: "Intervenez pour débloquer le passage",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                        gacelaListTile1(
                          cardColor: GacelaColors.gacelaPurple,
                          progress: 0.9,
                          title: "Obstacle",
                          description: "Intervenez pour débloquer le passage",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                        gacelaListTile1(
                          cardColor: GacelaColors.gacelaPurple,
                          progress: 0.6,
                          title: "Obstacle",
                          description: "Intervenez pour débloquer le passage",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                        gacelaListTile1(
                          cardColor: GacelaColors.gacelaPurple,
                          progress: 0.8,
                          title: "changement de pneu",
                          description: "se munir de kit",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                        gacelaListTile1(
                          cardColor: GacelaColors.gacelaPurple,
                          progress: 0.3,
                          title: "Changement de pneu ",
                          description: "se munir de kit",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: GacelaTheme.hPadding),
                child: Column(
                  children: [
                    const SizedBox(height: GacelaTheme.vDivider),
                    const SizedBox(height: GacelaTheme.vDivider),
                    Column(
                      children: [
                        gacelaListTile1(
                          progress: 0.3,
                          title: "Obstacle",
                          description: "Intervenez pour débloquer le passage",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                        gacelaListTile1(
                          cardColor: GacelaColors.gacelaPurple,
                          progress: 0.9,
                          title: "Obstacle",
                          description: "Intervenez pour débloquer le passage",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                        gacelaListTile1(
                          cardColor: GacelaColors.gacelaPurple,
                          progress: 0.6,
                          title: "Obstacle",
                          description: "Intervenez pour débloquer le passage",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                        gacelaListTile1(
                          cardColor: GacelaColors.gacelaPurple,
                          progress: 0.8,
                          title: "changement de pneu",
                          description: "se munir de kit",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                        gacelaListTile1(
                          cardColor: GacelaColors.gacelaPurple,
                          progress: 0.3,
                          title: "Changement de pneu ",
                          description: "se munir de kit",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: GacelaTheme.hPadding),
                child: Column(
                  children: [
                    const SizedBox(height: GacelaTheme.vDivider),
                    const SizedBox(height: GacelaTheme.vDivider),
                    Column(
                      children: [
                        gacelaListTile1(
                          progress: 0.3,
                          title: "Obstacle",
                          description: "Intervenez pour débloquer le passage",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                        gacelaListTile1(
                          cardColor: GacelaColors.gacelaPurple,
                          progress: 0.9,
                          title: "Obstacle",
                          description: "Intervenez pour débloquer le passage",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                        gacelaListTile1(
                          cardColor: GacelaColors.gacelaPurple,
                          progress: 0.6,
                          title: "Obstacle",
                          description: "Intervenez pour débloquer le passage",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                        gacelaListTile1(
                          cardColor: GacelaColors.gacelaPurple,
                          progress: 0.8,
                          title: "changement de pneu",
                          description: "se munir de kit",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                        gacelaListTile1(
                          cardColor: GacelaColors.gacelaPurple,
                          progress: 0.3,
                          title: "Changement de pneu ",
                          description: "se munir de kit",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: GacelaTheme.hPadding),
                child: Column(
                  children: [
                    const SizedBox(height: GacelaTheme.vDivider),
                    const SizedBox(height: GacelaTheme.vDivider),
                    Column(
                      children: [
                        gacelaListTile1(
                          progress: 0.3,
                          title: "Obstacle",
                          description: "Intervenez pour débloquer le passage",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                        gacelaListTile1(
                          cardColor: GacelaColors.gacelaPurple,
                          progress: 0.9,
                          title: "Obstacle",
                          description: "Intervenez pour débloquer le passage",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                        gacelaListTile1(
                          cardColor: GacelaColors.gacelaPurple,
                          progress: 0.6,
                          title: "Obstacle",
                          description: "Intervenez pour débloquer le passage",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                        gacelaListTile1(
                          cardColor: GacelaColors.gacelaPurple,
                          progress: 0.8,
                          title: "changement de pneu",
                          description: "se munir de kit",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                        gacelaListTile1(
                          cardColor: GacelaColors.gacelaPurple,
                          progress: 0.3,
                          title: "Changement de pneu ",
                          description: "se munir de kit",
                          onPressed: () async => await Navigator.pushNamed(
                              context, Taskdetails.route),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
