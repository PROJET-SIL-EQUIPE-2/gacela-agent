import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gacela_am/config/theme/colors.dart';
import 'package:gacela_am/config/theme/theme.dart';
import 'package:percent_indicator/percent_indicator.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:flutter_slidable/flutter_slidable.dart';

Widget gacelaCard({
  Color color = GacelaColors.gacelaPurple,
  double borderRadius = 25,
  double? height,
  double? width,
  required Widget child,
  EdgeInsets padding = const EdgeInsets.all(10.0),
}) =>
    Container(
      padding: padding,
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
      ),
      child: child,
    );

Widget gacelaListTile({
  // Value between 0 and 1
  required double progress,
  Color cardColor = GacelaColors.gacelaLightOrange,
  double radius = 36,
  required String title,
  required String description,

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
    margin: const EdgeInsets.only(bottom: GacelaTheme.vDivider),
    decoration: BoxDecoration(
      color: cardColor,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: ListTile(
      leading: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: CircularPercentIndicator(
          backgroundColor: Colors.white,
          radius: 20,
          lineWidth: 5.0,
          percent: progress,
          center: Text(
            "${(progress * 100).toStringAsFixed(0)}%",
            style: TextStyle(color: progressColor, fontWeight: FontWeight.w600),
          ),
          progressColor: progressColor,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: GacelaColors.gacelaDeepBlue, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        description,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}

Widget gacelaListTile1(
    {
    // Value between 0 and 1

    required double progress,
    Color cardColor = GacelaColors.gacelaLightOrange,
    double radius = 36,
    required String title,
    required String description,
    required void Function()? onPressed,
    void Function()? done,
    void Function()? increment

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

  // ignore: unnecessary_new
  return new Slidable(
    // ignore: prefer_const_constructors
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.25,
    child: Container(
      margin: const EdgeInsets.only(bottom: GacelaTheme.vDivider),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ListTile(
        leading: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: CircularPercentIndicator(
            backgroundColor: Colors.white,
            radius: 25,
            lineWidth: 5.0,
            percent: progress,
            center: Text(
              "${(progress * 100).toStringAsFixed(0)}%",
              style:
                  TextStyle(color: progressColor, fontWeight: FontWeight.w600),
            ),
            progressColor: progressColor,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
              color: GacelaColors.gacelaDeepBlue, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          description,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: onPressed,
      ),
    ),
    // ignore: prefer_const_literals_to_create_immutables
    secondaryActions: <Widget>[
      // ignore: prefer_const_constructors
      IconSlideAction(
        caption: 'check',
        icon: Icons.check,
        onTap: done,
      ),
      IconSlideAction(caption: 'add', icon: Icons.add, onTap: increment),
    ],
  );
}

Widget gacelaNotificationTile({
  bool isNew = false,
  required String title,
  required String description,
  void Function()? onTap,
}) =>
    ListTile(
      onTap: onTap,
      tileColor: isNew ? GacelaColors.gacelaLightYellow : Colors.grey[50],
      isThreeLine: true,
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: const TextStyle(fontSize: 12),
          ),
          const Text(
            "Voir details >",
            style: TextStyle(color: GacelaColors.gacelaBlue, fontSize: 12),
          )
        ],
      ),
      trailing: const Text(
        "à l'instant",
        style: TextStyle(color: GacelaColors.gacelaRed, fontSize: 12),
      ),
      // ignore: prefer_const_constructors
      leading: Icon(Icons.error_outline_rounded),
    );

Widget circumstance({
  // Value between 0 and 1

  Color cardColor: GacelaColors.gacelaPurple,
  double radius = 22,
  required String title,
  required String description,
  required String IconName,
/*   required IconData icon ,
 */
  required void Function()? onPressed,

// ignore: curly_braces_in_flow_control_structures
}) {
  // ignore: unnecessary_new
  return new Container(
    margin: const EdgeInsets.only(bottom: GacelaTheme.vDivider),
    decoration: BoxDecoration(
      color: cardColor,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: ListTile(
      leading: SvgPicture.asset(
        IconName,
        color: GacelaColors.gacelaDeepBlue,
        height: 30,
        width: 30,

        /*  data: new IconThemeData(
                    color: Colors.white,
                    ), 
                child:  Icon(
                  icon , 
                  color: Colors.black,
                  size : 40 ,
                  ), */
      ),
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        description,
        overflow: TextOverflow.ellipsis,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    ),
  );
  // ignore: prefer_const_literals_to_create_immutables
}
