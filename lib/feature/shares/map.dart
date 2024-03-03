import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:riide/core/resources/color.dart';

class RiideMap extends StatefulWidget {
  const RiideMap({super.key});

  @override
  State<RiideMap> createState() => _RiideMapState();
}

class _RiideMapState extends State<RiideMap> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 600,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                tileMode: TileMode.repeated,
                colors: [
                  Color.fromARGB(255, 7, 25, 19),
                  Colors.black,
                ],
              ),
            ),
            child: OpenStreetMapSearchAndPick(
                locationPinIconColor: MainColor().appGreen,
                buttonColor: MainColor().appGreen,
                buttonText: 'Set Current Location',
                onPicked: (pickedData) {
                  //DialogTheme().surfaceTintColor!.red;
                  print(pickedData.latLong.latitude);
                  print(pickedData.latLong.longitude);
                  print(pickedData.address);
                }),
          )
        ],
      ),
    );
  }
}
