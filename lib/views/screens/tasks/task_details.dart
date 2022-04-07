import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gacela_am/assets/MyIcons.dart';
import 'package:gacela_am/views/widgets/gacela_details_tache.dart';
import 'package:intl/intl.dart';
import '../../../config/theme/colors.dart';
import '../../../config/theme/theme.dart';
import '../../../assets/MyIcons.dart';

class Taskdetails extends StatelessWidget {
  static const route = "/details_tache";
  const Taskdetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Changement de pneu",
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
        child: Padding(
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
                      DateFormat('KK:mm, yyyy/MM/dd').format(DateTime.now()),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      gacelaEtatText1(text: "En progrès"),
                      gacelaEtatText1(text: "élémentaire"),
                    ],
                  ),
                  Container(
                    child: gacelapercent1(progress: 0.3, radius: 50),
                  )
                ],
              ),
              const SizedBox(
                height: GacelaTheme.vDivider,
              ),
              gacelaLocation(
                  icon: const Icon(
                    FontAwesomeIcons.locationPin,
                  ),
                  text: "Sidi Youcef, Beni messous",
                  left: GacelaTheme.vDivider,
                  top: GacelaTheme.vDivider),
              gacelaLocation(
                  icon: const Icon(
                    MyIcons.vectoro,
                    // Icons.gps_off_sharp,
                  ),
                  text: "36.78596, 47.123478",
                  left: GacelaTheme.vDivider,
                  top: GacelaTheme.vDivider / 2 + 2),
              const SizedBox(
                height: GacelaTheme.vDivider + 5,
              ),
              gacelaDescription(
                  title: "title",
                  description:
                      " réparation.note: se munit de kit....................."
                      "réparation.note: se munit de kit"
                      "réparation.note: se munit de kit"
                      "réparation.note: se munit de kit"
                      "réparation.note: se munit de kit"
                      "réparation.note: se munit de kit....................."
                      "réparation.note: se munit de kit"),
              gacelaDescription1(
                  title: "Hunday Accent",
                  type: "classic",
                  img: Image.asset("assets/images/honda1.jpg")),
            ],
          ),
        ),
      ),
    );
  }
}
