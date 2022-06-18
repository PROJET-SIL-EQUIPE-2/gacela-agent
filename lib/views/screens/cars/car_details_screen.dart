// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gacela_am/config/theme/colors.dart';
import 'package:gacela_am/config/theme/theme.dart';
import 'package:gacela_am/models/vehicule.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../config/theme/colors.dart';
import '../../widgets.dart';

class CarDetailsScreen extends StatefulWidget {
  static const route = "/detail";
  final Vehicule? car;
  const CarDetailsScreen({Key? key, required this.car}) : super(key: key);

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Les infos d'automobiles",
          style: Theme.of(context).textTheme.headline2,
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(Icons.arrow_back_ios),
          color: GacelaColors.gacelaDeepBlue,
        ),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text("Gacela Car",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: GacelaColors.gacelaDeepBlue)),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/car1.png",
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                ),
              ],
            ),
            TabBar(
              unselectedLabelColor: GacelaColors.gacelaDeepBlue,
              labelColor: GacelaColors.gacelaDeepBlue,
              indicatorColor: GacelaColors.gacelaDeepBlue,
              tabs: const [
                Tab(
                  child: Text(
                    "Informations",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Tab(
                  child: Text(
                    "Circumstances",
                    style: TextStyle(fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Tab(
                  child: Text(
                    "Alerts",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      const SizedBox(height: GacelaTheme.vPadding),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: GacelaTheme.hPadding,
                        ),
                        child: Row(
                          children: [
                            // ignore: todo
                            // TODO: Change this to SVG picture
                            const Icon(
                              Icons.car_rental,
                              color: GacelaColors.gacelaDarkGrey,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "${widget.car?.matricule}",
                              style: const TextStyle(
                                fontSize: 20,
                                color: GacelaColors.gacelaDarkGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        clipBehavior: Clip.hardEdge,
                        margin: const EdgeInsets.symmetric(
                            vertical: GacelaTheme.vDivider,
                            horizontal: GacelaTheme.hPadding),
                        height: MediaQuery.of(context).size.height / 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: const GoogleMap(
                          zoomControlsEnabled: false,
                          markers: {},
                          initialCameraPosition: CameraPosition(
                            target: LatLng(36.35, 6.6),
                            zoom: 14,
                          ),
                        ),
                      ),
                      ///////

                      // Information
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: GacelaTheme.hPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            CarInfoWidget(
                                infoType: "Temperature",
                                value: "value",
                                unity: "c"),
                            CarInfoWidget(
                                infoType: "Speed",
                                value: "value",
                                unity: "km/h")
                          ],
                        ),
                      ),
                      const SizedBox(height: GacelaTheme.vDivider),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: GacelaTheme.hPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            CarInfoWidget(
                                infoType: "Charge", value: "value", unity: "%"),
                            CarInfoWidget(
                                infoType: "location",
                                value: "lat,lng",
                                unity: "")
                          ],
                        ),
                      ),
                      const SizedBox(height: GacelaTheme.vPadding),
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
                            Column(
                              children: [
                                circumstance(
                                  title: "Obstacle",
                                  description: "Barrière",
                                  IconName: "assets/icons/obstacle.svg",
                                  onPressed: () => {},
                                ),
                                circumstance(
                                  title: "Pneus",
                                  description: "Crevés",
                                  IconName: "assets/icons/pneu.svg",
                                  onPressed: () => {},
                                ),
                                circumstance(
                                  title: "En retour vers le parc",
                                  description: "3 KM restants",
                                  IconName: "assets/icons/enRetour.svg",
                                  onPressed: () => {},
                                ),
                                circumstance(
                                  title: "Route",
                                  description: "En circulation",
                                  IconName: "assets/icons/route.svg",
                                  onPressed: () => {},
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
                      const SizedBox(height: GacelaTheme.vDivider),
                      gacelaAlertsTile(
                        title: "Obstacle",
                        description:
                            "l’automobile N05 est bloqué dans le boulevard de HASSIBA Ben Bouali rue N16 ...",
                        onTap: () {},
                      ),
                      gacelaAlertsTile(
                        title: "Obstacle",
                        description:
                            "l’automobile N05 est bloqué dans le boulevard de HASSIBA Ben Bouali rue N16 ...",
                        onTap: () {},
                      ),
                      gacelaAlertsTile(
                        title: "Obstacle",
                        description:
                            "l’automobile N05 est bloqué dans le boulevard de HASSIBA Ben Bouali rue N16 ...",
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarInfoWidget extends StatelessWidget {
  final String infoType;
  final String value;
  final String unity;
  const CarInfoWidget(
      {Key? key,
      required this.infoType,
      required this.value,
      required this.unity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
        color: GacelaColors.gacelaPurple,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            infoType,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(2),
                child: const Icon(
                  Icons.timer_outlined,
                  color: Color.fromARGB(255, 22, 24, 36),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(2),
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(2),
                child: Text(
                  unity,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
