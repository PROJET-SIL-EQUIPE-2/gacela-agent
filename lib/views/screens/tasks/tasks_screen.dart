import 'package:flutter/material.dart';
import 'package:gacela_am/config/theme/theme.dart';
import 'package:gacela_am/models/errors/failure.dart';
import 'package:gacela_am/models/task.dart';
import 'package:gacela_am/providers/auth_provider.dart';
import 'package:gacela_am/providers/support_provider.dart';
import 'package:gacela_am/providers/tasks_provider.dart';
import 'package:gacela_am/views/screens/tasks/support_details.dart';
import 'package:gacela_am/views/screens/tasks/task_details.dart';
import 'package:provider/provider.dart';
import '../../../config/theme/colors.dart';
import '../../widgets.dart';

class TasksScreen extends StatefulWidget {
  static const route = "/";
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  bool isLoading = false;
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
                Tab(text: "élémentaire"),
                Tab(text: "Support"),
              ]),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Mes taches",
            style: Theme.of(context).textTheme.headline2,
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
                    Consumer<TasksProvider>(
                        builder: (context, tasksProvider, _) {
                      return FutureBuilder(
                          future: tasksProvider.getAllTasks(
                              Provider.of<AuthProvider>(context, listen: false)
                                  .token,
                              Provider.of<AuthProvider>(context, listen: false)
                                  .user
                                  ?.id),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text(snapshot.error.toString()));
                            }
                            if (tasksProvider.tasks.isEmpty) {
                              return const Text("There's no task");
                            }
                            return Column(
                              children: tasksProvider.tasks
                                  .map(
                                    (task) => gacelaListTile1(
                                      done: () async => await tasksProvider
                                          .setTaskToCompleted(task),
                                      increment: (() async =>
                                          await tasksProvider
                                              .updateTaskProgress(task)),
                                      progress: task.progress != null
                                          ? task.progress! / 100
                                          : 0,
                                      cardColor: task.important == true
                                          ? GacelaColors.gacelaOrange
                                          : GacelaColors.gacelaPurple,
                                      title: "Task",
                                      description: "${task.description}",
                                      onPressed: () async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        final int index = await tasksProvider
                                            .getTaskDetails(task);
                                        setState(() {
                                          isLoading = false;
                                        });
                                        await Navigator.pushNamed(
                                            context, Taskdetails.route,
                                            arguments:
                                                tasksProvider.tasks[index]);
                                      },
                                    ),
                                  )
                                  .toList(),
                            );
                          });
                    }),
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
                    Consumer<TasksProvider>(
                        builder: (context, tasksProvider, _) {
                      return Column(
                        children: tasksProvider.tasks
                            .where((task) => (task.important == true))
                            .map(
                              (task) => gacelaListTile1(
                                done: () async => await tasksProvider
                                    .setTaskToCompleted(task),
                                increment: (() async => await tasksProvider
                                    .updateTaskProgress(task)),
                                progress: task.progress != null
                                    ? task.progress! / 100
                                    : 0,
                                cardColor: GacelaColors.gacelaOrange,
                                title: "Task",
                                description: "${task.description}",
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  final int index =
                                      await tasksProvider.getTaskDetails(task);
                                  setState(() {
                                    isLoading = false;
                                  });
                                  await Navigator.pushNamed(
                                      context, Taskdetails.route,
                                      arguments: tasksProvider.tasks[index]);
                                },
                              ),
                            )
                            .toList(),
                      );
                    }),
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
                    Consumer<TasksProvider>(
                        builder: (context, tasksProvider, _) {
                      return Column(
                        children: tasksProvider.tasks
                            .where((task) => (task.important != true))
                            .map(
                              (task) => gacelaListTile1(
                                done: () async => await tasksProvider
                                    .setTaskToCompleted(task),
                                increment: (() async => await tasksProvider
                                    .updateTaskProgress(task)),
                                progress: task.progress != null
                                    ? task.progress! / 100
                                    : 0,
                                cardColor: GacelaColors.gacelaPurple,
                                title: "Task",
                                description: "${task.description}",
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  final int index =
                                      await tasksProvider.getTaskDetails(task);
                                  setState(() {
                                    isLoading = false;
                                  });
                                  await Navigator.pushNamed(
                                      context, Taskdetails.route,
                                      arguments: tasksProvider.tasks[index]);
                                },
                              ),
                            )
                            .toList(),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          ListView(
            children: [
              const SizedBox(height: GacelaTheme.vDivider),
              Column(
                children: [
                  Consumer<SupportProvider>(
                      builder: (context, supportProvider, _) {
                    return FutureBuilder(
                        future: supportProvider.getDemandesSupport(
                            Provider.of<AuthProvider>(context, listen: false)
                                .user
                                ?.id),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(
                              snapshot.error.toString(),
                              style: const TextStyle(
                                  color: GacelaColors.gacelaRed),
                            ));
                          }
                          if (supportProvider.supports.isEmpty) {
                            return const Text("There's no demande");
                          }
                          return Column(
                            children: supportProvider.supports
                                .map((support) => Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                          color: Colors.black12,
                                          width: 1.0,
                                        ),
                                      )),
                                      child: ListTile(
                                        onTap: () async {
                                          // mark as read
                                          await supportProvider
                                              .readDemandesSupport(support);
                                          await Navigator.of(context).pushNamed(
                                              SupportDetails.route,
                                              arguments: support);
                                        },
                                        trailing: const Icon(
                                            Icons.keyboard_arrow_right),
                                        tileColor: support.read == true
                                            ? Colors.white
                                            : GacelaColors.gacelaLightPurple,
                                        leading: const Icon(Icons.help),
                                        title: const Text(
                                          "Demande de support",
                                        ),
                                        subtitle: Text("${support.message}"),
                                      ),
                                    ))
                                .toList(),
                          );
                        });
                  })
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
