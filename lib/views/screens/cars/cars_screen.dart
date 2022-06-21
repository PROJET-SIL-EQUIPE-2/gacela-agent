import 'package:flutter/material.dart';
import 'package:gacela_am/config/theme/colors.dart';
import 'package:gacela_am/config/theme/theme.dart';
import 'package:gacela_am/providers/auth_provider.dart';
import 'package:gacela_am/providers/cars_provider.dart';
import 'package:gacela_am/views/screens/cars/car_details_screen.dart';
import 'package:provider/provider.dart';

class CarsScreen extends StatefulWidget {
  static const route = "/";
  const CarsScreen({Key? key}) : super(key: key);

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CarsProvider>(context, listen: false).getAssignedCars(
        Provider.of<AuthProvider>(context, listen: false).user?.email);
  }

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
      body: Consumer<CarsProvider>(builder: (context, provider, _) {
        return provider.carsList.isEmpty
            ? const Center(child: Text("No cars assigned"))
            : ListView(
                children: provider.carsList
                    .map(
                      (car) => GacelaCarListItemWidget(
                        carName: "Gacela Car",
                        carNumber: "${car.matricule}",
                        carType:
                            "Locked: ${car.locked != null && car.locked == true ? "Oui" : "Non"}",
                        imageUrl: 'assets/images/car1.png',
                        onTap: () => Navigator.pushNamed(
                            context, CarDetailsScreen.route,
                            arguments: car),
                      ),
                    )
                    .toList(),
              );
      }),
    );
  }
}

class GacelaCarListItemWidget extends StatelessWidget {
  final String carName;
  final String carNumber;
  final String carType;
  final String imageUrl;
  final void Function()? onTap;
  GacelaCarListItemWidget({
    Key? key,
    required this.carName,
    required this.carNumber,
    required this.carType,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    const gridSize = 8;
    return GestureDetector(
      onTap: onTap,
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
                          horizontal: 5, vertical: 2),
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
