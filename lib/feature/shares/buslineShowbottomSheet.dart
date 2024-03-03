import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riide/core/config/get_it.dart';
import 'package:riide/core/resources/color.dart';
import 'package:riide/core/resources/font.dart';

Future buslineShowBottomSheet(context) async {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: MainColor().appPrimerySolidBlack,
    builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 40 / 100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              //white box
              const Center(
                child: SizedBox(
                  width: 50,
                  height: 10,
                ),
              ),
              Center(
                child: Container(
                  height: 10,
                  width: 70,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: MainColor().appWhite,
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
              const Center(
                child: SizedBox(
                  width: 50,
                  height: 10,
                ),
              ),
              //*********/
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  //list.length
                  padding: const EdgeInsets.all(4.0),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: MainColor().appPrimeryTranspertensBlack,
                            borderRadius: BorderRadius.circular(16)),
                        child: ListTile(
                          focusColor: MainColor().appPrimerySolidBlack,
                          contentPadding: const EdgeInsets.all(16.0),
                          //
                          leading: FaIcon(
                              size: 45,
                              FontAwesomeIcons.bus,
                              color: MainColor().iconsgray),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'vertex',
                                style: RiideFontStyle().line1TextStyle(),
                              ),
                              Text(
                                'bus line id',
                                style: RiideFontStyle().line2TextStyle(),
                              )
                            ],
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'price',
                                style: RiideFontStyle().line1TextStyle(),
                              ),
                              Text(
                                'time of upload',
                                style: RiideFontStyle().line2TextStyle(),
                              )
                            ],
                          ),
                          //this is habd
                          onTap: config,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
