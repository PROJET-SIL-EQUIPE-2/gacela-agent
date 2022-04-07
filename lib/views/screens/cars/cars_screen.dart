import 'package:flutter/material.dart';
import 'package:gacela_am/config/theme/colors.dart';
import 'package:gacela_am/config/theme/theme.dart';
import 'package:gacela_am/views/screens/cars/car_details_screen.dart';

class CarsScreen extends StatelessWidget {
  static const route = "/";
  const CarsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Automobiles prises en charges par vous",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: ListView(
        children: const [
          GacelaCarListItemWidget(
            carName: "Hyundai classic",
            carNumber: "1232498887 349984",
            carType: "Classic",
            imageUrl: 'assets/images/car1.png',
          ),
        ],
      ),
    );
  }
}

class GacelaCarListItemWidget extends StatelessWidget {
  final String carName;
  final String carNumber;
  final String carType;
  final String imageUrl;
  const GacelaCarListItemWidget({
    Key? key,
    required this.carName,
    required this.carNumber,
    required this.carType,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    const gridSize = 8;
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailsScreen(),
          ),
        ),
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        margin: const EdgeInsets.only(
            bottom: 10,
            left: GacelaTheme.hPadding,
            right: GacelaTheme.hPadding),
        decoration: BoxDecoration(
          color: const Color(0xFFf5f1ef),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: GacelaColors.gacelaGrey.withOpacity(0.3),
              spreadRadius: 1,
              offset: const Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 10),
            // Desc
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  carName,
                  style: const TextStyle(
                    color: GacelaColors.gacelaDeepBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 8),
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // icon
                    const Icon(
                      Icons.car_rental,
                    ),
                    // number
                    Text(carNumber),
                    const SizedBox(width: 4),
                    // Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 2),
                      child: Text(
                        carType,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: GacelaColors.gacelaBlue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
