import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gacela_am/models/task.dart';
import 'package:gacela_am/views/widgets/gacela_details_tache.dart';
import 'package:intl/intl.dart';
import '../../../config/theme/colors.dart';
import '../../../config/theme/theme.dart';

class Taskdetails extends StatelessWidget {
  static const route = "/details_tache";
  final Task task;
  const Taskdetails({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Tâche",
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: GacelaTheme.hPadding),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: GacelaTheme.vDivider + 10,
                    top: GacelaTheme.hPadding - 2),
                child: Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.clock,
                      color: GacelaColors.gacelaDeepBlue,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      DateFormat('KK:mm, yyyy/MM/dd')
                          .format(task.date ?? DateTime.now()),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      gacelaEtatText1(
                          text:
                              task.progress == 100 ? "Finished" : "En progrès"),
                      gacelaEtatText1(
                          text:
                              task.important == true ? "Important" : "Normal"),
                    ],
                  ),
                  Container(
                    child: gacelapercent1(
                        progress:
                            task.progress != null ? task.progress! / 100 : 0,
                        radius: 50),
                  )
                ],
              ),
              const SizedBox(height: GacelaTheme.vDivider),
              // gacelaLocation(
              //     icon: const Icon(
              //       FontAwesomeIcons.locationPin,
              //     ),
              //     text: "Sidi Youcef, Beni messous",
              //     left: GacelaTheme.vDivider,
              //     top: GacelaTheme.vDivider),
              // gacelaLocation(
              //     icon: const Icon(
              //       MyIcons.vectoro,
              //       // Icons.gps_off_sharp,
              //     ),
              //     text: "36.78596, 47.123478",
              //     left: GacelaTheme.vDivider,
              //     top: GacelaTheme.vDivider / 2 + 2),
              const SizedBox(height: GacelaTheme.vDivider + 5),
              gacelaDescription(
                  title: "Task description", description: """${task.description}
Is blocked: ${task.panne?.blocked}
Date: ${task.panne?.datePanne}
Charge: ${task.panne?.charge}%
Temperature: ${task.panne?.temperature}c°
Treated: ${task.panne?.treated}"""),
              gacelaDescription1(
                  title: "Matricule: ${task.panne?.vehicule?.matricule}",
                  type: "${task.panne?.vehicule?.typeVehicule}",
                  img: Image.asset(task.panne?.vehicule?.carPhoto ??
                      "assets/images/honda1.jpg")),
            ],
          ),
        ),
      ),
    );
  }
}
