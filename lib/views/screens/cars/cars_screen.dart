import 'package:flutter/material.dart';
import 'package:gacela_am/config/theme/colors.dart';

class CarsScreen extends StatelessWidget {
  static const route = "/";
  const CarsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Cars Screen"),
      // ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  // ignore: avoid_print
                  onTap: () => {print("clicked")},
                  child: const Icon(
                    Icons.chevron_left_sharp,
                    color: GacelaColors.gacelaDeepBlue,
                    size: 58,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: const Text(
                    "Automobiles prises en \ncharges par vous",
                    style: TextStyle(
                      color: GacelaColors.gacelaDeepBlue,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Expanded(
              child: ListView(
                children: const [
                  GacelaCarListItemWidget(
                    carName: "Hyundai classic",
                    carNumber: "1232498887 349984",
                    carType: "Classic",
                    imageUrl: 'images/car1.png',
                  ),
                  GacelaCarListItemWidget(
                    carName: "Hyundai classic",
                    carNumber: "1232498887 349984",
                    carType: "Classic",
                    imageUrl: 'images/car1.png',
                  ),
                  GacelaCarListItemWidget(
                    carName: "Hyundai classic",
                    carNumber: "1232498887 349984",
                    carType: "Classic",
                    imageUrl: 'images/car1.png',
                  ),
                  GacelaCarListItemWidget(
                    carName: "Hyundai classic",
                    carNumber: "1232498887 349984",
                    carType: "Classic",
                    imageUrl: 'images/car1.png',
                  ),
                  GacelaCarListItemWidget(
                    carName: "Hyundai classic",
                    carNumber: "1232498887 349984",
                    carType: "Classic",
                    imageUrl: 'images/car1.png',
                  ),
                  GacelaCarListItemWidget(
                    carName: "Hyundai classic",
                    carNumber: "1232498887 349984",
                    carType: "Classic",
                    imageUrl: 'images/car1.png',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GacelaCarListItemWidget extends StatelessWidget {
  final String carName;
  final String carNumber;
  final String carType;
  final String imageUrl;
  const GacelaCarListItemWidget(
      {Key? key,
      required this.carName,
      required this.carNumber,
      required this.carType,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    const gridSize = 8;
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xFFf5f1ef),
        borderRadius: BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: GacelaColors.gacelaGrey,
            spreadRadius: 0.1,
            offset: Offset(0, 10),
            blurRadius: 7,
          ),
        ],
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image
          Container(
              width: width / gridSize,
              margin: const EdgeInsets.only(right: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imageUrl,
                ),
              )),
          // Desc
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Container(
                  width: 2 * width / gridSize,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text(
                    carName,
                    style: const TextStyle(
                      color: GacelaColors.gacelaDeepBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                //
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // icon
                      Container(
                        child: const Icon(
                          Icons.car_rental,
                        ),
                      ),
                      // number
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            carNumber,
                          ),
                        ),
                      ),
                      // Badge
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          carType,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        decoration: const BoxDecoration(
                          color: GacelaColors.gacelaBlue,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: width / gridSize,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
