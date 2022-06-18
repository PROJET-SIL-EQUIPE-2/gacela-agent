// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gacela_am/config/theme/theme.dart';
import '../../config/theme/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget gacelaEtatText1({
  required String text,
  double borderRadius = 36,
  double? height = 30,
  double? width = 120,
}) {
  Color color = GacelaColors.gacelaLightOrange;
  if (text == "En progrès") {
    color = GacelaColors.gacelaWarnignlight;
  } else if (text == "achevée") {
    color = GacelaColors.gacelaYellow;
  } else if (text == "achevée") {
    color = GacelaColors.gacelaYellow;
  } else if (text == "Important") {
    color = GacelaColors.gacelaOrange;
  } else if (text == "à faire") {
    color = GacelaColors.gacelaBlue;
  } else if (text == "Abondonnée") {
    color = GacelaColors.gacelaPurple;
  } else if (text == "à faire") {
    color = GacelaColors.gacelaBlue;
  } else if (text == "élémentaire") {
    color = GacelaColors.gacelaBluelight;
  }
  return Container(
    margin: const EdgeInsets.only(
        left: GacelaTheme.vDivider + 10, top: GacelaTheme.vDivider),
    padding: const EdgeInsets.only(left: GacelaTheme.vDivider),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 3),
          blurRadius: 10,
          color: Colors.black.withOpacity(0.1),
        ),
      ],
    ),
    width: width,
    height: height,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: GacelaColors.gacelaDeepBlue),
          ),
        )
      ],
    ),
  );
}

Widget gacelapercent1({
  // Value between 0 and 1
  required double progress,
  Color cardColor = GacelaColors.gacelaLightOrange,
  required double radius,

// ignore: curly_braces_in_flow_control_structures
}) {
  Color progressColor = GacelaColors.gacelaRed;

  if (progress <= 0.3) {
    progressColor = GacelaColors.gacelaRed;
  } else if (progress > 0.3 && progress < 0.7) {
    progressColor = GacelaColors.gacelaYellow;
  } else if (progress > 0.7) {
    progressColor = GacelaColors.gacelaGreen;
  }

  return Container(
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
      radius: radius,
      lineWidth: 20.0,
      percent: progress,
      center: Text(
        "${(progress * 100).toStringAsFixed(0)}%",
        style: TextStyle(
            color: progressColor, fontWeight: FontWeight.w600, fontSize: 20),
      ),
      progressColor: progressColor,
    ),
  );
}

Widget gacelaLocation({
  required Icon icon,
  required String text,
  required double left,
  required double top,
}) =>
    Container(
      margin: EdgeInsets.only(left: left, top: top),
      child: Row(
        children: [
          // ignore: unnecessary_null_comparison
          if (icon != null) icon,
          const SizedBox(
            width: 6,
          ),
          Text(text,
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontFamily: 'popins',
                fontSize: 17,
                color: GacelaColors.gacelaDeepBlue,
              )),
        ],
      ),
    );
Widget gacelaDescription({
  // Value between 0 and 1

  Color cardColor = Colors.white,
  double radius = 20,
  required String title,
  required String description,

// ignore: curly_braces_in_flow_control_structures
}) =>
    Container(
      margin: const EdgeInsets.only(bottom: GacelaTheme.vDivider),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(radius),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          // ignore: prefer_const_constructors
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
              color: GacelaColors.gacelaDeepBlue, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          description,
        ),
      ),
    );
Widget gacelaDescription1({
  // Value between 0 and 1

  Color cardColor = Colors.white,
  double radius = 20,
  required String title,
  required String type,
  required Image img,

// ignore: curly_braces_in_flow_control_structures
}) =>
    Container(
      margin: const EdgeInsets.only(bottom: GacelaTheme.vDivider),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(radius),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          // ignore: prefer_const_constructors
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
              color: GacelaColors.gacelaDeepBlue, fontWeight: FontWeight.w600),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    color: GacelaColors.gacelaGreyClair,
                    borderRadius: const BorderRadius.all(Radius.circular(36)),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      // ignore: prefer_const_constructors
                      BoxShadow(
                        color: GacelaColors.gacelagreylight,
                        blurRadius: 4,
                        // ignore: prefer_const_constructors
                        offset: Offset(4, 4), // Shadow position
                      ),
                    ],
                  ),
                  width: 100,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          type,
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              fontSize: 17,
                              color: GacelaColors.gacelaDeepBlue,
                              fontFamily: 'popins'),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Voir détails",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: GacelaColors.gacelaBlue,
                              fontFamily: 'Popins'),
                        )),
                    // ignore: prefer_const_constructors
                    Icon(
                      FontAwesomeIcons.angleRight,
                      color: GacelaColors.gacelaBlue,
                    )
                  ],
                ),
              ],
            ),
            img,
          ],
        ),
      ),
    );
Widget gacelaDetails1({
  required String title,
  required Image img,
  required String type,
  double radius = 20,
}) =>
    Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            // ignore: prefer_const_constructors
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: GacelaColors.gacelaDeepBlue,
                      fontFamily: 'popins'),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      padding: const EdgeInsets.only(left: 20),
                      // ignore: prefer_const_constructors
                      decoration: BoxDecoration(
                        color: GacelaColors.gacelaGreyClair,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(36)),
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          // ignore: prefer_const_constructors
                          BoxShadow(
                            color: GacelaColors.gacelagreylight,
                            blurRadius: 4,
                            // ignore: prefer_const_constructors
                            offset: Offset(4, 4), // Shadow position
                          ),
                        ],
                      ),
                      width: 100,
                      child: Row(
                        children: [
                          Center(
                            child: Text(
                              type,
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: GacelaColors.gacelaDeepBlue,
                                  fontFamily: 'popins'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Voir détails",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: GacelaColors.gacelaBlue,
                                  fontFamily: 'Popins'),
                            )),
                        // ignore: prefer_const_constructors
                        Icon(
                          FontAwesomeIcons.angleRight,
                          color: GacelaColors.gacelaBlue,
                        )
                      ],
                    ),
                  ],
                ),
                img,
              ],
            )
          ],
        ));
