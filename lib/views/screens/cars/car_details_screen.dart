// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gacela_am/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gacela_am/config/theme/theme.dart';
import 'package:gacela_am/views/screens/home/home_screen.dart';
import '../../../config/theme/colors.dart';
import '../../widgets.dart';

class CarDetailsScreen extends StatefulWidget {
  CarDetailsScreen({Key? key}) : super(key: key);

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
        title: const Text(
          "Les infos d'automobiles",
          style: TextStyle(
            color: GacelaColors.gacelaDeepBlue,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
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
          horizontal: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                children: [
                  const Text(
                    "Hyundai classic",
                    style: TextStyle(
                      color: GacelaColors.gacelaDeepBlue,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Image.asset(
                      "images/car1.png",
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              unselectedLabelColor: GacelaColors.gacelaDeepBlue,
              labelColor: GacelaColors.gacelaDeepBlue,
              tabs: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Informations",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Circumstances',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Alerts',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // ignore: todo
                              // TODO: Change this to SVG picture
                              Container(
                                  margin: const EdgeInsets.only(right: 8.0),
                                  child: const Icon(
                                    Icons.car_rental,
                                    color: GacelaColors.gacelaDarkGrey,
                                  )),
                              const Text(
                                "23454546566677 43433",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: GacelaColors.gacelaDarkGrey,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(right: 8.0),
                                  child: const Icon(
                                    Icons.map,
                                    color: GacelaColors.gacelaDarkGrey,
                                  )),
                              const Text(
                                "Sidi youcef, Beni messous",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: GacelaColors.gacelaDarkGrey,
                                ),
                              ),
                            ],
                          ),
                          // Map

                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 8.0,
                            ),
                            height: MediaQuery.of(context).size.height / 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              color: GacelaColors.gacelaGreen,
                            ),
                          ),

                          // Information
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  CarInfoWidget(
                                      infoType: "infoType",
                                      value: "value",
                                      unity: "unity"),
                                  CarInfoWidget(
                                      infoType: "infoType",
                                      value: "value",
                                      unity: "unity")
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  CarInfoWidget(
                                      infoType: "infoType",
                                      value: "value",
                                      unity: "unity"),
                                  CarInfoWidget(
                                      infoType: "infoType",
                                      value: "value",
                                      unity: "unity")
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                  Container(
                    child: ListView(
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
                        circumstance(
                          title: "Obstacle",
                          description: "Barrière",
                          icon : Icons.circle,
                          onPressed : ()=> {} ,

                              
                        ),
                        circumstance(
                          title: "Pneus",
                          description: "Crevés",
                          icon : Icons.circle,
                          onPressed : ()=> {} ,


                          
                        ),
                        circumstance(
                          title: "En retour vers le parc",
                          description: "3 KM restants",
                          icon : Icons.circle,
                          onPressed : ()=> {} ,

                         
                        ),
                        circumstance(
                          title: "Route",
                          description: "En circulation",
                          icon : Icons.circle,
                          onPressed : ()=> {} ,
                         
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
                  ),
                  Container(
                    child: ListView(
            children: [
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





