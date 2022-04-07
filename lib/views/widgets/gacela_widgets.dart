import 'package:flutter/material.dart';
import '../../config/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gacela_am/config/theme/colors.dart';
import 'package:gacela_am/config/theme/theme.dart';
import 'package:percent_indicator/percent_indicator.dart';

Widget gacelaButton({
  required void Function()? onPressed,
  required String text,
  Color color = GacelaColors.gacelaBlue,
  bool showShadow = true,
  Color textColor = Colors.white,
  double radius = 35,
  double hPadding = 16,
  double vPadding = 14,
  Icon? icon,
}) =>
    GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.34),
                    offset: const Offset(1, 4),
                    blurRadius: 30.0,
                  )
                ]
              : null,
        ),
        child: Center(
          child: icon == null
              ? Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    icon,
                  ],
                ),
        ),
      ),
    );

/// For forms only
Widget gacelaTextFormField({
  String? hintText,
  String? labelText,
  String? errorText,
  TextEditingController? controller,
  TextInputType? keyboardType,
  bool obscureText = false,
  String? Function(String?)? validator,
  void Function(String?)? onSaved,
  void Function(String?)? onChanged,
  double radius = 20,
  EdgeInsetsGeometry? padding,
  int? maxLength,
  String? value,
}) =>
    TextFormField(
      maxLength: maxLength,
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: padding,
        hintText: hintText,
        labelText: labelText,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: GacelaColors.gacelaGrey,
        ),
      ),
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
      initialValue: value,
    );

// Use it outside forms
Widget gacelaTextField({
  String? hintText,
  String? labelText,
  String? errorText,
  TextEditingController? controller,
  TextInputType? keyboardType,
  bool obscureText = false,
  String? Function(String?)? validator,
  void Function(String?)? onSaved,
  void Function(String?)? onChanged,
  double radius = 20,
  EdgeInsetsGeometry? padding,
  int? maxLength,
  bool enabled = true,
  String? initialValue,
}) =>
    TextFormField(
      enabled: enabled,
      initialValue: initialValue,
      maxLength: maxLength,
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: padding,
        hintText: hintText,
        labelText: labelText,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: GacelaColors.gacelaGrey,
        ),
      ),
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
    );

Widget gacelaLinkButton({
  required String text,
  Color? color = GacelaColors.gacelaBlue,
  required void Function()? onPressed,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w300,
        ),
      ),
    );

Widget gacelaCircleButton({
  required void Function()? onPressed,
  required Widget child,
  double radius = 60,
}) =>
    GestureDetector(
      onTap: onPressed,
      child: Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3),
              blurRadius: 10,
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Center(
          child: child,
        ),
      ),
    );

Widget gacelaTextButton({
  required String text,
  Color? color = GacelaColors.gacelaDeepBlue,
  required void Function()? onPressed,
  required Icon? icon, // change it to an svg ?! IDK
}) =>
    TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (icon != null) icon,
        ],
      ),
    );

Widget gacelaErrorText({required String text}) => Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: GacelaColors.gacelaRed,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );

Widget gacelaSuccessText({required String text}) => Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: GacelaColors.gacelaGreen,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check,
            color: Colors.white,
          ),
          Flexible(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );

Widget gacelaAlertsTile({
  required String title,
  required String description,
  double radius = 26,
  Color containerClor = GacelaColors.gacelaLightYellow,
  void Function()? onTap,
}) {
  return Container(
    margin: const EdgeInsets.only(
        bottom: GacelaTheme.vDivider,
        left: GacelaTheme.hPadding,
        right: GacelaTheme.hPadding),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: containerClor,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.6),
          offset: const Offset(
            5.0,
            5.0,
          ),
          blurRadius: 8.0,
          spreadRadius: 2.0,
        ), //BoxShadow
      ],
    ),
    child: ListTile(
      onTap: onTap,
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
            style: TextStyle(
              color: GacelaColors.gacelaBlue,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
      trailing: Text(
        "Il y a une heure",
        style: TextStyle(color: GacelaColors.gacelaRed, fontSize: 12),
      ),
    ),
  );
}
