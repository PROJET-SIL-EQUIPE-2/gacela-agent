import 'package:flutter/material.dart';
import 'package:gacela_am/config/theme/colors.dart';
import 'package:gacela_am/config/theme/theme.dart';
import 'package:gacela_am/models/support.dart';
import 'package:gacela_am/views/widgets/gacela_cards.dart';

import '../../widgets/gacela_details_tache.dart';

class SupportDetails extends StatelessWidget {
  static const route = "/support-details";
  final Support support;
  const SupportDetails({Key? key, required this.support}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Demande de support",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: GacelaTheme.hPadding),
        child: ListView(
          children: [
            Text(
              "Locataire:",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 5),
            gacelaCard(
              borderRadius: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Nom et Prénom:"),
                          Text(
                            "${support.locataire?.familyName} ${support.locataire?.name}",
                            style: const TextStyle(
                              fontSize: 17,
                              color: GacelaColors.gacelaDeepBlue,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${support.locataire?.email}"),
                          Text("${support.locataire?.phoneNumber}"),
                        ],
                      )
                    ]),
              ),
            ),
            const SizedBox(height: GacelaTheme.vDivider),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "Support type: ",
                style: Theme.of(context).textTheme.headline3,
              ),
              TextSpan(
                text: "${support.typeSupport}",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: GacelaColors.gacelaBlue),
              ),
            ])),
            const SizedBox(height: GacelaTheme.vDivider),
            Text(
              "message:",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 5),
            gacelaCard(
                borderRadius: 6,
                color: GacelaColors.gacelaLightPurple,
                child: Text("${support.message}")),
            const SizedBox(height: 5),
            Text(
              "Date: ${support.dateDemande?.toLocal()}",
              textAlign: TextAlign.end,
            ),
            const SizedBox(height: GacelaTheme.vDivider),
            Text(
              "Vehicule:",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 5),
            gacelaDescription1(
              title: "Matricule: ${support.vehicule?.matricule}",
              type: "${support.vehicule?.typeVehicule}",
              img: Image.asset(
                  support.vehicule?.carPhoto ?? "assets/images/honda1.jpg"),
            ),
            const SizedBox(height: GacelaTheme.vDivider),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "Status: ",
                style: Theme.of(context).textTheme.headline3,
              ),
              TextSpan(
                text: "${support.vehicule?.etat}",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: GacelaColors.gacelaBlue),
              ),
            ])),
            const SizedBox(height: GacelaTheme.vDivider),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("kilometrage: ${support.vehicule?.kilometrage}km"),
              Text("Disponible: ${support.vehicule?.disponible}"),
            ]),
            Text("Locked: ${support.vehicule?.locked}"),
          ],
        ),
      ),
    );
  }
}
